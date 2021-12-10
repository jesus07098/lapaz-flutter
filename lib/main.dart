import 'package:flutter/material.dart';
import 'package:lapaz_app/src/pages/client/products/list/client_products_list_page.dart';
import 'package:lapaz_app/src/pages/delivery/orders/list/delivery_orders_list_pages.dart';

import 'package:lapaz_app/src/pages/login/login_page.dart';
import 'package:lapaz_app/src/pages/register/register_page.dart';
import 'package:lapaz_app/src/pages/restaurant/orders/list/restaurant_orders_list_page.dart';
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
        'restaurant/orders/list': (BuildContext context) => const RestaurantOrdersListPage(),
        'delivery/orders/list': (BuildContext context) => DeliveryOrdersListPage(),
      },
      theme:  ThemeData(
        primaryColor: ThemeColors.purple100,
        fontFamily: 'Mulish'
      )
    );
  }
}
