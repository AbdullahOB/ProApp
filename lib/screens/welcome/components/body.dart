import 'dart:math';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:pro_app/screens/Admin/admin_profile.dart';
import 'package:pro_app/screens/Admin/categories/category.dart';
import 'package:pro_app/screens/Admin/coins/coins.dart';
import 'package:pro_app/screens/Admin/components/adminbar.dart';
import 'package:pro_app/screens/Admin/notifications.dart';
import 'package:pro_app/screens/Admin/products/service.dart';
import 'package:pro_app/screens/HomePage/components/userbar.dart';
import 'package:pro_app/screens/HomePage/homepage.dart';
import 'package:pro_app/screens/Login/login_creen.dart';
import 'package:pro_app/screens/Register/register_screen.dart';
import 'package:pro_app/screens/Admin/dashboard.dart';
import 'package:pro_app/screens/UserProfile/user_profile.dart';
import 'package:pro_app/screens/favourite/Favourite.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var role = "u";

  @override
  void initState() {
    get_role();
    super.initState();
  }

  get_role() async {
    try {
      role = (await ParseUser.currentUser())["role"];
    } on Exception catch (_) {}

    setState(() {
      role;
    });
  }

  Widget btnwgt(context) {
    return SafeArea(
      child: Container(
        child: Row(
          children: [
            Column(
              children: [
                TextButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return RegisterScreen();
                          },
                        )),
                    child: Text("RegisterScreen")),
                role == "a"
                    ? TextButton(
                        onPressed: () =>
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Adimnbar();
                              },
                            )),
                        // ignore: prefer_const_constructors
                        child: Text("admin area dashboard"))
                    : SizedBox(),
                TextButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return UserBar();
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
                TextButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        )),
                    child: Text("Login Page")),
                TextButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return Category();
                          },
                        )),
                    child: Text("category page")),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return btnwgt(context);
    // BackgroundWidget(
    //   child: SingleChildScrollView(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         SizedBox(height: size.height * 0.12),
    //         Text(
    //           "Welcome To Pro App",
    //           style: TextStyle(
    //               fontWeight: FontWeight.bold,
    //               fontSize: 20,
    //               color: Colors.black),
    //         ),
    //         SizedBox(height: size.height * 0.08),
    //         Image.asset(
    //           "assets/icons/welcomeIcon.png",
    //           height: size.height * 0.49,
    //         ),
    //         SizedBox(height: size.height * 0.05),
    //         ButtonMain(
    //             text: "Login",
    //             press: () {
    //               Fluttertoast.showToast(
    //                   msg: "Test",
    //                   toastLength: Toast.LENGTH_SHORT,
    //                   gravity: ToastGravity.CENTER,
    //                   timeInSecForIosWeb: 1,
    //                   backgroundColor: Colors.red,
    //                   textColor: Colors.white,
    //                   fontSize: 16.0);

    //               Navigator.push(
    //                 context,
    //                 MaterialPageRoute(
    //                   builder: (context) {
    //                     return LoginScreen();
    //                   },
    //                 ),
    //               );
    //             }),
    //         ButtonMain(
    //           text: "Register",
    //           color: kPrimaryLightColor,
    //           textColor: Colors.black,
    //           press: () {
    //             Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                 builder: (context) {
    //                   return RegisterScreen();
    //                 },
    //               ),
    //             );
    //           },
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}

// add your buttons here .. .. .

