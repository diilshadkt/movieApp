import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/core/exceptions/auth/otp_verify_exception.dart';
import 'package:movie_app/features/authentication/domain/repository/auth_repository.dart';

final class OtpVerifyUsecase {
  final AuthRepository repository;
  OtpVerifyUsecase({required this.repository});
  Future<void> call(String verificationId, String otp) async {
    try {
      await repository.verifyOtp(verificationId, otp);
    } on FirebaseAuthException catch (e) {
      throw OtpVerifyException(e.message ?? "OTP verification failed", e.code);
    }
  }
}
