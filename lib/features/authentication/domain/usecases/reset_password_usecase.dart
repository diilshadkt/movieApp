import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/core/exceptions/auth/reset_pasword_exception.dart';
import 'package:movie_app/features/authentication/domain/repository/auth_repository.dart';

class ResetPasswordUsecase {
  final AuthRepository repository;
  ResetPasswordUsecase({required this.repository});
  Future<void> call(String email) async {
    try {
      await repository.resetPassword(email);
    } on FirebaseAuthException catch (e) {
      throw ResetPasswordException(
          e.message ?? "Reset password action failed", e.code);
    }
  }
}
