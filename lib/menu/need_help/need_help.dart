// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:path_o_wheels/menu/booking_guide/booking_guide.dart';
import 'package:path_o_wheels/menu/report_issue/report._issue.dart';

class NeedHelp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NeedHelpState();
  }
}

class _NeedHelpState extends State<NeedHelp> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 28,
          ),
        ),
        elevation: 0.0,
        title: const Text(
          'Need Help',
          style: TextStyle(
            color: Colors.black,
            fontSize: 36.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          height: 900,
          width: 750,
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 100,
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.message),
                  title: const Text('Report an issue'),
                  subtitle: const Text('Having a problem?'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReportIssue(),
                      ),
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.report_problem),
                  title: const Text('How to book a Test?'),
                  subtitle: const Text("Don't konw how to book a test?"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BookingGuide()),
                    );
                  },
                ),
              ),
              const Card(
                child: ListTile(
                  leading: Icon(Icons.report_problem),
                  title: Text('How to cancel/postpone a test?'),
                  subtitle: Text("Don't know how to cancel/postpone a test?"),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
