import 'package:flutter/material.dart';
import 'package:pro_app/components/text_field.dart';

import '../constants.dart';

class rounderPasswordField extends StatelessWidget {
  final FormFieldValidator validator;
  final ValueChanged<String> onChaged;
  final controllerName;

  const rounderPasswordField({
    Key? key,
    required this.onChaged,
    required this.validator,
    required this.controllerName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextInput(
        child: TextFormField(
      obscureText: true,
      onChanged: onChaged,
      validator: validator,
      controller: controllerName,
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
