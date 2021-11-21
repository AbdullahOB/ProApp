import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pro_app/constants.dart';
import 'package:pro_app/screens/Favourite/favourite.dart';
import 'package:pro_app/screens/HomePage/homepage.dart';
import 'package:pro_app/screens/UserProfile/user_profile.dart';

class UserBar extends StatefulWidget {
  const UserBar({Key? key}) : super(key: key);

  @override
  _UserBarState createState() => _UserBarState();
}

class _UserBarState extends State<UserBar> {
  Widget currentwidget = Homepage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            currentwidget,
            CurvedNavigationBar(
              animationDuration: Duration(milliseconds: 300),
              color: kPrimaryColor,
              backgroundColor: Colors.transparent,
              buttonBackgroundColor: kPrimaryColor,
              height: 50,
              index: 2,
              items: const <Widget>[
                Icon(
                  Icons.person,
                  size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.favorite_sharp,
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
                switch (index) {
                  case 0:
                    setState(() {
                      currentwidget = UserProfile();
                    });

                    break;
                  case 1:
                    setState(() {
                      currentwidget = Favouritepage();
                    });

                    break;
                  case 2:
                    setState(() {
                      currentwidget = Homepage();
                    });

                    break;
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void onBottomIconPressed(int index) {
    print(index);
  }
}
