import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:pro_app/models/Admin/get_items.dart';
import 'package:pro_app/widgets/title_text.dart';
import 'components/adminbar.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
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
            type == "send"
                ? Icons.arrow_forward_ios_outlined
                : Icons.arrow_back_ios_outlined,
            color: type == "send" ? Colors.red : Colors.green,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              type == "send"
                  ? TitleText(
                      text: "to",
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    )
                  : TitleText(
                      text: "from",
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

Widget profile() {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
                      text: "Available Amount",
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
            )),
        Padding(padding: EdgeInsets.only(top: 30)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.person,
              color: Colors.green,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TitleText(
                  text: "Name",
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
                TitleText(
                  text: "Abdullah",
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TitleText(
                  text: "Email",
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
                TitleText(
                  text: "example@mail.com",
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TitleText(
                  text: "Role",
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
                TitleText(
                  text: "Manager",
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ],
            ),
          ],
        )
      ],
    ),
  );
}

class _ProfileState extends State<Profile> {
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
          text: "Manager / Profile",
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
        Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
        profile(),
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
                      .get<ParseObject>('from_user_id')
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
