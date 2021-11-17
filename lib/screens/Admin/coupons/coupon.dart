import 'package:fluttertoast/fluttertoast.dart';
import 'package:pro_app/components/mainButton.dart';
import 'package:pro_app/constants.dart';
import 'package:pro_app/models/Admin/set_items.dart';
import 'package:pro_app/widgets/title_text.dart';
import 'package:pro_app/components/textField.dart';
import '../components/adminbar.dart';
import 'package:flutter/material.dart';
import 'package:pro_app/components/roundedTextField.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../components/textfield.dart';

class Coupon extends StatefulWidget {
  const Coupon({Key? key}) : super(key: key);

  @override
  _CouponState createState() => _CouponState();
}

class _CouponState extends State<Coupon> {
  var name;
  var code;
  var percentage;
  var activationDate;
  var expirDate;
  setName(value) {
    setState(() {
      name = value;
    });
  }

  setCode(value) {
    setState(() {
      code = value;
    });
  }

  setPercentage(value) {
    setState(() {
      percentage = value;
    });
  }

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
          text: "Admin Panel / Add New Coupon",
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
            text: "Add New Coupon",
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.green,
          ),
          Container(
            height: 10,
          ),
          textfield(false, "Coupon name", "string", setName),
          textfield(false, "Coupon Code", "string", setCode),
          textfield(false, "percentage", "number", setPercentage),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    TextButton(
                        onPressed: () {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime.now(),
                              maxTime: DateTime(2100, 6, 7), onChanged: (date) {
                            print('change $date');
                          }, onConfirm: (date) {
                            print('confirm $date');
                            setState(() {
                              activationDate = date;
                            });
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.en);
                        },
                        child: Text(
                          'Activation date',
                          style: TextStyle(color: kPrimaryColor),
                        )),
                    activationDate != null
                        ? TitleText(
                            fontSize: 11,
                            text: activationDate.toString().substring(0, 10),
                          )
                        : SizedBox(),
                  ],
                ),
                Column(
                  children: [
                    TextButton(
                        onPressed: () {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime.now(),
                              maxTime: DateTime(2100, 6, 7), onChanged: (date) {
                            print('change $date');
                          }, onConfirm: (date) {
                            print('confirm $date');
                            setState(() {
                              expirDate = date;
                            });
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.en);
                        },
                        child: Text(
                          'Expiration date',
                          style: TextStyle(color: kPrimaryColor),
                        )),
                    expirDate != null
                        ? TitleText(
                            fontSize: 11,
                            text: expirDate.toString().substring(0, 10),
                          )
                        : SizedBox(),
                  ],
                ),
              ],
            ),
          ),
          ButtonMain(
              text: "ok",
              press: () async {
                await set_coupon(
                    name,
                    code,
                    percentage,
                    DateTime.parse(activationDate.toString().substring(0, 10) +
                        " " +
                        "00:00:00"),
                    DateTime.parse(expirDate.toString().substring(0, 10) +
                        " " +
                        "00:00:00"));
              }),
          Container(
            height: 100,
          )
        ]))
      ],
    );
  }
}
