import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pro_app/components/or_divider.dart';
import 'package:pro_app/components/socialIcons.dart';
import 'package:pro_app/components/already_hav_an_account.dart';
import 'package:pro_app/components/main_button.dart';
import 'package:pro_app/components/rounded_password_field.dart';
import 'package:pro_app/components/rounded_text_field.dart';
import 'package:pro_app/components/text_field.dart';
import 'package:pro_app/constants.dart';
import 'package:pro_app/screens/Login/login_creen.dart';
import 'package:pro_app/screens/Register/components/background.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Body extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Body> {
  final controllerPassword = TextEditingController();
  final controllerEmail = TextEditingController();
  bool isLoggedIn = false;
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
                    controllerName: controllerEmail,
                    onChanged: (value) {},
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
                    controllerName: controllerPassword,
                    onChaged: (value) {},
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
                          doUserRegistration();
                        }
                      }),
                  ButtonMain(text: "Logout", press: doUserLogout)
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            AlreadyHaveAnAccountText(
                login: false,
                press: () {
                  Navigator.pushReplacement(
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

  void showSuccess() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success!"),
          content: const Text("User was successfully created!"),
          actions: <Widget>[
            FlatButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showError(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error!"),
          content: Text(errorMessage),
          actions: <Widget>[
            FlatButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void doUserRegistration() async {
    final email = controllerEmail.text.trim();
    final password = controllerPassword.text.trim();
    final username = controllerEmail.text.trim();

    final user = ParseUser.createUser(username, password, email);

    var response = await user.signUp();

    if (response.success) {
      showSuccess();
      setState(() {
        isLoggedIn = true;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return LoginScreen();
            },
          ),
        );
      });
    } else {
      showError(response.error!.message);
    }
  }

  void doUserLogout() async {
    final user = await ParseUser.currentUser() as ParseUser;
    var response = await user.logout();

    if (response.success) {
      showSuccess();
      setState(() {
        isLoggedIn = false;
      });
    } else {
      showError(response.error!.message);
    }
  }
}
