import 'package:flutter/material.dart';
import 'package:pro_app/components/bottomNavBar.dart';
import 'package:pro_app/screens/GamesAndGifts/Components/Body.dart';

class GamesGiftsScreen extends StatefulWidget {
  const GamesGiftsScreen({Key? key}) : super(key: key);

  @override
  _GamesGiftsScreenState createState() => _GamesGiftsScreenState();
}

class _GamesGiftsScreenState extends State<GamesGiftsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(fit: StackFit.expand, children: <Widget>[
        SingleChildScrollView(
          child: Body(),
        ),
      ])),
      bottomNavigationBar: bottomNavBar(),
    );
  }
}
