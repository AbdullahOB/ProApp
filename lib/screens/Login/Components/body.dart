import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pro_app/components/OrDivider.dart';
import 'package:pro_app/components/alreadyHaveAnAccount.dart';
import 'package:pro_app/components/mainButton.dart';
import 'package:pro_app/components/roundedPasswordField.dart';
import 'package:pro_app/components/roundedTextField.dart';
import 'package:pro_app/components/textField.dart';
import 'package:pro_app/constants.dart';
import 'package:pro_app/screens/Register/registerScreen.dart';
import 'background.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);
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
              hintText: "Your Email",
              icon: Icons.person,
              onChanged: (value) {},
              validator: (value) => value.isEmpty ? 'Enter Your Email' : null,
            ),
            rounderPasswordField(
              onChaged: (value) {},
              validator: (value) {
                value.length < 6 ? 'Enter Your Password +6 characters' : null;
              },
            ),
            ButtonMain(
                text: "Login Now",
                press: () async {
                  Fluttertoast.showToast(
                      msg: "Test",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
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
                  Navigator.push(
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
}
