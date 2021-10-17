import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pro_app/components/mainButton.dart';
import 'package:pro_app/constants.dart';
import 'package:pro_app/screens/Login/LoginScreen.dart';
import 'package:pro_app/screens/Register/registerScreen.dart';
import 'package:pro_app/screens/welcome/components/background.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
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
                  child: Text("RegisterScreen"))
            ],
          )
        ],
      ),
    ),
  );
}
