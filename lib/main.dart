import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_o_wheels/shared/onboarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // ignore: prefer_const_constructors
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Path-O-Wheels',
      home: AnimatedSplashScreen(
        duration: 700,
        splash: Image.asset('images/logo.png'),
        splashIconSize: double.infinity,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.red.shade500,
        nextScreen: OnBoardingScreen(),
      ),
    );
  }
}
