import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    double kDesignWidth = 375;
    double kDesignHeight = 812;
    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          topic(context, 'Terms & conditions', _widthScale),
          topic(context, 'Legality', _widthScale),
          topic(context, 'Privacy Policy', _widthScale),
          topic(context, 'Cancellation Policy', _widthScale),
          topic(context, 'Contact Us', _widthScale),
          topic(context, 'About Us', _widthScale),
          topic(context, 'Notification', _widthScale),
          topic(context, 'Logout', _widthScale),
        ],
      ),
    );
  }

  Widget topic(BuildContext context, var topic, double width) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: 15 * width, horizontal: 22 * width),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            topic,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18 * width,
                fontWeight: FontWeight.w700),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 20 * width,
          )
        ],
      ),
    );
  }
}
