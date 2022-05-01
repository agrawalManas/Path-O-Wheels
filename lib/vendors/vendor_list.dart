import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:path_o_wheels/lab_tests/book_test.dart';
import 'package:path_o_wheels/shared/loading.dart';

// ignore: must_be_immutable
class VendorList extends StatefulWidget {
  String testName = '';
  VendorList({Key? key, required this.testName}) : super(key: key) {
    testName = testName;
  }
  @override
  State<VendorList> createState() => _VendorListState();
}

class _VendorListState extends State<VendorList> {
  bool _isBack = false;
  final flipCardController = FlipCardController();
  List<bool> bordersColors = [];
  @override
  Widget build(BuildContext context) {
    var test = widget.testName;
    String selectedVendor = '';
    CollectionReference collectionTests = FirebaseFirestore.instance
        .collection('tests')
        .doc(test)
        .collection('pathologies');

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.deepOrange.shade400,
        title: const Text(
          'Select a Vendor',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: collectionTests.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final myDocs = snapshot.data!.docs;
            try {
              return ListView.builder(
                itemCount: myDocs.length,
                itemBuilder: (context, index) {
                  bordersColors.add(false);
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(17, 11, 17, 11),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _isBack = !_isBack;
                          flipCardController.toggleCard();
                        });
                      },
                      child: Card(
                        elevation: 5.0,
                        shadowColor: Colors.deepOrange.shade50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                            width: 1.5,
                            color:
                                _isBack ? Colors.green.shade700 : Colors.white,
                          ),
                        ),
                        child: FlipCard(
                          onFlipDone: (status) {
                            Future.delayed(const Duration(milliseconds: 500),
                                () {
                              selectedVendor = myDocs[index]['name'];
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookTest(
                                    testName: test,
                                    vendorName: selectedVendor,
                                  ),
                                ),
                              );
                              setState(() {
                                flipCardController.toggleCard();
                              });
                            });
                          },
                          controller: flipCardController,
                          speed: 800,
                          front: ListTile(
                            contentPadding: const EdgeInsets.all(8),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  myDocs[index]['name'],
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Card(
                                  color: Colors.indigo,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 5,
                                    ),
                                    child: Text(
                                      "₹ ${myDocs[index]['mrp'].toString()}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 12, 8),
                              child: Text(
                                myDocs[index]['description'],
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          back: Container(
                            height: 200,
                            width: 400,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.green.shade700,
                                width: 1.5,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                const Divider(
                                  color: Colors.indigo,
                                  height: 2,
                                  thickness: 2.0,
                                  indent: 20,
                                  endIndent: 100,
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                    'Confirming your test with\n${myDocs[index]['name']}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Loading(),
                                ),
                                const SizedBox(
                                  height: 17,
                                ),
                                const Divider(
                                  color: Colors.indigo,
                                  height: 2,
                                  thickness: 2.0,
                                  indent: 100,
                                  endIndent: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } catch (e) {
              return const Center(
                child: Card(
                  child: Text(
                    'Something went wrong, please check your connection',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
