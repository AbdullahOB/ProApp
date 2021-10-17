import 'package:flutter/material.dart';
import 'package:pro_app/components/textField.dart';

import '../constants.dart';

class rounderPasswordField extends StatelessWidget {
  final FormFieldValidator validator;
  final ValueChanged<String> onChaged;

  const rounderPasswordField({
    Key? key,
    required this.onChaged,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextInput(
        child: TextFormField(
      obscureText: true,
      onChanged: onChaged,
      validator: validator,
      decoration: InputDecoration(
        hintText: "Password",
        icon: Icon(
          Icons.paste_sharp,
          color: kPrimaryColor,
        ),
        suffixIcon: Icon(
          Icons.visibility,
          color: kPrimaryColor,
        ),
        border: InputBorder.none,
      ),
    ));
  }
}
