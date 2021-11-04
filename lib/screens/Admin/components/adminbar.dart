import 'package:flutter/material.dart';
import 'package:pro_app/screens/Admin/coins.dart';
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
    return SafeArea(
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
            Container(
                child: Stack(
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
            )),
          ],
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
          currentWidget = Service();
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
          currentWidget = Profile();
        });
        break;
    }
  }
}
/*
TextButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return RegisterScreen();
                        },
                      )),
                  child: Text("RegisterScreen")),
              TextButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Dashboard();
                        },
                      )),
                  child: Text("admin area dashboard")),
              TextButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Service();
                        },
                      )),
                  child: Text("admin area service edit")),
              TextButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return ServiceDetails();
                        },
                      )),
                  child: Text("admin area service details")),
              TextButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return ServiceNotifications();
                        },
                      )),
                  child: Text("admin area service notifications")),
              TextButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Coins();
                        },
                      )),
                  child: Text("admin area send coins")),
              TextButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Homepage();
                        },
                      )),
                  child: Text("HomePage")),
              TextButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Profile();
                        },
                      )),
                  child: Text("admin area user profile")),
              TextButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return UserProfile();
                        },
                      )),
                  child: Text("User Profile")),
              TextButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Favouritepage();
                        },
                      )),
                  child: Text("user favourite page")),



 */