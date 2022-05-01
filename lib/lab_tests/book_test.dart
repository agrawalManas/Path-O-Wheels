import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:path_o_wheels/models/twilio.dart';
import 'package:path_o_wheels/payment/review_order.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

// ignore: must_be_immutable
class BookTest extends StatefulWidget {
  String testName = '';
  String vendorName = '';
  BookTest({Key? key, required this.testName, required this.vendorName})
      : super(key: key) {
    testName = testName;
    vendorName = vendorName;
  }
  @override
  State<BookTest> createState() => _BookTestState();
}

class _BookTestState extends State<BookTest> {
  int start = 30;
  int currentStep = 0;
  int otp = 1;
  bool isCompleted = false;
  bool buttonVisibility = false;
  bool wait = false;
  bool numberVerified = false;
  String buttonName = "Send OTP";
  String smsCode = "";
  String testName = '';
  String email = '';
  String orderID = '';
  String selectedVendor = '';
  String timeSlot = '12:00 - 3:00pm';
  String timeSlot1 = '8:00 - 11:00am';
  String timeSlot2 = '12:00 - 3:00pm';
  String timeSlot3 = '4:00 - 7:00pm';
  String timeSlot4 = '8:00 - 11:00pm';

  TextEditingController phoneController = TextEditingController();
  TextEditingController patientName = TextEditingController();
  TextEditingController patientAddress = TextEditingController();
  TextEditingController patientPhoneNumber = TextEditingController();
  OtpFieldController otpFieldController = OtpFieldController();

  var label1Color = Colors.black;
  var card1Color = Colors.white;
  var label2Color = Colors.black;
  var card2Color = Colors.white;
  var label3Color = Colors.black;
  var card3Color = Colors.white;
  var label4Color = Colors.black;
  var card4Color = Colors.white;

