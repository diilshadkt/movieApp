import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/constants/reset_password_page_constants.dart';
import 'package:movie_app/core/theme/themes/app_theme.dart';
import 'package:movie_app/core/widgets/textfield.dart';
import 'package:movie_app/features/authentication/presentation/providers/auth_provider.dart';
import 'package:movie_app/features/authentication/presentation/widgets/signup_login_button.dart';

class ResetPasswordPage extends ConsumerWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.read(authenticationProvider.notifier).emailController;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 330, top: 40),
            child: IconButton(
                onPressed: () {
                  context.push("/login");
                },
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  size: 40,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 170, bottom: 25, right: 53),
            child: Text(
              ResetPasswordPageConstants.Heading1,
              style: AppTheme.of(context).typography.h800,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
                height: MediaQuery.sizeOf(context).height / 15,
                width: MediaQuery.sizeOf(context).width / 1.15,
                child: MyTextfield(
                  controller:
                      ref.read(authenticationProvider.notifier).emailController,
                  hintText: ResetPasswordPageConstants.email,
                  prefixxIcon: Icon(Icons.email_outlined, color: Colors.grey),
                )),
          ),
          SizedBox(
            height: AppTheme.of(context).spaces.space_150,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 21),
            child: SignupLoginButton(
                buttonText: ResetPasswordPageConstants.submit,
                onPressed: () {
                  ref
                      .read(authenticationProvider.notifier)
                      .resetPassword(context, email.text);
                }),
          ),
        ],
      ),
    );
  }
}
