import 'package:core/utils/utils.dart';
import 'package:flutter/material.dart';

class MyBookingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyBookingScreen();
  }
}

class _MyBookingScreen extends State<MyBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColorGray,
      body: Container(
        decoration: BoxDecoration(),
        child: Text(" My Booking"),
      ),
    );
  }
}
