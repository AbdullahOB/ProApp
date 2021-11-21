import 'package:flutter/material.dart';
import 'package:pro_app/screens/HomePage/components/userbar.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return UserBar();
  }
}
