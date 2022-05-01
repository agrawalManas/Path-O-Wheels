import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_o_wheels/authentication/authenticate.dart';
import 'package:path_o_wheels/user_account/sign_in.dart';

// ignore: use_key_in_widget_constructors
class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final String genderM = 'Male';
  final String genderF = 'Female';
  final String genderO = 'Other';
  String gender = '';
  String firstName = '';
  String lastName = '';
  String email = '';

  var label1Color = Colors.black;
  var card1Color = Colors.white;
  var label2Color = Colors.black;
  var card2Color = Colors.white;
  var label3Color = Colors.black;
  var card3Color = Colors.white;
  var borderColor = Colors.teal.withOpacity(0.9);
  var myDoc;

  final ageController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();

  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Authenticate auth = Authenticate();

  @override
  Widget build(BuildContext context) {
    final emailField = Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.teal.withOpacity(0.9),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 15, 70, 15),
        child: Text(
          email,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 22,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
    final firstNameField = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      onSaved: (value) {
        setState(() {
          firstName = value!;
        });
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: firstName,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.teal.withOpacity(0.9),
          ),
        ),
      ),
    );
    final lastNameField = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      onSaved: (value) {
        setState(() {
          lastName = value!;
        });
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: lastName,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.teal.withOpacity(0.9),
          ),
        ),
      ),
    );

    final ageField = TextFormField(
      autofocus: false,
      controller: ageController,
      keyboardType: TextInputType.number,
      onSaved: (value) {
        ageController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "User's Age",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.teal.withOpacity(0.9),
          ),
        ),
      ),
    );
    final genderCardM = Card(
      color: card1Color,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            gender = 'Male';
            card1Color = Colors.teal.withOpacity(0.9);
            label1Color = Colors.white;
            label2Color = Colors.black;
            card2Color = Colors.white;
            label3Color = Colors.black;
            card3Color = Colors.white;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          child: Text(
            'Male',
            style: TextStyle(
              color: label1Color,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
    final genderCardF = Padding(
      padding: const EdgeInsets.only(left: 0),
      child: Card(
        color: card2Color,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: InkWell(
          onTap: () {
            setState(() {
              gender = 'Female';
              card1Color = Colors.white;
              label1Color = Colors.black;
              label2Color = Colors.white;
              card2Color = Colors.teal.withOpacity(0.9);
              label3Color = Colors.black;
              card3Color = Colors.white;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            child: Text(
              'Female',
              style: TextStyle(
                color: label2Color,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
    final genderCardO = Padding(
      padding: const EdgeInsets.only(left: 0),
      child: Card(
        color: card3Color,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: InkWell(
          onTap: () {
            setState(() {
              gender = 'other';
              card1Color = Colors.white;
              label1Color = Colors.black;
              card2Color = Colors.white;
              label2Color = Colors.black;
              label3Color = Colors.white;
              card3Color = Colors.teal.withOpacity(0.9);
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            child: Text(
              'Other',
              style: TextStyle(
                color: label3Color,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
    final updatePassword = ExpandablePanel(
      header: const Text(
        'Set a new Password',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
      collapsed: const Padding(
        padding: EdgeInsets.only(left: 25),
        child: Text(
          'Change your old Password',
          style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
        ),
      ),
      expanded: Center(
        child: Card(
          elevation: 10,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
            child: Column(
              children: [
                Container(
                  width: 310,
                  child: TextFormField(
                    autofocus: false,
                    controller: passwordEditingController,
                    keyboardType: TextInputType.name,
                    obscureText: isPasswordHidden,
                    onSaved: (value) {
                      passwordEditingController.text = value!;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        color: Colors.grey,
                        icon: Icon(
                          isPasswordHidden
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () => setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        }),
                      ),
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "New Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.teal.withOpacity(0.9),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: 310,
                  child: TextFormField(
                    autofocus: false,
                    controller: confirmPasswordEditingController,
                    keyboardType: TextInputType.name,
                    obscureText: isConfirmPasswordHidden,
                    validator: (value) {
                      if (confirmPasswordEditingController.text !=
                          passwordEditingController.text) {
                        return "Password don't match";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      confirmPasswordEditingController.text = value!;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        color: Colors.grey,
                        icon: Icon(
                          isConfirmPasswordHidden
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () => setState(() {
                          isConfirmPasswordHidden = !isConfirmPasswordHidden;
                        }),
                      ),
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Confirm New Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.teal.withOpacity(0.9),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 5),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.teal.withOpacity(0.8),
                    child: MaterialButton(
                      padding: const EdgeInsets.fromLTRB(35, 15, 35, 15),
                      onPressed: () async {
                        dynamic result;
                        if (formKey.currentState!.validate()) {
                          result = auth
                              .changePassword(passwordEditingController.text)
                              .then(
                                (value) => {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Colors.black12,
                                      content: Text(
                                        'Your password has been update successfully. Please login once again',
                                      ),
                                    ),
                                  ),
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignIn()),
                                  ),
                                },
                              );
                        }
                        if (result != null) {
                          Fluttertoast.showToast(
                            msg: 'Something Went Wrong, Please try again',
                          );
                        }
                      },
                      child: const Text(
                        "Change Password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    final saveButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Colors.teal.withOpacity(0.8),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(35, 15, 35, 15),
        onPressed: () async {
          FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
          await firebaseFirestore
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .update({
            'firstName': firstName,
            'lastName': lastName,
            'age': ageController.text,
            'gender': gender,
          });
        },
        child: const Text(
          "Save",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.teal.withOpacity(0.9),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            myDoc = snapshot.data!.data();
            email = myDoc['email'];
            firstName = myDoc!["firstName"];
            lastName = myDoc['lastName'];
            return Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Positioned(
                    top: 12,
                    left: 3,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 30,
                    left: 108,
                    child: Text(
                      'Edit Prfoile',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(35),
                          topLeft: Radius.circular(35),
                        ),
                      ),
                      child: ListView(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 17,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  'Email',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 35, right: 20),
                                child: emailField,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Container(
                                  width: 350,
                                  child: updatePassword,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  'Name',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Container(
                                      width: 170,
                                      child: firstNameField,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 10),
                                    child: Container(
                                      width: 170,
                                      child: lastNameField,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text(
                                      'Age',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25, right: 10),
                                    child: Container(
                                      width: 170,
                                      child: ageField,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text(
                                      'Gender',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Center(child: genderCardM),
                                      ),
                                      Center(child: genderCardF),
                                      Center(child: genderCardO),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 70,
                                  left: 140,
                                  bottom: 15,
                                ),
                                child: saveButton,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
