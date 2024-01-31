import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_app/core/exceptions/auth/auth_failed_exception.dart';
import 'package:movie_app/features/authentication/data/datasources/firebase_datasourse.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'firebase_datasourse_impl.g.dart';

class FirebaseAuthMethodsImpl implements FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethodsImpl(this._auth);

  @override
  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    return _auth.signOut();
  }

  @override
  Future<UserCredential> signinWithEmail(String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<UserCredential> signupWithEmail(String email, String password) {
    return _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> emailVerification() async {
    await _auth.currentUser?.sendEmailVerification();
  }

  @override
  Future<void> signinWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await _auth.signInWithCredential(credential);
  }

  @override
  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> verifyOtp(String verificationid, String otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationid, smsCode: otp);
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<(String, int?)> verifyPhoneNumber(String number,
      [int? resendToken]) async {
    try {
      final verificationIdCompleter = Completer<String>();
      final resendTokenCompleter = Completer<int?>();

      await FirebaseAuth.instance.verifyPhoneNumber(
          forceResendingToken: resendToken,
          phoneNumber: number,
          verificationCompleted: (PhoneAuthCredential credential) async {
            log('message');
            await _auth.signInWithCredential(credential);
          },
          verificationFailed: (FirebaseAuthException e) {
            if (e.code == 'invalid phone number') {}
          },
          codeSent: (String? verificationid, int? resentToken) async {
            verificationIdCompleter.complete(verificationid);
            resendTokenCompleter.complete(resendToken);
          },
          codeAutoRetrievalTimeout: (String verificationId) async {
            log('Timeout');
          });
      final verificationId = await verificationIdCompleter.future;
      final newResendToken = await resendTokenCompleter.future;
      return (verificationId, newResendToken);
      // )
    } on Exception {
      throw AuthenticationFailedException(
          "cannot login please try again later");
    }
  }
}

@riverpod
FirebaseAuthMethods firebaseAuthMethods(FirebaseAuthMethodsRef ref) {
  return FirebaseAuthMethodsImpl(FirebaseAuth.instance);
}
