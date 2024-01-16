import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/features/authentication/presentation/pages/first_page.dart';
import 'package:movie_app/features/authentication/presentation/pages/home.dart';
import 'package:movie_app/features/authentication/presentation/pages/login.dart';
import 'package:movie_app/features/authentication/presentation/pages/signup.dart';

final router = GoRouter(initialLocation: "/", routes: [
  GoRoute(
      path: "/",
      builder: (context, state) => HomePage(),
      redirect: (context, state) {
        if (FirebaseAuth.instance.currentUser == null) {
          return "/firstseenpage";
        }
        return null;
      }),
  GoRoute(
    path: "/firstseenpage",
    builder: (context, state) => FirstSeenPage(),
  ),
  GoRoute(
    path: "/signup",
    builder: (context, state) => SignupPage(),
  ),
  GoRoute(
    path: "/login",
    builder: (context, state) => LoginPage(),
  )
]);
