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
      _con.init(context);
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
              const CircleAvatar(
                backgroundColor: ThemeColors.purple800,
                radius: 60,
                child: Icon(Icons.person, size: 70, color: ThemeColors.white),
              ),
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
              ElevatedButtonInfinite(action: _con.register, label: 'Registrarse')
            ],
          ),
        ),
      ),
    );
  }
}