  late TwilioFlutter twilioFlutter;
  Twilio twilio = Twilio();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    twilioFlutter = TwilioFlutter(
      accountSid: twilio.accountSID,
      authToken: twilio.authToken,
      twilioNumber: twilio.phoneNumber,
    );
    super.initState();
  }

  List<Step> getSteps() => [
        Step(
          title: const Text(
            'Patient Details',
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Montserrat',
            ),
          ),
          isActive: currentStep >= 0,
          content: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: patientName,
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                  decoration: InputDecoration(
                    labelText: "Patient's Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  validator: MultiValidator([
                    RequiredValidator(errorText: "This is required field"),
                  ]),
                  onSaved: (value) {
                    setState(() {
                      patientName.text = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  maxLines: 3,
                  controller: patientAddress,
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                  decoration: InputDecoration(
                    labelText: "Patient's Address",
                    hintText: "Sample Pickup Location",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  validator: MultiValidator(
                    [RequiredValidator(errorText: "This is required field")],
                  ),
                  onSaved: (value) {
                    setState(() {
                      patientAddress.text = value!;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        Step(
          title: const Text(
            'Date & Time Slot',
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Montserrat',
            ),
          ),
          isActive: currentStep >= 1,
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          content: Column(
            children: [
              const SizedBox(
                height: 7,
              ),
              DatePicker(
                DateTime.now(),
                height: 80,
                width: 55,
                initialSelectedDate: DateTime.now(),
                selectedTextColor: Colors.white,
                selectionColor: Colors.indigo,
                daysCount: 5,
                dateTextStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                onDateChange: (date) {
                  _selectedDate = date;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    color: card1Color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          timeSlot = timeSlot1;
                          card1Color = Colors.indigo;
                          label1Color = Colors.white;
                          label2Color = Colors.black;
                          card2Color = Colors.white;
                          label3Color = Colors.black;
                          card3Color = Colors.white;
                          label4Color = Colors.black;
                          card4Color = Colors.white;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
                        child: Text(
                          timeSlot1,
                          style: TextStyle(
                            color: label1Color,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Card(
                    color: card2Color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          timeSlot = timeSlot2;
                          label2Color = Colors.white;
                          card2Color = Colors.indigo;
                          label1Color = Colors.black;
                          card1Color = Colors.white;
                          label3Color = Colors.black;
                          card3Color = Colors.white;
                          label4Color = Colors.black;
                          card4Color = Colors.white;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
                        child: Text(
                          timeSlot2,
                          style: TextStyle(
                            color: label2Color,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Card(
                    color: card3Color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          timeSlot = timeSlot3;
                          card3Color = Colors.indigo;
                          label3Color = Colors.white;
                          label2Color = Colors.black;
                          card2Color = Colors.white;
                          label1Color = Colors.black;
                          card1Color = Colors.white;
                          label4Color = Colors.black;
                          card4Color = Colors.white;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text(
                          timeSlot3,
                          style: TextStyle(
                            color: label3Color,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Card(
                    color: card4Color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          timeSlot = timeSlot4;
                          card4Color = Colors.indigo;
                          label4Color = Colors.white;
                          label2Color = Colors.black;
                          card2Color = Colors.white;
                          label3Color = Colors.black;
                          card3Color = Colors.white;
                          label1Color = Colors.black;
                          card1Color = Colors.white;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text(
                          timeSlot4,
                          style: TextStyle(
                            color: label4Color,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Step(
          title: const Text(
            'Verify Phone Number',
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Montserrat',
            ),
          ),
          isActive: currentStep >= 2,
          content: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  controller: phoneController,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    hintText: "Enter your phone Number",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 19, horizontal: 8),
                    prefixIcon: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 15),
                      child: Text(
                        " (+91) ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 80,
                  ),
                  InkWell(
                    onTap: wait
                        ? null
                        : () async {
                            startTimer();
                            setState(() {
                              start = 30;
                              wait = true;
                              buttonName = "Resend";
                              buttonVisibility = !buttonVisibility;
                              sendSms();
                            });
                          },
                    child: Container(
                      margin: const EdgeInsets.only(left: 0),
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                      decoration: BoxDecoration(
                        color: wait ? Colors.grey : Colors.indigo,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Text(
                        buttonName,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              OTPTextField(
                controller: otpFieldController,
                length: 4,
                width: MediaQuery.of(context).size.width - 70,
                fieldWidth: 45,
                textFieldAlignment: MainAxisAlignment.center,
                otpFieldStyle: OtpFieldStyle(
                  borderColor: Colors.black,
                ),
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.indigo,
                  fontWeight: FontWeight.w900,
                ),
                fieldStyle: FieldStyle.underline,
                onCompleted: (pin) {
                  debugPrint("Completed: " + pin);
                  setState(() {
                    smsCode = pin;
                  });
                },
              ),
              const SizedBox(
                height: 15,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Send OTP again in ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: "00:$start",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.indigo,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const TextSpan(
                      text: " sec ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Visibility(
                visible: buttonVisibility,
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.deepOrange,
                  child: MaterialButton(
                    padding: const EdgeInsets.fromLTRB(8, 7, 8, 7),
                    onPressed: () {
                      verifyOTP();
                    },
                    child: const Text(
                      "Verify",
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
        ),
      ];

  @override
  Widget build(BuildContext context) {
    testName = widget.testName;
    selectedVendor = widget.vendorName;
    email = FirebaseAuth.instance.currentUser!.email!;
    return Scaffold(
      backgroundColor: Colors.deepOrange.shade200,
      body: ListView(
        children: [
          Container(
            height: 155,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4, left: 4),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 28,
                      color: Colors.black,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Center(
                      child: Text(
                        testName.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      'from $selectedVendor',
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 80,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(25),
              ),
            ),
            child: ListView(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: const ColorScheme.light(
                      primary: Colors.deepOrange,
                    ),
                  ),
                  child: Stepper(
                    steps: getSteps(),
                    currentStep: currentStep,
                    onStepContinue: () {
                      final secondLastStep =
                          currentStep == getSteps().length - 2;
                      if (secondLastStep) {
                        debugPrint(timeSlot);
                        debugPrint(_selectedDate.toString());
                      }
                      final lastStep = currentStep == getSteps().length - 1;
                      if (lastStep) {
                        isCompleted = verifyOTP();
                        if (isCompleted) {
                          setState(() {
                            Future.delayed(const Duration(seconds: 2), () {
                              Navigator.pushReplacement(
                                (context),
                                MaterialPageRoute(
                                  builder: (context) => ReviewOrder(
                                    testName: testName,
                                    vendorName: selectedVendor,
                                    orderID: orderID,
                                  ),
                                ),
                              );
                            });
                          });
                        }
                        //send data to server
                        addBooking();
                      } else {
                        setState(() {
                          currentStep += 1;
                        });
                      }
                    },
                    onStepCancel: () {
                      if (currentStep != 0) {
                        setState(() => currentStep -= 1);
                      }
                    },
                    controlsBuilder: (context, {onStepCancel, onStepContinue}) {
                      final firstStep = currentStep == getSteps().length - 3;
                      if (firstStep) {
                        return Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 10, left: 8),
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    setState(() {
                                      currentStep += 1;
                                    });
                                  }
                                },
                                child: const Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                      final lastStep = currentStep == getSteps().length - 1;
                      return Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: onStepContinue,
                                child: Text(
                                  lastStep ? 'CONFIRM' : 'NEXT',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              if (currentStep != 0)
                                ElevatedButton(
                                  onPressed: onStepCancel,
                                  child: const Text(
                                    'BACK',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int randomNumber({required int min, required int max}) {
    int number = min + Random().nextInt(max - min);
    return number;
  }

  void sendSms() async {
    otp = randomNumber(min: 1000, max: 10000);
    twilioFlutter.sendSMS(
      toNumber: '+91${phoneController.text}',
      messageBody:
          'Thank Your for choosing Path-O-Wheels \n Your OTP is $otp and is valid for 5 minutes.',
    );
  }

  bool verifyOTP() {
    if (otp.toString() != smsCode.toString()) {
      Fluttertoast.showToast(msg: 'OTP is invalid, please try again');
      return false;
    } else {
      Fluttertoast.showToast(
          msg: 'OTP verified successfully, please continue!');
      return true;
    }
  }

  void addBooking() async {
    if (verifyOTP()) {
      var selectedDate = DateFormat('dd-MM-yyyy').format(_selectedDate);
      var currentTime = DateTime.now();
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      await firebaseFirestore.collection("bookings").add({
        'Patient Name': patientName.text,
        'Sample Collection Address': patientAddress.text,
        'Contact Number': phoneController.text,
        'Date and Time Of Booking': currentTime,
        'Sample Collection Date': selectedDate,
        'Time Slot': timeSlot,
        'Test/Package': testName, // test/package name obtained from last route
        'Consulted Vendor': selectedVendor,
        'Email': email,
      }).then(
        (value) => {
          orderID = value.id,
          debugPrint('Order ID is $orderID'),
          addOrderID(orderID),
          Fluttertoast.showToast(msg: 'Test Booked Successfully'),
        },
      );
    }
  }

  void addOrderID(String orderID) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    await firebaseFirestore
        .collection("bookings")
        .doc(orderID)
        .update({"Order ID": orderID});
  }

  void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = false;
          start = 30;
          otpFieldController.clear();
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }
}
