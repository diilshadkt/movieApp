import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/features/authentication/presentation/pages/login.dart';
import 'package:movie_app/features/authentication/presentation/pages/otp_page.dart';
import 'package:movie_app/features/authentication/presentation/pages/phonenumber_login_page.dart';
import 'package:movie_app/features/authentication/presentation/pages/reset_password_page.dart';
import 'package:movie_app/features/authentication/presentation/pages/signup.dart';
import 'package:movie_app/features/feature2/domain/entities/movie_entity.dart';
import 'package:movie_app/features/feature2/presentation/pages/favourite_page.dart';
import 'package:movie_app/features/feature2/presentation/pages/home.dart';
import 'package:movie_app/features/feature2/presentation/pages/overview_page.dart';
import 'package:movie_app/features/feature2/presentation/pages/profile_page.dart';
import 'package:movie_app/features/feature2/presentation/pages/search_page.dart';

final router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
        path: "/",
        builder: (context, state) => HomePage(),
        redirect: (context, state) {
          final user = FirebaseAuth.instance.currentUser;
          if (user == null || !user.emailVerified && user.phoneNumber == null) {
            return "/login";
          }
          return null;
        }),
    GoRoute(
      path: "/signup",
      builder: (context, state) => SignupPage(),
    ),
    GoRoute(
      path: "/login",
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: "/overviewPage",
      builder: (context, state) {
        return OverviewPage(
          entity: state.extra as MovieEntity,
        );
      },
    ),
    GoRoute(
        path: "/resetPasswordPage",
        builder: (context, state) => const ResetPasswordPage()),
    GoRoute(
      path: ProfilePage.path,
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      path: "/phoneNumberLoginPage",
      builder: (context, state) => PhoneNumberLoginPage(),
    ),
    GoRoute(
      path: "/otpPage",
      builder: (context, state) => OtpPage(),
    ),
    GoRoute(
      path: "/favouritePage",
      builder: (context, state) => FavouritePage(),
    ),
    GoRoute(
      path: SearchPage.routePath,
      builder: (context, state) => SearchPage(),
    ),
  ],
);
