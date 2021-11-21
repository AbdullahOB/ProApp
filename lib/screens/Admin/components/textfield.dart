import 'package:flutter/material.dart';
import 'package:pro_app/components/text_field.dart';

Widget textfield(bool withImage, hintstring, fieldtype, function,
    {value = ""}) {
  return SizedBox(
    height: 80,
    child: Row(
      children: <Widget>[
        withImage
            ? AspectRatio(
                aspectRatio: 1.2,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
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
