import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/exceptions/base_exception.dart';
import 'package:movie_app/core/utils/snackbar.dart';
import 'package:movie_app/features/authentication/data/repository/auth_repository_impl.dart';

import 'package:movie_app/features/authentication/domain/repository/auth_repository.dart';
import 'package:movie_app/features/authentication/domain/usecases/email_verification_usecase.dart';
import 'package:movie_app/features/authentication/domain/usecases/signin_usecases.dart';
import 'package:movie_app/features/authentication/domain/usecases/signout_usecases.dart';
import 'package:movie_app/features/authentication/domain/usecases/signup_usecases.dart';
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
  void build(BuildContext context) {
    // this.context = context;

    repository = ref.read(authRepositoryProvider);
    ref.onDispose(dispose);
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

  Future<void> signupWithEmail(String email, String password) async {
    try {
      await emailVerification();
      await SignUpUsecases(repository: repository)(email, password);
      Future.sync(() => context.go("/"));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showSnackbarMessage(context, e.message));
    }
  }

  Future<void> signinWithEmail(String email, String password) async {
    try {
      await SignInUsecases(repository: repository)(email, password);
      Future.sync(() => context.go("/"));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showSnackbarMessage(context, e.message));
    }
  }

  Future<void> signout() async {
    try {
      await SignOutUseCase;
      Future.sync(() => context.go("/login"));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showSnackbarMessage(context, e.message));
    }
  }

  Future<void> emailVerification() async {
    try {
      await EmailVerificationUsecase(repository: repository)();
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showSnackbarMessage(context, e.message));
    }
  }
}
