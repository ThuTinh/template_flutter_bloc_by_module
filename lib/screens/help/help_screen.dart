import 'package:core/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HelpScreen();
  }
}

class _HelpScreen extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColorGray,
      body: Container(
        decoration: BoxDecoration(),
        child: Image(
          image: AssetImage('assets/images/logo_omena.png'),
          fit: BoxFit.fitWidth,
        ),
        // child: Text("kakak"),
      ),
    );
  }
}
