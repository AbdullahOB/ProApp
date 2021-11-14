import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:pro_app/models/Admin/get_items.dart';
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

Widget _item_recent_logs(type, amount, from, to) {
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
                text: from,
                fontSize: 11,
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
                text: to,
                fontSize: 11,
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
                text: amount.toString() + " coin",
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ],
      ));
}

class _CoinsState extends State<Coins> {
  var transitions = [];
  var loadproducts = true;
  @override
  void initState() {
    get_all_transitions();
    super.initState();
  }

  Future<void> get_all_transitions() async {
    transitions = await get_items_with_relations(
        tableName: "transitions",
        includeObject: ["form_user_id", "to_user_id"]);

    setState(() {
      loadproducts = transitions.length > 0 ? false : true;
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
        _item("Sponsers"),
        _item("Users"),
        Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
        TitleText(
          text: "Recent Transetions",
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
        Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
        Expanded(
          child: ListView.builder(
            itemCount: transitions.length,
            itemBuilder: (context, index) {
              return _item_recent_logs(
                  "send",
                  transitions[index]["amount"],
                  transitions[index]
                      .get<ParseObject>('form_user_id')
                      .get<String>('username')
                      .toString(),
                  transitions[index]
                      .get<ParseObject>('to_user_id')
                      .get<String>('username')
                      .toString());
            },
          ),
        )
      ],
    );
  }
}
