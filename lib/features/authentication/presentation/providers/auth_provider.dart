import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/exceptions/base_exception.dart';
import 'package:movie_app/core/utils/snackbar.dart';
import 'package:movie_app/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:movie_app/features/authentication/domain/repository/auth_repository.dart';
import 'package:movie_app/features/authentication/domain/usecases/email_verification_usecase.dart';
import 'package:movie_app/features/authentication/domain/usecases/otp_verify_usecase.dart';
import 'package:movie_app/features/authentication/domain/usecases/phonenumber_verify_usecase.dart';
import 'package:movie_app/features/authentication/domain/usecases/reset_password_usecase.dart';
import 'package:movie_app/features/authentication/domain/usecases/signin_usecases.dart';
import 'package:movie_app/features/authentication/domain/usecases/signinwith_google_usecases.dart';
import 'package:movie_app/features/authentication/domain/usecases/signout_usecases.dart';
import 'package:movie_app/features/authentication/domain/usecases/signup_usecases.dart';
import 'package:movie_app/features/authentication/presentation/providers/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Authentication extends _$Authentication {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late final AuthRepository repository;
  @override
  AuthState build() {
    // this.context = context;

    repository = ref.read(authRepositoryProvider);
    ref.onDispose(dispose);
    return AuthState(verificationId: '', resendToken: null);
  }

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
  }

  void clear() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
  }

  Future<void> signinWithGoogle(BuildContext context) async {
    try {
      await SigninWithGoogleUsecase(repository: repository)();
      Future.sync(() => context.go("/"));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showSnackbarMessage(context, e.message));
    }
  }

  Future<void> emailVerification(BuildContext context) async {
    try {
      await EmailVerificationUsecase(repository: repository)();
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showSnackbarMessage(context, e.message));
    }
  }

  Future<void> signupWithEmail(
      BuildContext context, String email, String password) async {
    try {
      await SignUpUsecases(repository: repository)(email, password);
      await emailVerification(context);
      Future.sync(() => context.go("/"));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showSnackbarMessage(context, e.message));
    }
  }

  Future<void> signinWithEmail(
      BuildContext context, String email, String password) async {
    try {
      await SignInUsecases(repository: repository)(email, password);
      Future.sync(() => context.go("/"));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showSnackbarMessage(context, e.message));
    }
  }

  Future<void> resetPassword(BuildContext context, String email) async {
    try {
      await ResetPasswordUsecase(repository: repository)(email);
      Future.sync(() => context.go("/"));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showSnackbarMessage(context, e.message));
    }
  }

  Future<void> signout(BuildContext context) async {
    try {
      await SignOutUseCase(repository: repository)();
      Future.sync(() => context.go("/login"));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showSnackbarMessage(context, e.message));
    }
  }

  Future<void> verifyPhoneNumber(String number, BuildContext context) async {
    try {
      final verificationData =
          await PhoneNumberVerifyUsecase(repository: repository)(number);

      state = AuthState(
          verificationId: verificationData.$1,
          resendToken: verificationData.$2);
      Future.sync(() => context.go("/otpPage"));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showSnackbarMessage(context, e.message));
    }
  }

  Future<void> verifyOtp(BuildContext context, String otp) async {
    try {
      await OtpVerifyUsecase(repository: repository)(state.verificationId, otp);
      Future.sync(() => context.go("/"));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showSnackbarMessage(context, e.message));
    }
  }
}
