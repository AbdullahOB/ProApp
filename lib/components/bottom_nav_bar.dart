import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pro_app/constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CurvedNavigationBar(
          animationDuration: Duration(milliseconds: 300),
          color: kPrimaryColor,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: kPrimaryColor,
          height: 50,
          items: const <Widget>[
            Icon(
              Icons.person,
              size: 20,
              color: Colors.white,
            ),
            Icon(
              Icons.search,
              size: 20,
              color: Colors.white,
            ),
            Icon(
              Icons.home,
              size: 20,
              color: Colors.white,
            ),
            Icon(
              Icons.shopping_cart,
              size: 20,
              color: Colors.white,
            ),
            Icon(
              Icons.settings,
              size: 20,
              color: Colors.white,
            ),
          ],
          onTap: (index) {
            print(index);
          },
        ),
      ],
    );
  }
}
