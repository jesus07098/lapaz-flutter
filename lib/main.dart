import 'package:flutter/material.dart';
import 'package:lapaz_app/src/login/login_page.dart';
import 'package:lapaz_app/src/utils/theme_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LaPaz App',
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => const LoginPage()
      },
      theme:  ThemeData(
        primaryColor: ThemeColors.purple100
      )
    );
  }
}
