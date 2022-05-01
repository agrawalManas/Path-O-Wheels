import 'package:flutter/material.dart';
import 'package:path_o_wheels/authentication/authenticate.dart';
import 'package:path_o_wheels/user_account/register.dart';
import 'package:path_o_wheels/user_account/reset_password.dart';

// ignore: use_key_in_widget_constructors
class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // form key
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // remember me checkbox
  bool _isChecked = false;

  // var userEmail;
  Authenticate auth = Authenticate();

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
      style: const TextStyle(
          fontSize: 20.0, fontFamily: 'Montserrat', color: Colors.black),
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter an email";
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@.[a-z]").hasMatch(value)) {
          return "Please enter a valid email";
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.mail),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //password field
    final passwordField = TextFormField(
      style: const TextStyle(
          fontSize: 20.0, fontFamily: 'Montserrat', color: Colors.black),
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter password";
        }
        return null;
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      color: Colors.red[500],
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          if (formKey.currentState!.validate()) {
            auth.signIn(emailController.text, passwordController.text, context);
          }
        },
        child: const Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 30, 0, 0),
                    child: const Text(
                      'Hello\tTHERE.',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontFamily: "Montserrat",
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 85),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
                    child: emailField,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
                    child: passwordField,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Checkbox(
                            activeColor: Colors.white,
                            checkColor: Colors.black,
                            value: _isChecked,
                            onChanged: (value) {
                              auth.handleRememberMe();
                              setState(() {
                                //authenticate.handleRememberMe();
                                _isChecked = !_isChecked;
                              });
                            }),
                      ),
                      const Text(
                        'Remember Me',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(45, 10, 50, 10),
                    child: loginButton,
                  ),
                  const SizedBox(height: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResetPassword(),
                          ),
                        );
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.blue,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
