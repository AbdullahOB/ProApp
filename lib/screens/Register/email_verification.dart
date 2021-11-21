import 'package:flutter/material.dart';

import '../../constants.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  _EmailVerificationState createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EmailVerificationBody(context),
      appBar: AppBarEmailVerification(context),
    );
  }
}

AppBar AppBarEmailVerification(BuildContext context) {
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
      onPressed: () => Navigator.of(context).pop(),
    ),
    title: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Text("Email Verification",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
      ],
    ),
    backgroundColor: kPrimaryColor,
  );
}

Widget EmailVerificationBody(BuildContext context) {
  return Container();
}
