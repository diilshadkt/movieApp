import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/core/theme/themes/app_theme.dart';
import 'package:movie_app/core/widgets/textfield.dart';
import 'package:movie_app/features/authentication/presentation/providers/auth_provider.dart';
import 'package:movie_app/features/authentication/presentation/widgets/forgott_password_button.dart';
import 'package:movie_app/features/authentication/presentation/widgets/google_signup_button.dart';
import 'package:movie_app/features/authentication/presentation/widgets/signup_login_button.dart';
import 'package:movie_app/features/authentication/presentation/widgets/textbutton.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email =
        ref.read(authenticationProvider(context).notifier).emailController;
    final password =
        ref.read(authenticationProvider(context).notifier).passwordController;
    final name =
        ref.read(authenticationProvider(context).notifier).nameController;
    final phone =
        ref.read(authenticationProvider(context).notifier).phoneController;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: AppTheme.of(context).spaces.space_400,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 180),
              child: Image.asset(
                Constants.personImagePath,
                width: 230,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 120),
              child: Text(
                Constants.loginHeading,
                style: AppTheme.of(context).typography.h900,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 75),
              child: Text(Constants.loginSubHeading,
                  style: AppTheme.of(context).typography.h500),
            ),
            SizedBox(
              height: AppTheme.of(context).spaces.space_700,
            ),
            Container(
                height: 60,
                width: 360,
                child: MyTextfield(
                  controller: ref
                      .read(authenticationProvider(context).notifier)
                      .emailController,
                  hintText: Constants.textfieldEmail,
                  prefixxIcon: Icon(Icons.email_outlined, color: Colors.grey),
                )),
            SizedBox(
              height: AppTheme.of(context).spaces.space_150,
            ),
            Container(
                height: 60,
                width: 360,
                child: MyTextfield(
                  controller: ref
                      .read(authenticationProvider(context).notifier)
                      .passwordController,
                  hintText: Constants.textfieldPassword,
                  prefixxIcon: Icon(Icons.fingerprint,
                      color: const Color.fromARGB(255, 48, 38, 38)),
                )),
            SizedBox(
              height: AppTheme.of(context).spaces.space_200,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 250),
              child: ForgetPasswordButton(
                  buttonText: "Forgot Password", onPressed: () {}),
            ),
            SizedBox(
              height: AppTheme.of(context).spaces.space_50,
            ),
            SignupLoginButton(
              buttonText: "LOGIN",
              onPressed: () {
                if (FirebaseAuth.instance.currentUser != null) {
                  ref
                      .read(authenticationProvider(context).notifier)
                      .signinWithEmail(email.text, password.text);
                } else {
                  context.go("/");
                }
              },
            ),
            SizedBox(
              height: AppTheme.of(context).spaces.space_250,
            ),
            Text(
              Constants.or,
              style: AppTheme.of(context).typography.h500,
            ),
            SizedBox(
              height: AppTheme.of(context).spaces.space_250,
            ),
            GoogleSignupButton(onTap: () {
              context.go('/');
            }),
            SizedBox(
              height: AppTheme.of(context).spaces.space_200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Constants.dontHaveAccount,
                  style: AppTheme.of(context).typography.h500,
                ),
                TexttButton(
                  textButtonText: "SIGNUP",
                  onpressed: (() {
                    context.go("/signup");
                  }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
