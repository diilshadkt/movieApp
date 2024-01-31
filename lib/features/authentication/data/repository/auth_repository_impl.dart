import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/features/authentication/data/datasources/firebase_datasourse.dart';
import 'package:movie_app/features/authentication/data/datasources/firebase_datasourse_impl.dart';
import 'package:movie_app/features/authentication/domain/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository_impl.g.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthMethods dataSource;
  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<UserCredential> signUpWithEmail(String email, String password) async {
    return await dataSource.signupWithEmail(email, password);
  }

  @override
  Future<UserCredential> signInWithEmail(String email, String password) async {
    return await dataSource.signinWithEmail(email, password);
  }

  @override
  Future<void> signOut() async {
    await dataSource.signOut();
  }

  @override
  Future<void> emailVerification() async {
    await dataSource.emailVerification();
  }

  @override
  Future<void> signinWithGoogle() async {
    await dataSource.signinWithGoogle();
  }

  @override
  Future<void> resetPassword(String email) async {
    return await dataSource.resetPassword(email);
  }

  @override
  Future<(String, int?)> verifyPhoneNumber(String number) async {
    return await dataSource.verifyPhoneNumber(number);
  }

  @override
  Future<void> verifyOtp(String verificationId, String otp) async {
    await dataSource.verifyOtp(verificationId, otp);
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl(dataSource: ref.watch(firebaseAuthMethodsProvider));
}
