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

class _ProfileState extends State<Profile> {
  var transitions = [];
  var loadproducts = true;
  var role = "u";
  var current_user_email = "";
  var current_user_id = "";
  var coin;
  @override
  void initState() {
    get_all_transitions();
    get_current_user();
    get_coin();
    super.initState();
  }

  Future<void> get_all_transitions() async {
    transitions = await get_transitions_for_current_user();
    setState(() {
      loadproducts = transitions.isNotEmpty ? false : true;
    });
  }

  get_current_user() async {
    var currentuser = await ParseUser.currentUser();

    setState(() {
      role = currentuser["role"];
      current_user_id = currentuser["objectId"];
      current_user_email = currentuser["email"];
    });
  }

  get_coin() async {
    coin = await get_coins_for_current_user();
    setState(() {
      coin;
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
                  transitions[index]
                              .get<ParseObject>('to_user_id')
                              .get<String>('objectId')
                              .toString() ==
                          current_user_id.toString()
                      ? "send"
                      : "receive",
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

  Widget _item_recent_logs(type, amount, from, to) {
    return Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(bottom: 10, right: 10, left: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: const <BoxShadow>[
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                boxShadow: const <BoxShadow>[
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
                      role == "a"
                          ? TitleText(
                              text: "unlimited",
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            )
                          : TitleText(
                              text: coin != null
                                  ? coin[0]["amount"].toString() + " coin"
                                  : "0 coin",
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
                    text: "ID",
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                  TitleText(
                    text: current_user_id.toString(),
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
                    text: current_user_email.toString(),
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
                    text: role == "a" ? "Admin" : "Manager",
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
}
