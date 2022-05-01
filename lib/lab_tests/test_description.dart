import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:path_o_wheels/vendors/vendor_list.dart';

// ignore: must_be_immutable
class TestDescription extends StatefulWidget {
  String testName = '';
  TestDescription({Key? key, required this.testName}) : super(key: key) {
    testName = testName;
  }
  @override
  State<TestDescription> createState() => _TestDescriptionState();
}

class _TestDescriptionState extends State<TestDescription> {
  var noOfTestsIncluded = 0;
  var minMrp = 0;
  var noOfUniqueTests = 0;
  List<String> uniqueTests = [];
  List<String> includedTests = [];

  bool _isVisible = false;

  String testDescription = '';
  String suitableFor1 = '';
  String suitableFor2 = '';
  String suitableFor3 = '';

  @override
  Widget build(BuildContext context) {
    var test = widget.testName;
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream:
          FirebaseFirestore.instance.collection('tests').doc(test).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          var myDoc = snapshot.data!.data();
          noOfTestsIncluded = myDoc!["no of tests included"];
          testDescription = myDoc['test description'];
          suitableFor1 = myDoc['suitable for 1'];
          suitableFor2 = myDoc['suitable for 2'];
          suitableFor3 = myDoc['suitable for 3'];
          minMrp = myDoc['min mrp'];
          if (noOfTestsIncluded > 1) {
            _isVisible = true;
            noOfUniqueTests = myDoc['no of unique tests'];
          }
          return Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.white,
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(left: 70, right: 70, bottom: 10),
              child: Material(
                elevation: 20,
                borderRadius: BorderRadius.circular(5),
                color: Colors.deepOrange.shade400,
                child: MaterialButton(
                  padding: const EdgeInsets.fromLTRB(35, 10, 35, 10),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VendorList(
                          testName: test,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Book This Test",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(90),
              child: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.black,
                  iconSize: 28,
                ),
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                flexibleSpace: Stack(
                  children: [
                    Positioned(
                      top: 52,
                      left: 72,
                      child: Text(
                        test.toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Colors.black,
                          fontFamily: '',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 123, right: 200),
                      child: OverflowBox(
                        maxHeight: 100,
                        child: Card(
                          color: Colors.pink,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.elliptical(15, 15),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 17,
                              vertical: 9,
                            ),
                            child: Text(
                              'From ₹$minMrp/-',
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontFamily: '',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 10, 7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Test/Package Description',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: '',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            testDescription,
                            style: const TextStyle(
                              color: Colors.black,
                              fontFamily: '',
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Card(
                        shadowColor: Colors.grey.shade200,
                        elevation: 1,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(25, 5, 15, 5),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.pink,
                                    minRadius: 32,
                                    child: Text(
                                      noOfTestsIncluded.toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: '',
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 1.85,
                                  ),
                                  const Text(
                                    'Tests included',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: '',
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                height: 55,
                                width: 5,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(top: 20.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.pink,
                                      minRadius: 32,
                                      child: Icon(
                                        Icons.description_outlined,
                                        size: 34,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Online reports\nin 48 hours',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: '',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Visibility(
                      visible: _isVisible,
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: Colors.orange.shade50,
                            isDismissible: true,
                            elevation: 3.0,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(35),
                                topRight: Radius.circular(35),
                              ),
                            ),
                            context: context,
                            builder: (context) {
                              if (test == 'thyroid care') {
                                uniqueTests = [
                                  'Thyroid Stimulating Hormone (TSH)',
                                  'Thyroxine-Total (T4)',
                                  'Triiodothyronine-Total (T3)'
                                ];
                              }
                              if (test == 'diabetes screening') {
                                uniqueTests = [
                                  'Glycosylated Haemoglobin',
                                  'Glycosylated Haemoglobin'
                                ];
                              }
                              if (test == 'hiv risk analysis') {
                                uniqueTests = [
                                  'HIV 1(Qualitative)',
                                  'HIV Antibodies'
                                ];
                              }
                              if (test == 'full vitamin check') {
                                uniqueTests = [
                                  'Vitamin B9',
                                  'Vitamin B12',
                                  'Vitamin D'
                                ];
                              }
                              if (test == 'cbc') {
                                uniqueTests = [
                                  'Absolute Monocyte Count(5)',
                                  'Haemoglobin',
                                  'Mean Corpuscular Haemoglobin Concerntraion(MCHC), Plateletcrit',
                                  'Mean Platelete Volume',
                                  'Leucocytes',
                                  'Immature Granulocyte',
                                  'Absolute Lymphocyte Count(5)',
                                  'Nucleated RBC%',
                                  'Lymphocyte'
                                ];
                              }
                              return ListView.separated(
                                itemCount: uniqueTests.length,
                                separatorBuilder: (context, index) {
                                  return Divider(
                                    color: Colors.grey.shade400,
                                    thickness: 1.5,
                                    indent: 50,
                                    endIndent: 50,
                                  );
                                },
                                itemBuilder: (context, index) {
                                  return ListView(
                                    shrinkWrap: true,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          const Text(
                                            '-',
                                            style: TextStyle(
                                              fontFamily: '',
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Flexible(
                                            child: Text(
                                              uniqueTests[index],
                                              style: const TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: '',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(left: 25, right: 0),
                          child: Text(
                            'Click here to see the included tests',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              fontFamily: '',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Card(
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 50, 10),
                              child: Text(
                                'Why should you get tested?',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: '',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(8, 6, 8, 4),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        '-',
                                        style: TextStyle(
                                          fontFamily: '',
                                          fontSize: 22,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Flexible(
                                        child: Text(
                                          suitableFor1,
                                          style: const TextStyle(
                                            fontFamily: '',
                                            fontSize: 22,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        '-',
                                        style: TextStyle(
                                          fontFamily: '',
                                          fontSize: 22,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Flexible(
                                        child: Text(
                                          suitableFor2,
                                          style: const TextStyle(
                                            fontFamily: '',
                                            fontSize: 22,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        '-',
                                        style: TextStyle(
                                          fontFamily: '',
                                          fontSize: 22,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Flexible(
                                        child: Text(
                                          suitableFor3,
                                          style: const TextStyle(
                                            fontFamily: '',
                                            fontSize: 22,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
