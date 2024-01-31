import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/core/exceptions/auth/invalid_credential_exception.dart';
import 'package:movie_app/core/exceptions/auth/phonenumber_verify_exception.dart';
import 'package:movie_app/features/authentication/domain/repository/auth_repository.dart';

final class PhoneNumberVerifyUsecase {
  final AuthRepository repository;
  PhoneNumberVerifyUsecase({required this.repository});
  Future<(String, int?)> call(String number) async {
    if (number.trim().isEmpty) {
      throw InvalidCredentialsException();
    }
    try {
      return await repository.verifyPhoneNumber(number);
    } on FirebaseAuthException catch (e) {
      throw PhoneNumberVerifyException(
          e.message ?? "Phone Number verification failed", e.code);
    }
  }
}
