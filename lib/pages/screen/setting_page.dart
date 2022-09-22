import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app_spotify/pages/screen/editprofile_page.dart';

import '../../theme/colors.dart';
import '../widget/settings_tile.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool ValueNotifier1 = false;
  bool ValueNotifier2 = true;
  bool ValueNotifier3 = true;

  onChangeFunction1(bool newValue1){
    setState(() {
      ValueNotifier1 = newValue1;
    });
  }

  onChangeFunction2(bool newValue2){
    setState(() {
      ValueNotifier2 = newValue2;
    });
  }

  onChangeFunction3(bool newValue3){
    setState(() {
      ValueNotifier3 = newValue3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: black,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Settings",
                style: TextStyle(
                    fontSize: 20, color: white, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.settings),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              SettingsTile(
                color: Colors.blue,
                icon: Icons.account_circle,
                title: "Account",
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              SettingsTile(
                color: Colors.green,
                icon: Icons.edit,
                title: "Edit Information",
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => EditProfilePage()
                  ));
                },
              ),
              const SizedBox(
                height: 40,
              ),
              SettingsTile(
                color: Colors.yellow.shade700,
                icon: Icons.person_add,
                title: "Invite a friend",
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              SettingsTile(
                color: Colors.purple,
                icon: Icons.translate,
                title: "Language",
                onTap: () {},
              ),
              const SizedBox(
                height: 40,
              ),
              SettingsTile(
                color: Colors.red,
                icon: Icons.logout,
                title: "Logout",
                onTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
            const Divider(
              color: white,
              height: 30,
              thickness: 1,
            ),
            const SizedBox(
              height: 20,
            ),
            buildNotificationOption("Theme Mode", ValueNotifier1, onChangeFunction1),
            buildNotificationOption("Opportunity", ValueNotifier2, onChangeFunction2),
            buildNotificationOption("App Notifications", ValueNotifier3, onChangeFunction3), 
            ],
          ),
        ),
      ),
    );
  }

  Padding buildNotificationOption(String title, bool value, Function onChangeMethod){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: primary,
              trackColor: grey,
              value: value,
              onChanged: (bool newValue){
                onChangeMethod(newValue);
              },
            ),
          ),
        ],
      ),
    );
  }
  
}
