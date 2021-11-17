import 'package:fluttertoast/fluttertoast.dart';
import 'package:pro_app/components/mainButton.dart';
import 'package:pro_app/constants.dart';
import 'package:pro_app/models/Admin/set_items.dart';
import 'package:pro_app/models/Admin/update_items.dart';
import 'package:pro_app/widgets/title_text.dart';
import 'package:pro_app/components/textField.dart';
import '../components/adminbar.dart';
import 'package:flutter/material.dart';
import 'package:pro_app/components/roundedTextField.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../components/textfield.dart';

class EditCoupon extends StatefulWidget {
  final name;
  final code;
  final percentage;
  final activationDate;
  final expirDate;
  final id;
  const EditCoupon(
      {Key? key,
      this.name,
      this.code,
      this.percentage,
      this.activationDate,
      this.expirDate,
      this.id})
      : super(key: key);

  @override
  _EditCouponState createState() => _EditCouponState(
      name: this.name,
      code: this.code,
      percentage: this.percentage,
      activationDate: this.activationDate,
      expirDate: this.expirDate,
      id: this.id);
}

class _EditCouponState extends State<EditCoupon> {
  var name;
  var code;
  var percentage;
  var activationDate;
  var expirDate;
  var id;
  _EditCouponState(
      {this.name,
      this.code,
      this.percentage,
      this.activationDate,
      this.expirDate,
      this.id});

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
    return Material(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: 10)),
              Expanded(
                  child: ListView(children: [
                TitleText(
                  text: "Edit coupon",
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.green,
                ),
                Container(
                  height: 10,
                ),
                textfield(false, "Coupon name", "string", setName,
                    value: this.name),
                textfield(false, "Coupon Code", "string", setCode,
                    value: this.code),
                textfield(false, "percentage", "number", setPercentage,
                    value: this.percentage.toString()),
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
                                    maxTime: DateTime(2100, 6, 7),
                                    onChanged: (date) {
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
                                  text: activationDate
                                      .toString()
                                      .substring(0, 10),
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
                                    maxTime: DateTime(2100, 6, 7),
                                    onChanged: (date) {
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
                      await update_coupons(
                          this.id,
                          name,
                          code,
                          percentage,
                          DateTime.parse(
                              activationDate.toString().substring(0, 10) +
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
          ),
        ),
      ),
    );
  }
}
