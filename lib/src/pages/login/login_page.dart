import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:lapaz_app/src/pages/login/login_controller.dart';

import 'package:lapaz_app/src/utils/theme_colors.dart';
import 'package:lapaz_app/src/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final LoginController _con = LoginController();

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
        backgroundColor: ThemeColors.white,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.25),
                const _LogoImage(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                TextFieldIconPreffix(
                  controller: _con.emailController,
                  icon: Icons.email,
                  hinttext: 'Correo electrónico',
                  keyboardtype: TextInputType.emailAddress,
                ),
                TextFieldIconPreffix(
                  controller: _con.passwordController,
                  isObscure: true,
                  icon: Icons.lock,
                  hinttext: 'Contraseña',
                  keyboardtype: TextInputType.visiblePassword,
                ),
                ElevatedButtonInfinite(
                  label: 'Iniciar sesión',
                  action: _con.login,
                ),
                const _RegisterAccountSection()
              ],
            ),
          ),
        ));
  }
}

class _RegisterAccountSection extends StatelessWidget {
  const _RegisterAccountSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('No tienes una cuenta?',
            style: TextStyle(color: ThemeColors.purple800, fontSize: 17)),
        const SizedBox(
          width: 6,
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, 'register'),
          child: const Text('Regístrate',
              style: TextStyle(
                  color: ThemeColors.purple800,
                  fontWeight: FontWeight.bold,
                  fontSize: 17)),
        )
      ],
    );
  }
}

class _LogoImage extends StatelessWidget {
  const _LogoImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('assets/img/logo_letras.png', width: 250, height: 100),
    );
  }
}
