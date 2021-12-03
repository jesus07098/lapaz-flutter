import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:lapaz_app/src/utils/theme_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                const TextFieldIconPreffix(
                  icon: Icons.email,
                  hinttext: 'Correo electrónico',
                ),
                const TextFieldIconPreffix(
                  icon: Icons.lock,
                  hinttext: 'Contraseña',
                ),
                ElevatedButtonInfinite(
                  label: 'Ingresar',
                  action: () {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('No tienes una cuenta?',
                        style: TextStyle(color: ThemeColors.purple800)),
                    SizedBox(
                      width: 6,
                    ),
                    Text('Regístrate',
                        style: TextStyle(
                            color: ThemeColors.purple800,
                            fontWeight: FontWeight.bold))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class _LogoImage extends StatelessWidget {
  const _LogoImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('assets/img/logo_letras.png', width: 300, height: 100),
    );
  }
}

class ElevatedButtonInfinite extends StatelessWidget {
  const ElevatedButtonInfinite(
      {Key? key, required this.action, required this.label})
      : super(key: key);

  final void Function() action;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: ElevatedButton(
        onPressed: action,
        child: Text(label),
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 124, vertical: 17),
            primary: ThemeColors.purple800,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}

class TextFieldIconPreffix extends StatelessWidget {
  const TextFieldIconPreffix(
      {Key? key, required this.hinttext, required this.icon})
      : super(key: key);

  final String hinttext;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        width: 314,
        child: TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(icon),
                contentPadding: const EdgeInsets.all(16),
                hintText: hinttext,
                filled: true,
                fillColor: ThemeColors.purple100,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    )))));
  }
}
