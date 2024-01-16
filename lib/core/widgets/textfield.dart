import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String? hintText;
  final Widget? prefixxIcon;
  final Widget? sufixxIcon;
  final TextEditingController controller;
  const MyTextfield(
      {super.key,
      required this.hintText,
      required this.prefixxIcon,
      required this.controller,
      this.sufixxIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      // keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          labelText: hintText,
          labelStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(),
          prefixIcon: prefixxIcon,
          suffixIcon: sufixxIcon,
          suffixIconColor: Colors.grey,
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),
    );
  }
}
//Icon(Icons.person_outline_outlined, color: Colors.grey),