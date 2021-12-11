import 'package:flutter/material.dart';

import 'package:lapaz_app/src/utils/shared_pref.dart';

class RestaurantProductsListController {
  BuildContext context;
  final SharedPref _sharedPref = SharedPref();
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  Future init(BuildContext context) {
    this.context = context;
  }

  void logout() {
    _sharedPref.logout(context);
  }

  void openDrawer() {
    key.currentState.openDrawer();
  }
}
