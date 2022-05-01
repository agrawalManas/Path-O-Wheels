import 'package:flutter/material.dart';
import 'package:path_o_wheels/menu/about_us/about_us.dart';
import 'package:path_o_wheels/menu/need_help/need_help.dart';
import 'package:path_o_wheels/menu/partner_with_us/partner_with_us.dart';
import 'package:path_o_wheels/menu/settings/settings.dart';
import 'package:path_o_wheels/authentication/authenticate.dart';
import 'package:path_o_wheels/lab_tests/test_description.dart';
import 'package:path_o_wheels/lab_tests/test_list.dart';

// ignore: use_key_in_widget_constructors
class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  Authenticate auth = Authenticate();

  Widget drawer() {
    DateTime now = DateTime.now();
    if (now.hour >= 4 && now.hour < 17) // morning and noon
    {
      return Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue.shade400,
                Colors.yellow.shade100,
                Colors.orange.shade100
              ],
            ),
          ),
          child: ListView(
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'images/noon.jpg',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: SizedBox(
                  height: 2,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black45,
                  size: 20,
                ),
                title: const Text(
                  'Book A Test',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TestList()));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                selectedTileColor: Colors.redAccent[100],
              ),
              const Divider(
                height: 2,
              ),
              ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black54,
                  size: 20,
                ),
                title: const Text(
                  'My Tests',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {},
              ),
              const Divider(
                height: 2,
                color: Colors.black38,
              ),
              ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black54,
                  size: 20,
                ),
                title: const Text(
                  'Need Help',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NeedHelp()));
                },
              ),
              const Divider(
                height: 2,
                color: Colors.black87,
              ),
              ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black54,
                  size: 20,
                ),
                title: const Text(
                  'Settings',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Setting(),
                    ),
                  );
                },
              ),
              const Divider(
                height: 2,
                color: Colors.black12,
              ),
              ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black54,
                  size: 20,
                ),
                title: const Text(
                  'About Us ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutUs(),
                    ),
                  );
                },
              ),
              const Divider(
                height: 2,
                color: Colors.black12,
              ),
              ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black54,
                  size: 20,
                ),
                title: const Text(
                  'Partner With Us',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PartnerWithUs(),
                    ),
                  );
                },
              ),
              const Divider(
                height: 2,
              ),
            ],
          ),
        ),
      );
    } else if (now.hour >= 17 && now.hour < 19) //sunset time
    {
      return Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.pinkAccent.shade100,
                Colors.deepOrangeAccent.shade200,
                Colors.red.shade300,
                Colors.orange.shade300,
              ],
            ),
          ),
          child: ListView(
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'images/sunset.jpg',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: SizedBox(
                  height: 2,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black54,
                  size: 20,
                ),
                title: const Text(
                  'Book A Test',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TestList()));
                },
              ),
              const Divider(
                height: 2,
              ),
              ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black54,
                  size: 20,
                ),
                title: const Text(
                  'My Tests',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {},
              ),
              const Divider(
                height: 2,
                color: Colors.black38,
              ),
              ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black54,
                  size: 20,
                ),
                title: const Text(
                  'Need Help',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NeedHelp()));
                },
              ),
              const Divider(
                height: 2,
                color: Colors.black87,
              ),
              ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black54,
                  size: 20,
                ),
                title: const Text(
                  'Settings',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Setting(),
                    ),
                  );
                },
              ),
              const Divider(
                height: 2,
                color: Colors.black12,
              ),
              ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black54,
                  size: 20,
                ),
                title: const Text(
                  'About Us ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutUs()));
                },
              ),
              const Divider(
                height: 2,
                color: Colors.black12,
              ),
              ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black54,
                  size: 20,
                ),
                title: const Text(
                  'Partner With Us',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PartnerWithUs()),
                  );
                },
              ),
              const Divider(
                height: 2,
              ),
            ],
          ),
        ),
      );
    } else //evening
    {
      return Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.indigo.shade600,
                Colors.deepPurple.shade300,
              ],
            ),
          ),
          child: ListView(
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'images/evening.jpg',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: SizedBox(
                  height: 2,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                  size: 20,
                ),
                title: const Text(
                  'Book A Test',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TestList()));
                },
              ),
              const Divider(
                height: 2,
                color: Colors.white12,
              ),
              ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                  size: 20,
                ),
                title: const Text(
                  'My Tests',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {},
              ),
              const Divider(
                height: 2,
                color: Colors.white54,
              ),
              ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                  size: 20,
                ),
                title: const Text(
                  'Need Help',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NeedHelp()));
                },
              ),
              const Divider(
                height: 2,
                color: Colors.white70,
              ),
              ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                  size: 20,
                ),
                title: const Text(
                  'Settings',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Setting(),
                    ),
                  );
                },
              ),
              const Divider(
                height: 2,
                color: Colors.white12,
              ),
              ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                  size: 20,
                ),
                title: const Text(
                  'About Us ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutUs()),
                  );
                },
              ),
              const Divider(
                height: 2,
                color: Colors.white12,
              ),
              ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                  size: 20,
                ),
                title: const Text(
                  'Partner With Us',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PartnerWithUs()),
                  );
                },
              ),
              const Divider(
                height: 2,
                color: Colors.white38,
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _showAlertDialog() async {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            title: const Text(
              'Logout',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
            content: const Text(
              'Are you sure, you want to logout?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                fontFamily: 'Montserrat',
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  TextButton(
                    onPressed: () {
                      auth.signOut(context);
                    },
                    child: const Text(
                      'Yes, Log me out',
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(170),
        child: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                _showAlertDialog();
              },
              icon: const Icon(
                Icons.logout_outlined,
                size: 30,
              ),
            )
          ],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          flexibleSpace: Container(
            child: Stack(
              children: [
                const Positioned(
                  top: 55,
                  left: 70,
                  child: Text(
                    'Hello User',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Montserrat",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: 120,
                  bottom: 12,
                  left: 15,
                  right: 15,
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          blurRadius: 5,
                          color: Colors.red,
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 25.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search for Tests/Packages",
                          hintStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          suffixIcon: Icon(Icons.search_sharp),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                gradient: LinearGradient(
                  colors: [Colors.redAccent, Color(0xFFEF9A9A)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )),
          ),
        ),
      ),
      drawer: drawer(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 1, 15, 10),
        child: ListView(
          children: [
            const SizedBox(
              height: 35,
            ),
            const Text(
              'Popular Health Packages',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 170,
                        height: 210,
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    TestDescription(testName: 'thyroid care'),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(12, 18, 14, 12),
                            child: Text(
                              "Complete\nThyroid Care",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 17.0,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Provided by 6 labs',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Padding(
                            padding: EdgeInsets.all(9),
                            child: Text(
                              'Upto 25% off \non MRP',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 160,
                        height: 210,
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TestDescription(
                                  testName: 'full vitamin check',
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(12, 18, 14, 12),
                            child: Text(
                              "Full Vitamin\nCheck",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Provided by 6 labs',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Padding(
                            padding: EdgeInsets.all(9),
                            child: Text(
                              'Upto 25% off \non MRP',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 155,
                        height: 210,
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TestDescription(
                                  testName: 'diabetes screening',
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(19, 18, 14, 12),
                            child: Text(
                              "Diabetes\nScreening",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Provided by 6 labs',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Padding(
                            padding: EdgeInsets.all(9),
                            child: Text(
                              'Upto 25% off \non MRP',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 155,
                        height: 210,
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TestDescription(
                                  testName: 'hiv risk analysis',
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(26, 18, 14, 12),
                            child: Text(
                              "HIV Risk\nAnalysis",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Provided by 6 labs',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Padding(
                            padding: EdgeInsets.all(9),
                            child: Text(
                              'Upto 25% off \non MRP',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Popular Tests',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  child: const Text(
                    'View all',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TestList(),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 150,
                        height: 190,
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    TestDescription(testName: 'covid antigen'),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(25, 14, 14, 12),
                            child: Text(
                              "Covid \n Antigen",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Provided by 5 labs',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Padding(
                            padding: EdgeInsets.all(9),
                            child: Text(
                              'Upto 20% off \non MRP',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 150,
                        height: 190,
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    TestDescription(testName: 'cholestrol'),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(18, 25, 14, 12),
                            child: Text(
                              "Cholestrol",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Provided by 6 labs',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Padding(
                            padding: EdgeInsets.all(9),
                            child: Text(
                              'Upto 25% off \non MRP',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 150,
                        height: 190,
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    TestDescription(testName: 'pregnancy test'),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(17, 14, 14, 12),
                            child: Text(
                              "Pregnancy\nTest",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Provided by 6 labs',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Padding(
                            padding: EdgeInsets.all(9),
                            child: Text(
                              'Upto 20% off \non MRP',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 150,
                        height: 190,
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TestDescription(
                                    testName: 'malaria antigen'),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(28, 14, 14, 12),
                            child: Text(
                              "Malaria \nAntigen",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Provided by 6 labs',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Padding(
                            padding: EdgeInsets.all(9),
                            child: Text(
                              'Upto 20% off \non MRP',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 150,
                        height: 190,
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TestDescription(
                                    testName: 'rabbies antigen'),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(28, 14, 14, 12),
                            child: Text(
                              "Rabies \nAntigen",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Provided by 4 labs',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Padding(
                            padding: EdgeInsets.all(9),
                            child: Text(
                              'Upto 15% off \non MRP',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            const Text(
              'Our Trusted Vendors',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'images/dr_lal.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Card(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'images/srl.jpg',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Card(
                    child: Container(
                      width: 160,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'images/unicure.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Card(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'images/shagun.jpg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Card(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'images/priyanjali.jpg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
