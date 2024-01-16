import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/features/authentication/data/datasources/firebase_datasourse.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_datasourse_impl.g.dart';

class FirebaseAuthMethodsImpl implements FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethodsImpl(this._auth);

  @override
  Future<void> signOut() async {
    // TODO: implement signOut
    return _auth.signOut();
  }

  @override
  Future<UserCredential> signinWithEmail(String email, String password) {
    // TODO: implement signinWithEmail

    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<UserCredential> signupWithEmail(String email, String password) {
    // TODO: implement signupWithEmail
    return _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> sendEmailVerification() async {
    return _auth.currentUser?.sendEmailVerification();
  }
}

@riverpod
FirebaseAuthMethods firebaseAuthMethods(FirebaseAuthMethodsRef ref) {
  return FirebaseAuthMethodsImpl(FirebaseAuth.instance);
}
