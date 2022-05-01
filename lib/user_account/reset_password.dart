import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:path_o_wheels/authentication/authenticate.dart';

// ignore: use_key_in_widget_constructors
class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final formKey = GlobalKey<FormState>();
  final auth = Authenticate();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, top: 300, right: 25),
                child: TextFormField(
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Montserrat',
                        color: Colors.black),
                    autofocus: false,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Email is Required'),
                      EmailValidator(errorText: 'A valid Email is required!')
                    ]),
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
                    )),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(left: 25, top: 40, right: 25),
                // ignore: deprecated_member_use
                child: RaisedButton(
                    padding: const EdgeInsets.all(15),
                    elevation: 5,
                    color: Colors.red[500],
                    child: const Text(
                      "Reset Password",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      dynamic result;
                      if (formKey.currentState!.validate()) {
                        result = auth.resetPassword(emailController.text);
                      }
                      if (result != null) {
                        Navigator.pop(context);
                      }
                    })),
          ],
        ),
      ),
    );
  }
}
