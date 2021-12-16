import 'package:flutter/material.dart';

import 'package:lapaz_app/src/utils/theme_colors.dart';

class TextFieldIconPreffix extends StatelessWidget {
  const TextFieldIconPreffix(
      {Key key,
      this.hinttext,
      this.icon,
      this.keyboardtype,
      this.isObscure,
      this.controller})
      : super(key: key);

  final String hinttext;
  final IconData icon;
  final TextInputType keyboardtype;
  final bool isObscure;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: 350,
        child: TextFormField(
            controller: controller,
            obscureText: isObscure ?? false,
            keyboardType: keyboardtype,
            decoration: InputDecoration(
                prefixIcon: Icon(icon, color: ThemeColors.purple800),
                contentPadding: const EdgeInsets.all(13),
                hintStyle: const TextStyle(fontSize: 18),
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
