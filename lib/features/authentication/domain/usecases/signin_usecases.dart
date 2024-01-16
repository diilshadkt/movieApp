import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/core/exceptions/auth/invalid_credential_exception.dart';

import 'package:movie_app/core/exceptions/auth/signin_exception.dart';
import 'package:movie_app/features/authentication/domain/repository/auth_repository.dart';

final class SignInUsecases {
  final AuthRepository repository;
  SignInUsecases({required this.repository});
  Future<void> call(String email, String password) async {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      throw InvalidCredentialsException();
    }
    try {
      await repository.signInWithEmail(email, password);
    } on FirebaseAuthException catch (e) {
      throw SignInException(e.message ?? "signin failed please retry", e.code);
    }
  }
}
