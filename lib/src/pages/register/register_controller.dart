import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lapaz_app/src/models/response_api.dart';
import 'package:lapaz_app/src/models/users.dart';
import 'package:lapaz_app/src/provider/users_provider.dart';
import 'package:lapaz_app/src/utils/general_snackbar.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController {
  BuildContext context;
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  XFile pickedFile;
  File imageFile;

  Function refresh;

  bool isEnable = true;

  Future init(BuildContext context, Function refresh) {
    this.refresh = refresh;
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
    if (imageFile == null) {
      GeneralSnackbar.show(context, 'Seleccione una imagen');
      return;
    }

    isEnable = false;

    User user = User(
      email: email,
      name: name,
      lastname: lastname,
      phone: phone,
      password: password,
    );

    Stream stream = await usersProvider.createWithImage(user, imageFile);
    stream.listen((res) {
      //ResponseApi responseApi = await usersProvider.create(user);
      ResponseApi responseApi = ResponseApi.fromJson(json.decode(res));
      try {
        GeneralSnackbar.show(context, responseApi.message);
      } catch (e) {
        GeneralSnackbar.show(context, responseApi.message);
      }

      try {
        if (responseApi.success) {
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.pushReplacementNamed(context, 'login');
          });
        } else {
          isEnable = true;
        }
      } catch (e) {
        GeneralSnackbar.show(context, e.toString());
      }
    });
  }

  Future selectImage(ImageSource imageSource) async {
    pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    }
    Navigator.pop(context);
    refresh();
  }

  void showAlertDialog() {
    Widget galleryButton = ElevatedButton(
        onPressed: () {
          selectImage(ImageSource.gallery);
        },
        child: const Text('GALERÍA'));
    Widget cameraButton = ElevatedButton(
        onPressed: () {
          selectImage(ImageSource.camera);
        },
        child: const Text('CAMERA'));
    AlertDialog alertDialog = AlertDialog(
      title: const Text('Selecciona tu imagen'),
      actions: [galleryButton, cameraButton],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
