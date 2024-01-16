import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/features/authentication/presentation/widgets/home_button.dart';

class FirstSeenPage extends StatelessWidget {
  const FirstSeenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Image.asset(
              Constants.personImagePath,
              width: 350,
            ),
          ),
          SizedBox(
            height: 290,
          ),
          Text(Constants.homeHeading),
          Text(Constants.homeSubHeading),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Row(
              children: [
                Expanded(
                    child: HomeButton(
                  buttonText: "LOGIN",
                  onPressed: () {
                    context.push('/login');
                  },
                )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: HomeButton(
                  buttonText: "SIGNUP",
                  onPressed: () {
                    context.push("/signup");
                  },
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
