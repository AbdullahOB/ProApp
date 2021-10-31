import 'package:flutter/material.dart';
import 'package:pro_app/widgets/BottomNavigationBar/bottom_navigation_bar.dart';

class UserBar extends StatefulWidget {
  const UserBar({Key? key}) : super(key: key);

  @override
  _UserBarState createState() => _UserBarState();
}

class _UserBarState extends State<UserBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          bottom: 0,
          right: 0,
          child: CustomBottomNavigationBar(
            onIconPresedCallback: onBottomIconPressed,
          ),
        ),
      ],
    );
  }

  void onBottomIconPressed(int index) {
    print("dada");
  }
}
