import 'package:flutter/material.dart';
import 'package:lapaz_app/src/models/response_api.dart';
import 'package:lapaz_app/src/models/users.dart';
import 'package:lapaz_app/src/provider/users_provider.dart';
import 'package:lapaz_app/src/utils/general_snackbar.dart';
import 'package:lapaz_app/src/utils/shared_pref.dart';

class LoginController {
  BuildContext context;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  SharedPref _sharedPref = new SharedPref();

  Future init(BuildContext context) async {
    this.context = context;
    await usersProvider.init(context);
    User user = User.fromJson(await _sharedPref.read('user') ?? {});

    if (user?.sessionToken != null) {
          Navigator.pushNamedAndRemoveUntil(
          context, 'client/products/list', (route) => false);
    }
  }

  void goToRegisterPage() {
    Navigator.pushNamed(context, 'register');
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    ResponseApi responseApi = await usersProvider.login(email, password);

    if (responseApi.success) {
      User user = User.fromJson(responseApi.data);
      _sharedPref.save('user', user.toJson());
      Navigator.pushNamedAndRemoveUntil(
          context, 'client/products/list', (route) => false);
      print('Respuesta object: ${responseApi}');
      print('Respuesta: ${responseApi.toJson()}');
    } else {
      GeneralSnackbar.show(context, responseApi.message);
    }

    GeneralSnackbar.show(context, responseApi.message);
  }
}
