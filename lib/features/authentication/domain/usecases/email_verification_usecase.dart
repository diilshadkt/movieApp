import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/core/exceptions/auth/email_verification_exception.dart';
import 'package:movie_app/features/authentication/domain/repository/auth_repository.dart';

final class EmailVerificationUsecase {
  final AuthRepository repository;
  EmailVerificationUsecase({required this.repository});
  Future<void> call() async {
    try {
      await repository.emailVerification();
    } on FirebaseAuthException catch (e) {
      throw EmailVerificationException(
          e.message ?? "Email verification failed", e.code);
    }
  }
}
