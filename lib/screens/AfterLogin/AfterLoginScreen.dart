import 'package:flutter/material.dart';
import 'package:pro_app/screens/AfterLogin/Components/Body.dart';

class AfterLoginPage extends StatefulWidget {
  const AfterLoginPage({Key? key}) : super(key: key);

  @override
  _AfterLoginPageState createState() => _AfterLoginPageState();
}

class _AfterLoginPageState extends State<AfterLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
