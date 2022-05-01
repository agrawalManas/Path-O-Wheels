import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_o_wheels/payment/payment_success.dart';

// ignore: use_key_in_widget_constructors
class Payment extends StatefulWidget {
  String orderId = '';
  Payment({Key? key, required this.orderId}) : super(key: key) {
    orderId = orderId;
  }

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String orderID = '';
  int value = 0;
  final paymentLabels = [
    'Pay on Collection',
    'Credit/Debit Card',
    'UPI',
    'Wallets'
  ];
  final paymentDescription = [
    'Cash Payment upon sample collection',
    'Pay via MasterCard, Visa etc',
    'Pay via Google Pay, PhonePe',
    'Pay via Paytm Wallets, PhonePe Wallet'
  ];

  @override
  Widget build(BuildContext context) {
    orderID = widget.orderId;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Payment',
          style: TextStyle(
            color: Colors.indigo,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 28,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Select a Payment Method',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: paymentLabels.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Radio(
                    activeColor: Colors.pink.shade200,
                    value: index,
                    groupValue: value,
                    onChanged: (i) => setState(() => value = index),
                  ),
                  title: Text(
                    paymentLabels[index],
                    style: TextStyle(
                      color: Colors.pink.shade700,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                  subtitle: Text(
                    paymentDescription[index],
                    style: TextStyle(
                      color: Colors.pink.shade400,
                      fontSize: 20,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey.shade300,
                  thickness: 2,
                  indent: 30,
                  endIndent: 30,
                );
              },
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100, right: 100, bottom: 20),
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(5),
              color: Colors.indigo.shade800,
              child: MaterialButton(
                padding: const EdgeInsets.fromLTRB(35, 10, 35, 10),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentSuccess(
                        orderId: orderID,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Pay",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 22,
                        color: Colors.white,
                      )
                    ],
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
