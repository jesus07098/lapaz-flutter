import 'package:flutter/material.dart';

import 'package:lapaz_app/src/utils/theme_colors.dart';


class ElevatedButtonInfinite extends StatelessWidget {
  const ElevatedButtonInfinite(
      {Key key,  this.action,  this.label})
      : super(key: key);

  final void Function() action;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: ElevatedButton(
        onPressed: action,
        child: Text(label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 15),
            primary: ThemeColors.purple800,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
