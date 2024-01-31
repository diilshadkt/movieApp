import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthMethods {
  Future<UserCredential> signupWithEmail(
    String email,
    String password,
  );
  Future<UserCredential> signinWithEmail(
    String email,
    String password,
  );
  Future<void> signOut();
  Future<void> emailVerification();
  Future<void> signinWithGoogle();
  Future<void> resetPassword(String email);
  Future<(String, int?)> verifyPhoneNumber(String number);
  Future<void> verifyOtp(String verificationid, String otp);
}
