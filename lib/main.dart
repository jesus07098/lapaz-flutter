import 'package:flutter/material.dart';
import 'package:lapaz_app/src/pages/client/products/list/client_products_list_page.dart';

import 'package:lapaz_app/src/pages/login/login_page.dart';
import 'package:lapaz_app/src/pages/register/register_page.dart';
import 'package:lapaz_app/src/utils/theme_colors.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

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
        'login': (BuildContext context) => const LoginPage(),
        'register': (BuildContext context) => const RegisterPage(),
        'client/products/list': (BuildContext context) => const ClientProductsListPage(),
      },
      theme:  ThemeData(
        primaryColor: ThemeColors.purple100,
        fontFamily: 'Mulish'
      )
    );
  }
}
