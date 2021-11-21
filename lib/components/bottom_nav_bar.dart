import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pro_app/constants.dart';

class bottomNavBar extends StatelessWidget {
  const bottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
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
        // Fluttertoast.showToast(
        //     msg: index.toString(),
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.red,
        //     textColor: Colors.white,
        //     fontSize: 16.0);
      },
    );
  }
}
