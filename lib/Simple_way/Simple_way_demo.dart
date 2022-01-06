import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Simple_way_demo extends StatefulWidget {
  const Simple_way_demo({Key? key}) : super(key: key);

  @override
  _Simple_way_demoState createState() => _Simple_way_demoState();
}

class _Simple_way_demoState extends State<Simple_way_demo> {

  int counter=0;

  getvalue()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    setState(() {
      counter=sharedPreferences.getInt('counter') ?? 0;
    });
  }

  increementCounter()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    setState(() {
      counter++;
      sharedPreferences.setInt('counter', counter);
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getvalue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SharedPreferences'),
      ),
      body: Center(
        child: Text('Your click time = ${counter}'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          increementCounter();
        },
      ),
    );
  }
}
