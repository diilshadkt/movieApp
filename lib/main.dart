import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/object_box/object_box.dart';
import 'package:movie_app/core/object_box/upcoming_objectbox.dart';
import 'package:movie_app/core/router/go_router.dart';
import 'package:movie_app/core/theme/themes/light_theme.dart';
import 'package:movie_app/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ObjectBoxStore.createMethod();
  await UpcomingObjectBoxStore.createMethod();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      theme: ref.watch(lightThemeProvider),
    );
  }
}
