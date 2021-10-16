import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pro_app/components/OrDivider.dart';
import 'package:pro_app/components/SocialIcons.dart';
import 'package:pro_app/components/alreadyHaveAnAccount.dart';
import 'package:pro_app/components/mainButton.dart';
import 'package:pro_app/components/roundedPasswordField.dart';
import 'package:pro_app/components/roundedTextField.dart';
import 'package:pro_app/components/textField.dart';
import 'package:pro_app/constants.dart';
import 'package:pro_app/screens/Login/LoginScreen.dart';
import 'package:pro_app/screens/Register/components/background.dart';
import 'package:pro_app/services/auth.dart';

final AuthService _auth = AuthService();

String email = '';
String password = '';
String error = '';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.05,
            ),
            Text(
              "Register",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Image.asset(
              "assets/icons/registerIcon.png",
              height: size.height * 0.35,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  RoundedInputField(
                    hintText: "Your Email",
                    icon: Icons.person,
                    onChanged: (value) {
                      email = value;
                    },
                    validator: (value) {
                      value.isEmpty
                          ? Fluttertoast.showToast(
                              msg: "Please Fill Email Feild",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0)
                          : null;
                    },
                  ),
                  rounderPasswordField(
                    onChaged: (value) {
                      password = value;
                    },
                    validator: (value) {
                      value.length < 6
                          ? Fluttertoast.showToast(
                              msg: "Please Fill Password Feild (+6 Character)",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0)
                          : null;
                    },
                  ),
                  ButtonMain(
                      text: "Register Now",
                      press: () async {
                        if (_formKey.currentState!.validate()) {
                          dynamic result = await _auth
                              .registerWithEmailPassword(email, password);
                          if (result == null) {
                            Fluttertoast.showToast(
                                msg: "Please Supply a Valid Email",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                        }
                      }),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            AlreadyHaveAnAccountText(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                }),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcon(
                  svgUrl: 'assets/icons/facebook.svg',
                  press: () {},
                ),
                SocialIcon(
                  svgUrl: 'assets/icons/google-plus.svg',
                  press: () {},
                ),
                SocialIcon(
                  svgUrl: 'assets/icons/twitter.svg',
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
