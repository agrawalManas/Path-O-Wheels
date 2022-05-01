import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:path_o_wheels/home_screen/home.dart';

// ignore: use_key_in_widget_constructors
class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buildImage(String path) {
      return SizedBox(
        height: 350,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(path),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: IntroductionScreen(
        showDoneButton: false,
        dotsDecorator: DotsDecorator(
          color: Colors.orange.shade300,
          activeColor: Colors.orange.shade500,
          size: const Size(11, 11),
          activeSize: const Size(22, 11),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        globalBackgroundColor: Colors.white,
        next: Row(
          children: const [
            SizedBox(
              width: 28,
            ),
            Text(
              'Next',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: 'Montserrat',
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.black,
            ),
          ],
        ),
        pages: [
          PageViewModel(
            title: 'Pathology at your DoorStep',
            body:
                'Hassle free Pathology at your very door in just a few clicks.',
            image: buildImage('images/van.png'),
            decoration: const PageDecoration(
              titleTextStyle: TextStyle(
                fontSize: 28,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
              bodyTextStyle: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 22,
              ),
              imagePadding: EdgeInsets.only(top: 89),
              titlePadding: EdgeInsets.fromLTRB(5, 115, 5, 15),
              pageColor: Colors.white,
            ),
          ),
          PageViewModel(
            title: '100% Safe Sample Collection',
            body:
                'Your health is above everything. We try to maintain minimum possible contact with you',
            image: buildImage('images/collection.png'),
            decoration: const PageDecoration(
              titleTextStyle: TextStyle(
                fontSize: 28,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
              bodyTextStyle: TextStyle(
                fontSize: 22,
                fontFamily: 'Montserrat',
              ),
              imagePadding: EdgeInsets.only(top: 100),
              titlePadding: EdgeInsets.fromLTRB(5, 105, 5, 15),
              pageColor: Colors.white,
            ),
          ),
          PageViewModel(
            title: 'Online Reports in 24-72 hrs',
            body:
                "We'll will send the reports to your Email ID as soon as they are made available.",
            image: buildImage('images/report.png'),
            decoration: const PageDecoration(
              titleTextStyle: TextStyle(
                fontSize: 28,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
              bodyTextStyle: TextStyle(
                fontSize: 22,
                fontFamily: 'Montserrat',
              ),
              imagePadding: EdgeInsets.only(top: 20),
              titlePadding: EdgeInsets.fromLTRB(5, 85, 5, 15),
              pageColor: Colors.white,
            ),
            footer: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(5),
              color: Colors.orange.shade700,
              child: MaterialButton(
                padding: const EdgeInsets.fromLTRB(35, 10, 35, 10),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  );
                },
                child: const Text(
                  "Get Started",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
