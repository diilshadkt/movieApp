import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/core/theme/themes/app_theme.dart';
import 'package:movie_app/core/widgets/textfield.dart';
import 'package:movie_app/features/authentication/presentation/providers/auth_provider.dart';
import 'package:movie_app/features/authentication/presentation/widgets/google_signup_button.dart';
import 'package:movie_app/features/authentication/presentation/widgets/signup_login_button.dart';
import 'package:movie_app/features/authentication/presentation/widgets/textbutton.dart';

class SignupPage extends ConsumerWidget {
  // static const routPath = '/signup';
  SignupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.read(authenticationProvider.notifier).emailController;
    final password =
        ref.read(authenticationProvider.notifier).passwordController;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: AppTheme.of(context).spaces.space_300,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 180),
              child: Image.asset(
                Constants.personImagePath,
                width: 230,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 135),
              child: Text(
                Constants.signupHeading,
                style: AppTheme.of(context).typography.h900,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 70),
              child: Text(
                Constants.signupSubHeading,
                style: AppTheme.of(context).typography.h500,
              ),
            ),
            SizedBox(
              height: AppTheme.of(context).spaces.space_400,
            ),
            Container(
                height: 60,
                width: 360,
                child: MyTextfield(
                  controller:
                      ref.read(authenticationProvider.notifier).nameController,
                  hintText: Constants.textfieldName,
                  prefixxIcon:
                      Icon(Icons.person_outline_outlined, color: Colors.grey),
                )),
            SizedBox(
              height: AppTheme.of(context).spaces.space_100,
            ),
            Container(
                height: 60,
                width: 360,
                child: MyTextfield(
                  controller:
                      ref.read(authenticationProvider.notifier).emailController,
                  hintText: Constants.textfieldEmail,
                  prefixxIcon: Icon(Icons.email_outlined, color: Colors.grey),
                )),
            SizedBox(
              height: AppTheme.of(context).spaces.space_100,
            ),
            Container(
                height: 60,
                width: 360,
                child: MyTextfield(
                  controller:
                      ref.read(authenticationProvider.notifier).phoneController,
                  hintText: Constants.textfieldPhone,
                  prefixxIcon: Icon(Icons.phone_android, color: Colors.grey),
                )),
            SizedBox(
              height: AppTheme.of(context).spaces.space_100,
            ),
            Container(
                height: 60,
                width: 360,
                child: MyTextfield(
                  controller: ref
                      .read(authenticationProvider.notifier)
                      .passwordController,
                  hintText: Constants.textfieldPassword,
                  prefixxIcon: Icon(Icons.fingerprint,
                      color: const Color.fromARGB(255, 119, 57, 57)),
                  sufixxIcon: Icon(Icons.remove_red_eye),
                )),
            SizedBox(
              height: AppTheme.of(context).spaces.space_300,
            ),
            SignupLoginButton(
              buttonText: "SIGNUP",
              onPressed: () {
                ref
                    .read(authenticationProvider.notifier)
                    .signupWithEmail(context, email.text, password.text);
                ref.read(authenticationProvider.notifier).clear();
              },
            ),
            SizedBox(
              height: AppTheme.of(context).spaces.space_150,
            ),
            Text(
              Constants.or,
              style: AppTheme.of(context).typography.h500,
            ),
            SizedBox(
              height: AppTheme.of(context).spaces.space_150,
            ),
            GoogleSignupButton(onTap: () {
              context.go("/");
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(Constants.alreadyHaveAccount,
                    style: AppTheme.of(context).typography.h500),
                TexttButton(
                  textButtonText: "Login",
                  onpressed: () {
                    context.go("/login");
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
