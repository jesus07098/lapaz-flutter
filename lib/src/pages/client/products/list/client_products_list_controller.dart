import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lapaz_app/src/models/category.dart';
import 'package:lapaz_app/src/models/product.dart';
import 'package:lapaz_app/src/models/users.dart';
import 'package:lapaz_app/src/pages/client/products/detail/client_products_detail_page.dart';
import 'package:lapaz_app/src/provider/categories_provider.dart';
import 'package:lapaz_app/src/provider/products_provider.dart';
import 'package:lapaz_app/src/utils/shared_pref.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';


class ClientProductsListController {
  BuildContext context;
  SharedPref _sharedPref =  SharedPref();
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  Function refresh;
  User user;
  CategoriesProvider _categoriesProvider = CategoriesProvider();
  ProductsProvider _productsProvider =  ProductsProvider();
  List<Category> categories = [];
  StreamController<String> streamController = StreamController();
  TextEditingController _searchController =  TextEditingController();

  Timer searchOnStoppedTyping;

  String productName = '';

  // PushNotificationsProvider pushNotificationsProvider =
  //      PushNotificationsProvider();

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    user = User.fromJson(await _sharedPref.read('user'));
    _categoriesProvider.init(context, user);
    _productsProvider.init(context, user);

    getCategories();
    refresh();
  }

  void onChangeText(String text) {
    const duration = Duration(
        milliseconds:
            800); // set the duration that you want call search() after that.
    if (searchOnStoppedTyping != null) {
      searchOnStoppedTyping.cancel();
      refresh();
    }

    searchOnStoppedTyping =  Timer(duration, () {
      productName = text;
      refresh();
      // getProducts(idCategory, text)
      print('TEXTO COMPLETO $text');
    });
  }

  Future<List<Product>> getProducts(
      String idCategory, String productName) async {
    if (productName.isEmpty) {
      return await _productsProvider.getByCategory(idCategory);
    } else {
      return await _productsProvider.getByCategoryAndProductName(
          idCategory, productName);
    }
  }

  void getCategories() async {
    categories = await _categoriesProvider.getAll();
    refresh();
  }

  void openBottomSheet(Product product) {
    showMaterialModalBottomSheet(
        context: context,
        builder: (context) => ClientProductsDetailPage(product: product));
  }

  void logout() {
    _sharedPref.logout(context, user.id);
  }

  void openDrawer() {
    key.currentState.openDrawer();
  }

  void goToUpdatePage() {
    Navigator.pushNamed(context, 'client/update');
  }

  void goToOrdersList() {
    Navigator.pushNamed(context, 'client/orders/list');
  }

  void goToOrderCreatePage() {
    Navigator.pushNamed(context, 'client/orders/create');
  }

  void goToRoles() {
    Navigator.pushNamedAndRemoveUntil(context, 'roles', (route) => false);
  }
}
