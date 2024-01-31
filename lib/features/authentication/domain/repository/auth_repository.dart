import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<UserCredential> signUpWithEmail(String email, String password);
  Future<UserCredential> signInWithEmail(String email, String password);
  Future<void> emailVerification();
  Future<void> signOut();
  Future<void> signinWithGoogle();
  Future<void> resetPassword(String email);
  Future<(String, int?)> verifyPhoneNumber(String number);
  Future<void> verifyOtp(String verificationId, String otp);
}
