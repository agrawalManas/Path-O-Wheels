import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:path_o_wheels/payment/payment.dart';

// ignore: use_key_in_widget_constructors
class ReviewOrder extends StatefulWidget {
  String testName = '';
  String vendorName = '';
  String orderID = '';
  ReviewOrder(
      {Key? key,
      required this.testName,
      required this.vendorName,
      required this.orderID})
      : super(key: key) {
    testName = testName;
    vendorName = vendorName;
    orderID = orderID;
  }
  @override
  State<ReviewOrder> createState() => _ReviewOrderState();
}

class _ReviewOrderState extends State<ReviewOrder> {
  bool _isChecked = false;
  String bookedFor = '';
  String sampleCollectionAddress = '';
  String consultedVendor = '';
  String timeSlot = '';
  String preferdDate = '';
  String contactNumber = '';
  String testName = '';
  String vendorName = '';
  String orderID = '';

  int mrp = 0;
  var convenience;
  var taxes;
  var totalAmount;

  @override
  Widget build(BuildContext context) {
    testName = widget.testName;
    vendorName = widget.vendorName;
    orderID = widget.orderID;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              size: 28,
              color: Colors.black,
            ),
          ),
          title: const Text(
            'Order Details',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.deepOrange[400],
        child: TextButton(
          autofocus: true,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Continue to Payment Details',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          onPressed: () {
            showModalBottomSheet(
              isDismissible: false,
              elevation: 3.0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              context: context,
              builder: (context) {
                return StatefulBuilder(
                  builder: (BuildContext context, StateSetter statesetter) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child:
                          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                        stream: FirebaseFirestore.instance
                            .collection('tests')
                            .doc(testName)
                            .collection('pathologies')
                            .doc(vendorName)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return const Text("Something went wrong");
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            var myDoc = snapshot.data!.data();
                            mrp = myDoc!["mrp"];
                            convenience = myDoc['convenience'];
                            taxes = myDoc['taxes'];
                            totalAmount = mrp + convenience + taxes;
                            return Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    'Payment Details',
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Divider(
                                    height: 2,
                                    thickness: 3,
                                    color: Colors.indigo,
                                    indent: 40.5,
                                    endIndent: 40.5,
                                  ),
                                  const SizedBox(
                                    height: 22,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'MRP',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 170,
                                      ),
                                      Text(
                                        '₹${(mrp + (0.2 * mrp)).toInt().toString()}',
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        '₹${mrp.toString()}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Collection Fee',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 140,
                                      ),
                                      const Text(
                                        '₹${115}',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        '₹${convenience.toString()}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Taxes (inclusive of GST)',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        taxes.toString(),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Amount to be paid ',
                                        style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '₹${totalAmount.toString()}',
                                        style: const TextStyle(
                                          color: Colors.pink,
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Checkbox(
                                        activeColor: Colors.white,
                                        checkColor: Colors.black,
                                        value: _isChecked,
                                        onChanged: (value) {
                                          statesetter(() {
                                            _isChecked = !_isChecked;
                                          });
                                        },
                                      ),
                                      const Text(
                                        'I hereby confirm that I have gone\nthrough all the details.',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Montserrat',
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Material(
                                    elevation: 5,
                                    borderRadius: BorderRadius.circular(30),
                                    color: _isChecked
                                        ? Colors.redAccent
                                        : Colors.grey,
                                    child: MaterialButton(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 40,
                                        vertical: 15,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Payment(orderId: orderID),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        "Confirm & Pay",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 20,
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
                        },
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('bookings')
            .doc(orderID)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var myDoc = snapshot.data!.data();
            bookedFor = myDoc!["Patient Name"];
            testName = myDoc['Test/Package'];
            contactNumber = myDoc['Contact Number'];
            consultedVendor = myDoc['Consulted Vendor'];
            sampleCollectionAddress = myDoc['Sample Collection Address'];
            preferdDate = myDoc['Sample Collection Date'];
            timeSlot = myDoc['Time Slot'];

            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: Column(
                children: [
                  Card(
                    elevation: 3,
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.indigo),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 25, 15, 15),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Test/Health Package',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 20,
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  testName.toUpperCase(),
                                  maxLines: 3,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Booked For',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Flexible(
                                child: Text(
                                  bookedFor,
                                  maxLines: 3,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Flexible(
                                child: Text(
                                  'Sample Collection Address',
                                  maxLines: 3,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Flexible(
                                child: Text(
                                  sampleCollectionAddress,
                                  maxLines: 7,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Contact Number',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                contactNumber,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Preferd Date',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Flexible(
                                child: Text(
                                  preferdDate,
                                  maxLines: 3,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Time Slot',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                timeSlot,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Consulted Vendor',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                consultedVendor,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 55),
                    child: Container(
                      height: 160,
                      width: 340,
                      decoration: const BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(55),
                          )),
                      child: const Center(
                        child: Text(
                          'Health tips',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
