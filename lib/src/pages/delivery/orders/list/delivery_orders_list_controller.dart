import 'package:flutter/material.dart';
import 'package:lapaz_app/src/models/users.dart';

import 'package:lapaz_app/src/utils/shared_pref.dart';

class DeliveryOrderListController {
  BuildContext context;
  final SharedPref _sharedPref = SharedPref();
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  Function refresh;
  User user;

  Future init(BuildContext context) {
    this.context = context;
    this.refresh = refresh;
    this.context = context;
    refresh();
  }

  void logout() {
    _sharedPref.logout(context, user.id);
  }

  void openDrawer() {
    key.currentState.openDrawer();
  }
}
