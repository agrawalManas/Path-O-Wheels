import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:path_o_wheels/home_screen/home.dart';

class PaymentSuccess extends StatefulWidget {
  String orderId = '';
  PaymentSuccess({Key? key, required this.orderId}) : super(key: key) {
    orderId = orderId;
  }

  @override
  _PaymentSuccessState createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  String orderId = '';
  @override
  Widget build(BuildContext context) {
    orderId = widget.orderId;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 200,
          ),
          const CircleAvatar(
            backgroundColor: Colors.transparent,
            maxRadius: 95,
            backgroundImage: AssetImage('images/success.gif'),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Successful',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              'Your order is placed successfully with the Order ID:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
            child: Text(
              'OrderID is $orderId',
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(5),
            color: Colors.orange.shade700,
            child: MaterialButton(
              padding: const EdgeInsets.fromLTRB(55, 10, 55, 10),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
              },
              child: const Text(
                "Continue",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
