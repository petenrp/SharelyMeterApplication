import 'package:flutter/material.dart';
import 'package:sharelymeter/constants.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:sharelymeter/screens/account/account_screen.dart';
import 'package:sharelymeter/screens/activity/activity_screen.dart';
import 'package:sharelymeter/screens/add/add_screen.dart';
import 'package:sharelymeter/screens/home/home_screen.dart';
import 'package:sharelymeter/screens/home/wrapper.dart';
import 'package:sharelymeter/screens/notification/notification_screen.dart';
import 'package:sharelymeter/screens/welcome/welcomescreen.dart';

import 'package:sharelymeter/prematching/map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sharelymeter/googlemapapi.dart'; // Stores the Google Maps API Key
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sharly Meter',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        appBarTheme: AppBarTheme(color: kPrimaryColor, elevation: 0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //ถ้า Log-in แล้วให้เข้า SharlyMeter() ถ้ายังไม่ Log-in ให้เข้า WelcomeScreen()
      //home: SharlyMeter(),
      home: Wrapper(),
    );
  }
}

class SharlyMeter extends StatefulWidget {
  @override
  _SharlyMeterState createState() => _SharlyMeterState();
}

class _SharlyMeterState extends State<SharlyMeter> {
  int _selectedItemIndex = 0;
  final List pages = [
    HomeScreen(),
    ActivityScreen(),
    AddScreen(),
    NotificationScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: <Widget>[
          buildNavBarItem(FlutterIcons.home_mdi, 0),
          buildNavBarItem(FlutterIcons.extension_mdi, 1),
          buildNavBarItem(FlutterIcons.add_circle_mdi, 2),
          buildNavBarItem(FlutterIcons.inbox_mdi, 3),
          buildNavBarItem(FlutterIcons.account_circle_mdi, 4),
        ],
      ),
      body: pages[_selectedItemIndex],
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
        });
      },
      child: Container(
        height: 80,
        padding: EdgeInsets.only(
          bottom: kDefaultPadding,
        ),
        width: MediaQuery.of(context).size.width / 5,
        decoration: BoxDecoration(
          //color: index == _selectedItemIndex ? kPrimaryColor: Colors.white,
          color: Colors.white,
        ),
        child: Icon(
          icon,
          size: 30,
          color: index == _selectedItemIndex ? kPrimaryColor : Colors.grey,
        ),
      ),
    );
  }
}
