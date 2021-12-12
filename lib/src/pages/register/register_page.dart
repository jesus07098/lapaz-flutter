import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lapaz_app/src/pages/register/register_controller.dart';

import 'package:lapaz_app/src/utils/theme_colors.dart';
import 'package:lapaz_app/src/widgets/textfield_icon_prefix.dart';
import 'package:lapaz_app/src/widgets/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterController _con = RegisterController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black)),
      ),
      backgroundColor: ThemeColors.white,
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ImageUser(con: _con),
              const SizedBox(
                height: 15,
              ),
              TextFieldIconPreffix(
                  controller: _con.emailController,
                  keyboardtype: TextInputType.emailAddress,
                  hinttext: 'Correo electrónico',
                  icon: Icons.email),
              TextFieldIconPreffix(
                  controller: _con.firstNameController,
                  keyboardtype: TextInputType.name,
                  hinttext: 'Nombre',
                  icon: Icons.person),
              TextFieldIconPreffix(
                  controller: _con.lastNameController,
                  keyboardtype: TextInputType.name,
                  hinttext: 'Apellido',
                  icon: Icons.person_outline),
              TextFieldIconPreffix(
                  controller: _con.phoneController,
                  keyboardtype: TextInputType.phone,
                  hinttext: 'Teléfono',
                  icon: Icons.phone),
              TextFieldIconPreffix(
                  controller: _con.passwordController,
                  isObscure: true,
                  keyboardtype: TextInputType.visiblePassword,
                  hinttext: 'Contraseña',
                  icon: Icons.lock),
              TextFieldIconPreffix(
                  controller: _con.confirmPasswordController,
                  keyboardtype: TextInputType.visiblePassword,
                  isObscure: true,
                  hinttext: 'Confirmar contraseña',
                  icon: Icons.lock_outlined),
              ElevatedButtonInfinite(
                  action: _con.isEnable?_con.register:null, label: 'Registrarse')
            ],
          ),
        ),
      ),
    );
  }

  void refresh() {
    setState(() {});
  }
}

class ImageUser extends StatelessWidget {
  const ImageUser({
    Key key,
    @required RegisterController con,
  }) : _con = con, super(key: key);

  final RegisterController _con;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _con.showAlertDialog,
      child:  CircleAvatar(
        backgroundColor: ThemeColors.purple800,
        radius: 60,
        backgroundImage: _con.imageFile==null? const AssetImage('assets/img/user_profile_2.png'): FileImage(File(_con.imageFile.path)),
      ),
    );
  }
}
