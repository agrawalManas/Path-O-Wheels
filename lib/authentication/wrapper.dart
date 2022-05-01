import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:path_o_wheels/home_screen/home.dart';
import 'package:path_o_wheels/user_account/sign_in.dart';

// ignore: use_key_in_widget_constructors
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StreamSubscription<User?> user =
        FirebaseAuth.instance.authStateChanges().listen(
      (user) {
        if (user == null) {
          debugPrint('user not signed in');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SignIn(),
            ),
          );
        } else {
          debugPrint('user signed in');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          );
        }
      },
    );
    return Container();
  }
}
