import 'package:pro_app/widgets/title_text.dart';

import 'components/adminbar.dart';
import 'package:flutter/material.dart';

class Coupons extends StatefulWidget {
  const Coupons({Key? key}) : super(key: key);

  @override
  _CouponsState createState() => _CouponsState();
}

Widget _item() {
  return Container(
    height: 80,
    child: Row(
      children: <Widget>[
        AspectRatio(
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
                  Icons.confirmation_number_outlined,
                  color: Colors.blue,
                  size: 40,
                ),
              )
            ],
          ),
        ),
        Expanded(
            child: ListTile(
          title: TitleText(
            text: "Gifts",
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
          subtitle: Row(
            children: <Widget>[
              TitleText(
                text: "Manage and edit",
                fontSize: 14,
              ),
            ],
          ),
        ))
      ],
    ),
  );
}

class _CouponsState extends State<Coupons> {
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
          text: "Admin Panel / Coupons",
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
          _item(),
          _item(),
          _item(),
          _item(),
          _item(),
          _item(),
          _item(),
          _item(),
          _item(),
          Container(
            height: 100,
          )
        ]))
      ],
    );
  }
}
