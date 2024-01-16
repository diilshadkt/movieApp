import 'package:flutter/material.dart';

class ForgetPasswordButton extends StatelessWidget {
  final void Function() onPressed;
  final String buttonText;
  const ForgetPasswordButton(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.w800, fontSize: 13),
        ));
  }
}
