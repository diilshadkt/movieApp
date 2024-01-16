import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/features/authentication/presentation/widgets/signout_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        actions: [SignOutButton()],
      ),
    );
  }
}
