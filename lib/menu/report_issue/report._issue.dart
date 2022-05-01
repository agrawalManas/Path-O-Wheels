import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:url_launcher/url_launcher.dart';

class ReportIssue extends StatelessWidget {
  TextEditingController appIssue = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
          bottomOpacity: 10.0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 28,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Report an issue',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Montserrat',
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 15,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 8, top: 30),
                child: RichText(
                  text: const TextSpan(
                    text:
                        "We are sorry that you are facing certain issues with the app. We recommend you to please try the following:\n\n",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                      fontSize: 24,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "\tLogout and restart the app\n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontFamily: 'Montserrat',
                          fontSize: 22,
                        ),
                      ),
                      TextSpan(
                        text: "\tClear the app data & restart\n",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontFamily: 'Montserrat',
                          fontSize: 22,
                        ),
                      ),
                      TextSpan(
                        text: "\tUpdate the app",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontFamily: 'Montserrat',
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, right: 8, top: 20),
                child: Text(
                  'If the problem still persists, please report it by tapping the below button and also describe your problem.',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
                child: TextFormField(
                  controller: appIssue,
                  maxLines: 6,
                  textAlign: TextAlign.left,
                  validator: MultiValidator(
                    [],
                  ),
                  onSaved: (value) {
                    appIssue.text = value!;
                  },
                  style: const TextStyle(
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Describe your problem here",
                    hintStyle: const TextStyle(
                      fontSize: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.9),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(5),
                color: Colors.red.withOpacity(0.8),
                child: MaterialButton(
                  padding: const EdgeInsets.fromLTRB(45, 10, 45, 10),
                  onPressed: () {
                    launchEmail(
                      toEmail: 'pathowheels.bhopal@gmail.com',
                      subject: 'facing issue(s)',
                      message: appIssue.text,
                    );
                  },
                  child: const Text(
                    "Report this Issue",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Future launchEmail(
      {required String toEmail,
      required String subject,
      required String message}) async {
    final url =
        'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}';
    try {
      if (await canLaunch(url)) {
        await launch(url);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
