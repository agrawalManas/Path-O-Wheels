import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_o_wheels/home_screen/home.dart';
import 'package:path_o_wheels/models/user_model.dart';
import 'package:path_o_wheels/user_account/register.dart';
import 'package:path_o_wheels/user_account/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authenticate {
  final _auth = FirebaseAuth.instance;
  final register = Register();
  UserModel userModel = UserModel();

  String? errorMessage;
  dynamic userUID;
  dynamic valueUID;
  String? firstName;
  String? lastName;

  // Register with Email and Password
  Future registerWithEmailPassword(
      String email, String password, String firstName, String lastName) async {
    this.firstName = firstName;
    this.lastName = lastName;
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    } catch (error) {
      Fluttertoast.showToast(msg: errorMessage!);
    }
  }

  Future postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstName;
    userModel.lastName = lastName;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");
  }

  // Sigin with Email and Password
  Future signIn(String email, String password, BuildContext context) async {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then(
          (uid) => {
            Fluttertoast.showToast(msg: "Login Successful"),
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            )
          },
        )
        .catchError((error) {
      Fluttertoast.showToast(msg: error.toString());
    });
  }

  // Remember Me/Keeping the user the logged in if he checks the checkbox

  void handleRememberMe() async {
    userUID = _auth.currentUser!.uid;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('UID', userUID);
    final uidPref = await SharedPreferences.getInstance();
    valueUID = uidPref.getString('UID');
  }

  // Reset Password
  Future resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email).then(
            (value) => {
              Fluttertoast.showToast(
                  msg:
                      "An Email with a link to reset password has been successfull sent to the given Email Address.")
            },
          );
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  // delete user account
  Future deleteUserAccount() async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .delete();
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Something went wrong, Please try again later');
    }
  }

  Future signOut(context) async {
    try {
      await FirebaseAuth.instance.signOut().then((value) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignIn()));
      });
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  //update Password
  Future<void> changePassword(String password) async {
    try {
      await _auth.currentUser!
          .updatePassword(password)
          .then((value) => _auth.signOut());
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Something went wrong, Please try again later");
    }
  }
}
