import 'package:flutter/material.dart';
import 'package:lapaz_app/src/pages/client/address/create/client_address_create_page.dart';
import 'package:lapaz_app/src/pages/client/address/list/client_address_list_page.dart';
import 'package:lapaz_app/src/pages/client/address/map/client_address_map_page.dart';
import 'package:lapaz_app/src/pages/client/orders/create/client_orders_create_page.dart';
import 'package:lapaz_app/src/pages/client/orders/list/client_orders_list_page.dart';
import 'package:lapaz_app/src/pages/client/products/list/client_products_list_page.dart';
import 'package:lapaz_app/src/pages/client/update/client_update_page.dart';
import 'package:lapaz_app/src/pages/delivery/orders/list/delivery_orders_list_pages.dart';

import 'package:lapaz_app/src/pages/login/login_page.dart';
import 'package:lapaz_app/src/pages/register/register_page.dart';
import 'package:lapaz_app/src/pages/restaurant/orders/list/restaurant_orders_list_page.dart';
import 'package:lapaz_app/src/pages/restaurant/products/create/restaurant_products_create_page.dart';
import 'package:lapaz_app/src/pages/roles/roles_page.dart';
import 'package:lapaz_app/src/utils/theme_colors.dart';

import 'src/pages/restaurant/categories/create/restaurant_categories_create_page.dart';

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
        'roles': (BuildContext context) =>  const RolesPage(),
        'client/products/list': (BuildContext context) => const ClientProductsListPage(),
        'client/update': (BuildContext context) => const ClientUpdatePage(),
        'restaurant/orders/list': (BuildContext context) => const RestaurantOrdersListPage(),
        'restaurant/categories/create': (BuildContext context) =>
              RestaurantCategoriesCreatePage(),
        'restaurant/products/create': (BuildContext context) =>
              const RestaurantProductsCreatePage(),
        'delivery/orders/list': (BuildContext context) => DeliveryOrdersListPage(),
        'client/orders/create': (BuildContext context) => ClientOrdersCreatePage(),
        'client/address/list': (BuildContext context) =>
              ClientAddressListPage(),
          'client/address/create': (BuildContext context) =>
              ClientAddressCreatePage(),
              'client/address/map': (BuildContext context) =>
              ClientAddressMapPage(),
               'client/orders/list': (BuildContext context) =>
              ClientOrdersListPage(),
      },
      theme:  ThemeData(
        primaryColor: ThemeColors.purple100,
        fontFamily: 'Mulish'
      )
    );
  }
}
