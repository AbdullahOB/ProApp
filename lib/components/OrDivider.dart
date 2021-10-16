import 'package:flutter/material.dart';

import '../constants.dart';

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
        width: size.width * 0.2,
        child: Row(
          children: <Widget>[
            OrDividerWidget(),
            OrDividerText(
              text: "OR",
            )
          ],
        ));
  }
}

class OrDividerText extends StatelessWidget {
  final String text;
  const OrDividerText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        text,
        style: TextStyle(
          color: kPrimaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class OrDividerWidget extends StatelessWidget {
  const OrDividerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Divider(
      color: Color(0xFFD9D9D9),
      height: 1.5,
    ));
  }
}
