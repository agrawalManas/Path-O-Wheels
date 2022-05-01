import 'package:flutter/material.dart';
import 'package:path_o_wheels/menu/settings/account_settings/delete_account.dart';
import 'package:path_o_wheels/menu/settings/account_settings/edit_profie.dart';

// ignore: use_key_in_widget_constructors
class Setting extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingState();
  }
}

class _SettingState extends State<Setting> {
  bool switchValue = true;

  Widget notificationSwitch() => Transform.scale(
        scale: 1,
        child: Switch.adaptive(
          value: switchValue,
          activeColor: Colors.blue,
          onChanged: (value) {
            setState(() {
              switchValue = value;
            });
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
        ),
        elevation: 0.0,
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
            fontSize: 36.0,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Column(
            children: const [
              SizedBox(
                height: 20.0,
              ),
              CircleAvatar(
                backgroundImage: AssetImage("images/settings.jpg"),
                radius: 80.0,
              ),
              SizedBox(
                height: 5.0,
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          ExpansionTile(
            childrenPadding: const EdgeInsets.all(10),
            leading: const Icon(
              Icons.person,
              color: Colors.black54,
              size: 35,
            ),
            title: const Text(
              'Account Settings', //category 1
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.0,
                fontFamily: 'Montserrat',
              ),
            ),
            children: [
              ListTile(
                leading: const Icon(Icons.mode_edit),
                trailing: const Icon(Icons.arrow_forward_ios_sharp, size: 20),
                title: const Text(
                  "Edit Profile", //sub-category 1
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                    fontFamily: 'Montserrat',
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfile()),
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              const Divider(
                color: Colors.black38,
                thickness: 1,
                height: 1,
                indent: 20,
                endIndent: 20,
              ),
              ListTile(
                leading: const Icon(Icons.no_accounts),
                trailing: const Icon(Icons.arrow_forward_ios, size: 20),
                title: const Text(
                  "Delete Account", //sub-category 2
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                      fontFamily: 'Montserrat'),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DeleteAccount()),
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              const Divider(
                color: Colors.black38,
                thickness: 1,
                height: 1,
                indent: 20,
                endIndent: 20,
              ),
            ],
          ),
          const Divider(
            color: Colors.black26,
            height: 1,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          ExpansionTile(
            childrenPadding: const EdgeInsets.all(10),
            leading: const Icon(
              Icons.notifications,
              color: Colors.black54,
              size: 35,
            ),
            title: const Text(
              'Notifications', //category2
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.0,
              ),
            ),
            children: [
              ListTile(
                leading: const Icon(Icons.notifications_paused),
                title: const Text(
                  "Push Notifications", //sub-category 2
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                  ),
                ),
                trailing: notificationSwitch(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ],
          ),
          const Divider(
            color: Colors.black26,
            height: 1,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
        ],
      ),
    );
  }
}
