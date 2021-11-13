import 'package:flutter/material.dart';
import 'package:pro_app/constants.dart';
import 'package:pro_app/screens/Admin/categories.dart';
import 'package:pro_app/screens/Admin/category.dart';
import 'package:pro_app/screens/Admin/coins.dart';
import 'package:pro_app/screens/Admin/coupon.dart';
import 'package:pro_app/screens/Admin/coupons.dart';
import 'package:pro_app/screens/Admin/dashboard.dart';
import 'package:pro_app/screens/Admin/notifications.dart';
import 'package:pro_app/screens/Admin/service.dart';
import 'package:pro_app/screens/Register/registerScreen.dart';
import 'package:pro_app/widgets/BottomNavigationBar/bottom_navigation_bar.dart';

import '../admin_profile.dart';

class Adimnbar extends StatefulWidget {
  const Adimnbar({Key? key}) : super(key: key);

  @override
  _AdimnbarState createState() => _AdimnbarState();
}

class _AdimnbarState extends State<Adimnbar> {
  Widget currentWidget = Dashboard();
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("Osid Alsagir")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: kPrimaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Admin area'),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Logout to user area'),
                      IconButton(
                        icon: Icon(Icons.logout),
                        onPressed: () => {
                          Navigator.pop(context),
                          Navigator.pop(context),
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Orders'),
              onTap: () {
                onBottomIconPressed(0);
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                onBottomIconPressed(1);
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              title: const Text('Coins'),
              onTap: () {
                onBottomIconPressed(3);
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              title: const Text('Services'),
              onTap: () {
                onBottomIconPressed(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Add new service'),
              onTap: () {
                onBottomIconPressed(8);
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              title: const Text('Categories'),
              onTap: () {
                onBottomIconPressed(4);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Add new category'),
              onTap: () {
                onBottomIconPressed(5);
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              title: const Text('Coupons'),
              onTap: () {
                onBottomIconPressed(6);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Add new Coupons'),
              onTap: () {
                onBottomIconPressed(7);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Material(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                width: queryData.size.width,
                height: queryData.size.height,
                color: Colors.white,
                child: currentWidget,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onBottomIconPressed(int index) {
    switch (index) {
      case 0:
        setState(() {
          currentWidget = ServiceNotifications();
        });
        break;
      case 1:
        setState(() {
          currentWidget = Profile();
        });
        break;
      case 2:
        setState(() {
          currentWidget = Dashboard();
        });
        break;
      case 3:
        setState(() {
          currentWidget = Coins();
        });
        break;
      case 4:
        setState(() {
          currentWidget = Categories();
        });
        break;
      case 5:
        setState(() {
          currentWidget = Category();
        });
        break;
      case 6:
        setState(() {
          currentWidget = Coupons();
        });
        break;
      case 7:
        setState(() {
          currentWidget = Coupon();
        });
        break;
      case 8:
        setState(() {
          currentWidget = Service();
        });
        break;
    }
  }
}
