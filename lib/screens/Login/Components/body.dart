import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:pro_app/components/or_divider.dart';
import 'package:pro_app/components/already_hav_an_account.dart';
import 'package:pro_app/components/main_button.dart';
import 'package:pro_app/components/rounded_password_field.dart';
import 'package:pro_app/components/rounded_text_field.dart';
import 'package:pro_app/components/text_field.dart';
import 'package:pro_app/constants.dart';
import 'package:pro_app/screens/HomePage/homepage.dart';
import 'package:pro_app/screens/Register/register_screen.dart';
import 'background.dart';

class Body extends StatefulWidget {
  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();
  bool isLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Login",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Image.asset(
              "assets/icons/loginIcon.png",
              height: size.height * 0.38,
            ),
            RoundedInputField(
              controllerName: controllerUsername,
              hintText: "Your Username",
              icon: Icons.person,
              onChanged: (value) {},
              validator: (value) =>
                  value.isEmpty ? 'Enter Your Username' : null,
            ),
            rounderPasswordField(
              controllerName: controllerPassword,
              onChaged: (value) {},
              validator: (value) {
                value.length < 6 ? 'Enter Your Password +6 characters' : null;
              },
            ),
            ButtonMain(
                text: "Login Now",
                press: () async {
                  doUserLogin();
                }),
            ButtonMain(
                text: "Logut Session TEST",
                press: () async {
                  doUserLogout();
                }),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Forgot your password ?",
                    style: TextStyle(
                        color: kPrimaryColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            AlreadyHaveAnAccountText(
                login: true,
                press: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RegisterScreen();
                      },
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  void showSuccess(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success!"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
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
            TextButton(
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

  void doUserLogin() async {
    final username = controllerUsername.text.trim();
    final password = controllerPassword.text.trim();

    final user = ParseUser(username, password, null);

    var response = await user.login();

    if (response.success) {
      setState(() {
        isLoggedIn = true;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Homepage();
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
      showSuccess("User was successfully logout!");
      setState(() {
        isLoggedIn = false;
      });
    } else {
      showError(response.error!.message);
    }
  }
}
