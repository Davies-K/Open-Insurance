import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pro007/Constants/constants.dart';
import 'package:pro007/screens/my_policies.dart';
import 'package:pro007/screens/payments.dart';
import 'package:pro007/screens/profile.dart';
import 'package:pro007/screens/timeline.dart';
import 'dart:core';

import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 1;
  int currentIndex = 1;
  Widget currentScreen = Timeline();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();
    getKeyCode();
    setState(() {
      currentTab = 1;
      currentIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // appDrawer
    var item1 = new ListTile(
      title: Text('Dashboard', style: paragraphText()),
      leading: Icon(Feather.home),
      onTap: () {},
    );
    var item2 = new ListTile(
      title: Text('Insurance Product', style: paragraphText()),
      leading: Icon(Feather.gift),
      onTap: () {},
    );
    var item3 = new ListTile(
      title: Text('About Us', style: paragraphText()),
      leading: Icon(Icons.help),
      onTap: () {},
    );

    var item5 = new ListTile(
      title: Text('Hotlines', style: paragraphText()),
      leading: Icon(Feather.phone_call),
      onTap: () {},
    );

    var item8 = new ListTile(
        title: Text('Logout', style: paragraphText()),
        leading: Icon(Feather.power),
        onTap: () {});

    var item10 = new ListTile(
        title: Text('Terms and Condition', style: paragraphText()),
        leading: Icon(Feather.settings),
        onTap: () {});

    var item9 = new ListTile(
      title: Text('About', style: paragraphText()),
      leading: Icon(Feather.info),
      onTap: () {},
    );

    final drawerHeader = UserAccountsDrawerHeader(
        decoration: BoxDecoration(color: primarycolor),
        accountName: Text('Gyasi Nimako', style: headerText()),
        accountEmail: Text('Individual',
            style: paragraphText().copyWith(color: Colors.white)),
        currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Feather.user, color: primarycolor))

        // child: Image.asset('assets/images/bed.gif'),
        );

    var children = [
      drawerHeader,
      item1,
      item2,
      item3,
      // item4,
      item5,

      // item8,
      new Divider(height: 2),

      item10,
      item8,
      item9
    ];

    var drawer = new Drawer(child: ListView(children: children));
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        toolbarHeight: 50,
        backgroundColor: primarycolor,
        actions: [
          Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.05),
            child: IconButton(
                icon: Icon(Feather.message_square, color: Colors.white)),
          )
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Quality Insurance",
              style: headerText(),
            ),
          ],
        ),
      ),
      backgroundColor: whiteColor,
      body: PageStorage(child: currentScreen, bucket: bucket),
      drawer: drawer,
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        showElevation: true,
        itemCornerRadius: 8,
        curve: Curves.easeInBack,
        onItemSelected: (index) => setState(() {
          currentIndex = index;
          if (index == 0) {
            currentScreen = Timeline();
            currentTab = 1;
          } else if (index == 1) {
            currentScreen = MyPolicies();
            // currentScreen = QRCodeWebLogin(false);
            currentTab = 2;
          } else if (index == 2) {
            // currentScreen = ScheduledPayment(false);
            currentScreen = Payments();
            currentTab = 3;
          } else if (index == 3) {
            currentScreen = Profile();
            currentTab = 4;
          }
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Feather.home),
            title: Text(
              'Home',
              style: semiBoldfieldText(),
            ),
            activeColor: currentTab == 1 ? activeColor : inactiveColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.select_all),
            title: Text('My Policies', style: semiBoldfieldText()),
            activeColor: currentTab == 2 ? activeColor : inactiveColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.schedule),
            title: Text('Payments', style: semiBoldfieldText()),
            activeColor: currentTab == 3 ? activeColor : inactiveColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Feather.user),
            title: Text('Profile', style: semiBoldfieldText()),
            activeColor: currentTab == 4 ? activeColor : inactiveColor,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  getKeyCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('keyCode') != null) {
      mv1 = prefs.getString('keyCode');
    }
    print(mv1);
  }
}
