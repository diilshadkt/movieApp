import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/core/theme/themes/app_theme.dart';

class GoogleSignupButton extends StatelessWidget {
  final void Function() onTap;
  const GoogleSignupButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 60,
        width: 356,
        decoration: BoxDecoration(
          border: Border.all(width: 1.5),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 7),
              child: Image.asset(
                Constants.googleLogoPath,
                width: 25,
              ),
            ),
            Text(
              Constants.googleSignin,
              style: AppTheme.of(context).typography.h500,
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
