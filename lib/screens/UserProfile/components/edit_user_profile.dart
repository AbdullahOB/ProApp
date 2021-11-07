import 'package:flutter/material.dart';
import 'package:pro_app/components/CustomButton.dart';
import 'package:pro_app/components/TextFieldNormal.dart';
import 'package:pro_app/components/mainButton.dart';
import 'package:pro_app/components/roundedTextField.dart';
import 'package:pro_app/components/textField.dart';
import 'package:pro_app/components/textFieldWithoutRounded.dart';

import '../../../constants.dart';

class editUserProfile extends StatefulWidget {
  const editUserProfile({Key? key}) : super(key: key);

  @override
  _editUserProfileState createState() => _editUserProfileState();
}

class _editUserProfileState extends State<editUserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UEditProfileBody(context),
      appBar: AppBarUserProfile(context),
    );
  }
}

Widget UEditProfileBody(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return SafeArea(
    child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: <Widget>[
            emailNameCol(context),
            SizedBox(
              height: 10,
            ),
            profileInfoEdit(context),
          ],
        )),
  );
}

Widget emailNameCol(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Container(
      width: size.width,
      height: 80,
      decoration: BoxDecoration(color: Colors.grey.shade100),
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Abdullah Obaid",
            style: TextStyle(
                color: Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "abdullahobeid@gmail.com",
            style: TextStyle(
                color: Colors.black54,
                fontSize: 13,
                fontStyle: FontStyle.normal),
          ),
        ],
      ));
}

Widget profileInfoEdit(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Colors.grey.shade100,
      alignment: Alignment.center,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          NormalInputField(
            hintText: "Your Name",
            icon: Icons.person,
            onChanged: (value) {},
            validator: (value) => value.isEmpty ? 'Edit Your Name' : null,
          ),
          NormalInputField(
            hintText: "Your Email",
            icon: Icons.email,
            onChanged: (value) {},
            validator: (value) => value.isEmpty ? 'Edit Your Email' : null,
          ),
          NormalInputField(
            hintText: "Your Phone Number",
            icon: Icons.phone,
            onChanged: (value) {},
            validator: (value) =>
                value.isEmpty ? 'Edit Your Phone Number' : null,
          ),
          CustomButton(
            text: "Update",
            press: () {},
          ),
        ],
      ));
}

AppBar AppBarUserProfile(BuildContext context) {
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
      onPressed: () => Navigator.of(context).pop(),
    ),
    title: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("My Profile",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        SizedBox(height: 5),
        Text("You Can Edit Your Profile From Here",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400))
      ],
    ),
    backgroundColor: kPrimaryColor,
  );
}
