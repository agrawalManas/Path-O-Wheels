import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class BookingGuide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: 30,
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          'How to Book a Test?',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            margin: const EdgeInsets.only(left: 15),
            height: 170,
            width: 310,
            child: Card(
              color: Colors.greenAccent.shade100,
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.green),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                ),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                child: Column(
                  children: const [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          'Step 1',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        'Select a test or a package as needed and go through all the details.',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            width: 35,
          ),
          Container(
            margin: const EdgeInsets.only(left: 50),
            height: 170,
            width: 300,
            child: Card(
              color: Colors.greenAccent.shade100,
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.green),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                ),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                child: Column(
                  children: const [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          'Step 2',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        'Select a vendor from the provided options and fill up a basic form.',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            width: 55,
          ),
          Container(
            margin: const EdgeInsets.only(left: 15),
            height: 170,
            width: 310,
            child: Card(
              color: Colors.greenAccent.shade100,
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.green),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                ),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                child: Column(
                  children: const [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          'Step 3',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        "Review the order details, make the patment & keep the note of the 'Order ID'.",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
