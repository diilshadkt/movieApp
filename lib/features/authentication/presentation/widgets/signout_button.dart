import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/features/authentication/presentation/providers/auth_provider.dart';

class SignOutButton extends ConsumerWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        onPressed: () {
          if (FirebaseAuth.instance.currentUser != null) {
            ref.read(authenticationProvider.notifier).signout(context);
            context.go("/firstpage");
          }
        },
        child: Icon(Icons.logout));
  }
}
