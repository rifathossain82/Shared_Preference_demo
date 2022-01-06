import 'package:flutter/material.dart';
import 'package:shared_preference_demo/utils/UserSimplePreference.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}


final formKey = GlobalKey<FormState>();
String user_name = '';
String user_email = '';


class _UserPageState extends State<UserPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user_name=UserSimplePreferences.getUsername() ?? '';
    user_email=UserSimplePreferences.getUserEmail() ?? '';
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.save_alt,size: 100,),
                SizedBox(height: 20,),
                Text('Shared \nPreferences',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 42,),textAlign: TextAlign.center,),
                SizedBox(height: 20,),
                Align(alignment: Alignment.centerLeft,child: Text('Username',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400))),
                TextFormField(
                  initialValue: user_name,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: 'Your username',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (name){
                    setState(() {
                      user_name=name;
                    });
                  },
                ),
                SizedBox(height: 20,),
                Align(alignment: Alignment.centerLeft,child: Text('Email',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400))),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  initialValue: user_email,
                  decoration: InputDecoration(
                    hintText: 'Your email address',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (email){
                    setState(() {
                      user_email=email;
                    });
                  },
                ),
                SizedBox(height: 50,),
                Builder(builder: (context){
                  return FlatButton(
                    onPressed: ()async{
                      await UserSimplePreferences.setUsername(user_name);
                      await UserSimplePreferences.setUserEmail(user_email);

                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Successfully Save Data'),
                          )
                      );
                      setState(() {
                        user_name='';
                        user_email='';
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 80),
                      child: Text('Save',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 22),),
                    ),
                    color: Colors.white,
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
