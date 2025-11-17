import 'package:fitsnap/screens/signup/signin.dart';
import 'package:fitsnap/screens/signup/signup.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:fitsnap/mainscreen.dart';
import 'package:fitsnap/screens/home/home_screen.dart';
import 'package:fitsnap/screens/home/splash_screen.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await DefaultCacheManager().emptyCache();
  PaintingBinding.instance.imageCache.maximumSize = 1000;
  PaintingBinding.instance.imageCache.maximumSizeBytes = 100 << 20; // 100 MB

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitSnap',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        platform: TargetPlatform.android,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder()},
        ),
        brightness: Brightness.light,
      ),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: ScrollConfiguration.of(
            context,
          ).copyWith(physics: const BouncingScrollPhysics()),
          child: child!,
        );
      },
      home: const SplashScreen(),
      routes: {
        '/main': (context) => const MainScreen(),
        '/home': (context) => const HomeScreen(),
        '/signup_page': (context) => const SignUpScreen(),
        '/signin_page': (context) => const SignInScreen(),
      },
    );
  }
}
