import 'package:flutter/material.dart';

class TexttButton extends StatelessWidget {
  final String textButtonText;
  final void Function() onpressed;

  const TexttButton(
      {super.key, required this.textButtonText, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onpressed,
        child: Text(
          textButtonText,
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 19, color: Colors.blue),
        ));
  }
}
