import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/core/exceptions/auth/signinwith_google_exception.dart';
import 'package:movie_app/features/authentication/domain/repository/auth_repository.dart';

final class SigninWithGoogleUsecase {
  final AuthRepository repository;
  SigninWithGoogleUsecase({required this.repository});
  Future<void> call() async {
    try {
      await repository.signinWithGoogle();
    } on FirebaseAuthException catch (e) {
      throw SigninWithGoogleException(
          e.message ?? "signin with google Action failed", e.code);
    }
  }
}
