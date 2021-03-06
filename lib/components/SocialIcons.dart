import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class SocialIcon extends StatelessWidget {
  final String svgUrl;
  final VoidCallback press;
  const SocialIcon({
    Key? key,
    required this.svgUrl,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: kPrimaryColor,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          svgUrl,
          height: 20,
          width: 20,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
