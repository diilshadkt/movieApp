import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/phonenumber_verify_page_constants.dart';
import 'package:movie_app/core/theme/themes/app_theme.dart';
import 'package:movie_app/core/widgets/textfield.dart';
import 'package:movie_app/features/authentication/presentation/providers/auth_provider.dart';

class PhoneNumberLoginPage extends ConsumerWidget {
  const PhoneNumberLoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController loginWithPhoneController =
        TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 250, bottom: 25, right: 53),
            child: Text(
              PhoneNumberVerifyPageConstants.heading1,
              style: AppTheme.of(context).typography.h800,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
                height: MediaQuery.sizeOf(context).height / 15,
                width: MediaQuery.sizeOf(context).width / 1.15,
                child: MyTextfield(
                  controller: loginWithPhoneController,
                  hintText: PhoneNumberVerifyPageConstants.phoneNumber,
                  prefixxIcon: Icon(Icons.phone, color: Colors.grey),
                )),
          ),
          SizedBox(
            height: AppTheme.of(context).spaces.space_150,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 21),
            child: SizedBox(
              height: 60,
              width: 356,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: () {
                    ref.read(authenticationProvider.notifier).verifyPhoneNumber(
                        loginWithPhoneController.text, context);
                  },
                  child: Text(PhoneNumberVerifyPageConstants.sentOtp)),
            ),
            // child: OtpButtonWidget(otpControler: phone),
            // child: SignupLoginButton(
            //     buttonText: PhoneNumberVerifyPageConstants.sentOtp,
            //     onPressed: () {
            //       ref
            //           .read(authenticationProvider.notifier)
            //           .verifyOtp(context, phone.text);
            //     }),
          ),
        ],
      ),
    );
  }
}
