import 'package:pro_app/widgets/title_text.dart';

import '../../constants.dart';
import 'components/adminbar.dart';
import 'package:flutter/material.dart';

class Coins extends StatefulWidget {
  const Coins({Key? key}) : super(key: key);

  @override
  _CoinsState createState() => _CoinsState();
}

Widget _item(textCenter) {
  return Container(
    margin: EdgeInsets.only(
      bottom: 10,
    ),
    decoration: BoxDecoration(
      color: kPrimaryColor,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10.0,
          offset: Offset(0.0, 10.0),
        ),
      ],
    ),
    height: 100,
    width: double.infinity,
    child: Center(
      child: TitleText(
        text: textCenter,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    ),
  );
}

Widget _item_recent_logs() {
  return Container(
      margin: EdgeInsets.only(bottom: 10, right: 10, left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      height: 60,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.monetization_on_outlined,
            color: Colors.green,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TitleText(
                text: "Maneger",
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
              TitleText(
                text: "Abdullah",
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TitleText(
                text: "user",
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
              TitleText(
                text: "Osid",
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TitleText(
                text: "Amount",
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
              TitleText(
                text: "12 coin",
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ],
      ));
}

class _CoinsState extends State<Coins> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return SafeArea(
      child: Material(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              width: queryData.size.width,
              height: queryData.size.height,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(top: 10)),
                  TitleText(
                    text: "Admin Panel / Coins",
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
                    _item("Sponsers"),
                    _item("Users"),
                    Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
                    TitleText(
                      text: "Recent Transetions",
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                    Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
                    _item_recent_logs(),
                    _item_recent_logs(),
                    _item_recent_logs(),
                    _item_recent_logs(),
                    _item_recent_logs(),
                    _item_recent_logs(),
                    _item_recent_logs(),
                    _item_recent_logs(),
                    Container(
                      height: 100,
                    )
                  ]))
                ],
              ),
            ),
            Container(
              child: Adimnbar(),
            ),
          ],
        ),
      ),
    );
  }
}
