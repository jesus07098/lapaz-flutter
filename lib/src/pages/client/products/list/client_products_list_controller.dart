import 'package:flutter/material.dart';

import 'package:lapaz_app/src/utils/shared_pref.dart';

class ClientProductsListController {
  BuildContext context;
  final SharedPref _sharedPref = SharedPref();

  Future init(BuildContext context) {
    this.context = context;
  }

  logout() {
    _sharedPref.logout(context);
  }
}
