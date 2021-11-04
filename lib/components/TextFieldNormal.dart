import 'package:flutter/material.dart';
import 'package:pro_app/components/gradientIcon.dart';
import 'package:pro_app/components/textField.dart';
import 'package:pro_app/components/textFieldWithoutRounded.dart';

import '../constants.dart';

class NormalInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final FormFieldValidator validator;
  final ValueChanged<String> onChanged;

  const NormalInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextInputNotRounded(
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: RadiantGradientMask(
              child: Icon(
            icon,
            size: 25,
            color: Colors.white,
          )),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
