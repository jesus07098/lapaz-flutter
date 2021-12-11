import 'package:flutter/material.dart';
import 'package:lapaz_app/src/models/users.dart';
import 'package:lapaz_app/src/utils/shared_pref.dart';

class RolesController {
  BuildContext context;
  User user;
  Function() refresh;
  SharedPref sharedPref = SharedPref();

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    //OBTENER USUARIO DE SESION
    user = User.fromJson(await sharedPref.read('user'));
    refresh();
  }
  void goToPage(String route) {
    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
  }
}
