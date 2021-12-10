import 'package:flutter/widgets.dart';
import 'package:lapaz_app/src/models/response_api.dart';
import 'package:lapaz_app/src/models/users.dart';
import 'package:lapaz_app/src/provider/users_provider.dart';
import 'package:lapaz_app/src/utils/general_snackbar.dart';

class RegisterController {
  BuildContext context;
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  Future init(BuildContext context) {
    this.context = context;
    usersProvider.init(context);
  }

  void register() async {
    String email = emailController.text.trim();
    String name = firstNameController.text.trim();
    String lastname = lastNameController.text;
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (email.isEmpty ||
        name.isEmpty ||
        lastname.isEmpty ||
        phone.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      GeneralSnackbar.show(context, 'Debes ingresar todos los campos');
      return;
    }

    if (confirmPassword != password) {
      GeneralSnackbar.show(context, 'Las contraseñas no coinciden...');
      return;
    }

    User user = User(
      email: email,
      name: name,
      lastname: lastname,
      phone: phone,
      password: password,
    );

    ResponseApi responseApi = await usersProvider.create(user);
    try {
      GeneralSnackbar.show(context, responseApi.message);
    } catch (e) {
      GeneralSnackbar.show(context, responseApi.message);
    }

try{
if (responseApi.success) {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pushReplacementNamed(context, 'login');
        });
      }
}catch(e){
 GeneralSnackbar.show(context, e.toString());
}
   
  }
}
