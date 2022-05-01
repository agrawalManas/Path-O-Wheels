import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_o_wheels/authentication/authenticate.dart';
import 'package:path_o_wheels/user_account/sign_in.dart';

// ignore: use_key_in_widget_constructors
class DeleteAccount extends StatefulWidget {
  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  final feedback = TextEditingController();
  Authenticate auth = Authenticate();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.red.shade300,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
          ),
          title: const Text(
            'Delete Account',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 28,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 5,
          ),
          Column(
            children: const [
              SizedBox(
                height: 20.0,
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("images/sad.jpg"),
                minRadius: 80,
              ),
            ],
          ),
          const SizedBox(
            height: 35.0,
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, right: 10),
                child: const Text.rich(
                  TextSpan(
                    text: "\t\t\tWe're so sorry to hear that!\n\n",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <InlineSpan>[
                      TextSpan(
                        text:
                            "We value you & your privacy, by tapping the below button your account will be permanently deleted. However this process may take upto three days.\n\n",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      TextSpan(
                        text:
                            'If you could give us a feedback, it would help us a lot to improve.\n',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: TextField(
                  controller: feedback,
                  maxLines: 5,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Feedback(Optional)",
                    hintStyle: const TextStyle(
                      fontSize: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black38.withOpacity(0.9),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(5),
                color: Colors.red.withOpacity(0.8),
                child: MaterialButton(
                  padding: const EdgeInsets.fromLTRB(35, 10, 35, 10),
                  onPressed: () async {
                    await auth.deleteUserAccount().then(
                      (value) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignIn(),
                          ),
                        );
                      },
                    );
                  },
                  child: const Text(
                    "Delete my Account",
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
}
