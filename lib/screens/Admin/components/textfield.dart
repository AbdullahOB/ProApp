import 'package:flutter/material.dart';
import 'package:pro_app/components/textField.dart';

Widget textfield(bool with_image, hintstring, fieldtype, function,
    {value = ""}) {
  return Container(
    height: 80,
    child: Row(
      children: <Widget>[
        with_image
            ? AspectRatio(
                aspectRatio: 1.2,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 70,
                        width: 70,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    Center(
                      child: Icon(
                        Icons.photo,
                        color: Colors.blue,
                        size: 40,
                      ),
                    )
                  ],
                ),
              )
            : SizedBox(),
        Expanded(
          child: TextInput(
            child: TextFormField(
              initialValue: value,
              keyboardType: fieldtype == "number"
                  ? TextInputType.number
                  : TextInputType.text,
              onChanged: (value) {
                function(value);
              },
              decoration: InputDecoration(
                hintText: hintstring,
                border: InputBorder.none,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
