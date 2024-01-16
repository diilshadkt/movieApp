import 'package:flutter/material.dart';
import 'package:movie_app/features/authentication/presentation/pages/signup.dart';

class HomeButton extends StatelessWidget {
  final String buttonText;
  final void Function() onPressed;
  const HomeButton(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsetsDirectional.symmetric(),
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              side: BorderSide(color: Colors.black, width: 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
          onPressed: onPressed,
          child: Text(buttonText)),
    );
  }
}
