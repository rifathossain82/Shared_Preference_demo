import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preference_demo/UserPage.dart';
import 'package:shared_preference_demo/utils/UserSimplePreference.dart';

Future main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await UserSimplePreferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
        scaffoldBackgroundColor: Color(0xff8c52ff),
        accentColor: Colors.lightGreen.shade400,
        unselectedWidgetColor: Colors.deepPurple.shade200,
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      home: UserPage(),
      title: 'SharedPreference Demo',
    );
  }
}
