import 'package:fluttertoast/fluttertoast.dart';
import 'package:pro_app/components/mainButton.dart';
import 'package:pro_app/widgets/title_text.dart';
import 'package:pro_app/components/textField.dart';
import 'components/adminbar.dart';
import 'package:flutter/material.dart';
import 'package:pro_app/components/roundedTextField.dart';

class Service extends StatefulWidget {
  const Service({Key? key}) : super(key: key);

  @override
  _ServiceState createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(top: 10)),
        TitleText(
          text: "Admin Panel / Add New Service",
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        TitleText(
          text: "Osid Alsagir",
          fontSize: 27,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
        Padding(padding: EdgeInsets.only(bottom: 10)),
        Expanded(
            child: ListView(children: [
          TitleText(
            text: "Add New Service",
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.green,
          ),
          Container(
            height: 10,
          ),
          _item(true, "Service name", "text"),
          _item(false, "Service old price", "number"),
          _item(false, "Service price", "number"),
          _item(false, "Service Discription", "longtext"),
          ButtonMain(
              text: "ok",
              press: () async {
                print("dasd");
              }),
          Container(
            height: 100,
          )
        ]))
      ],
    );
  }

  Widget _item(with_image, hintstring, fieldtype) {
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
                keyboardType: fieldtype == "number"
                    ? TextInputType.number
                    : TextInputType.text,
                onChanged: (value) {
                  return print(value);
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
}
