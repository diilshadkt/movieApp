import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/otp_page_constants.dart';
import 'package:movie_app/core/theme/themes/app_theme.dart';
import 'package:movie_app/core/widgets/textfield.dart';
import 'package:movie_app/features/authentication/presentation/providers/auth_provider.dart';

class OtpPage extends ConsumerWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController otpController = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 250, bottom: 25, right: 53),
            child: Text(
              OtpPageConstants.heading1,
              style: AppTheme.of(context).typography.h800,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
                height: MediaQuery.sizeOf(context).height / 15,
                width: MediaQuery.sizeOf(context).width / 1.15,
                child: MyTextfield(
                  controller: otpController,
                  hintText: OtpPageConstants.enterOtp,
                  prefixxIcon: Icon(Icons.email_outlined, color: Colors.grey),
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
                    ref
                        .read(authenticationProvider.notifier)
                        .verifyOtp(context, otpController.text);
                  },
                  child: Text(OtpPageConstants.submit)),
            ),
          ),
        ],
      ),
    );
  }
}
