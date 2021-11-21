import 'package:flutter/material.dart';
import 'package:pro_app/components/bottom_nav_bar.dart';
import 'package:pro_app/screens/HomePage/components/body.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        title: "Home Page",
      ),
      // bottomNavigationBar: bottomNavBar(),
    );
  }
}
