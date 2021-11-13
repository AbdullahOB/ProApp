import 'package:flutter/material.dart';
import 'package:pro_app/components/textField.dart';

import '../constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final FormFieldValidator validator;
  final ValueChanged<String> onChanged;
  final controllerName;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    required this.validator,
    required this.controllerName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextInput(
      child: TextFormField(
        controller: controllerName,
        validator: validator,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
