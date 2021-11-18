import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:pro_app/models/Admin/get_items.dart';
import 'package:pro_app/models/Admin/get_users.dart';
import 'package:pro_app/models/Admin/set_items.dart';
import 'package:pro_app/widgets/title_text.dart';

import '../../../constants.dart';
import '../components/adminbar.dart';
import 'package:flutter/material.dart';

import '../components/textfield.dart';

class Coins extends StatefulWidget {
  const Coins({Key? key}) : super(key: key);

  @override
  _CoinsState createState() => _CoinsState();
}

class _CoinsState extends State<Coins> {
  var transitions = [];
  var loadproducts = true;
  var role = "u";
  var current_user_email = "";
  var current_user_id = "";

  @override
  void initState() {
    get_all_transitions();
    get_role();
    super.initState();
  }

  get_role() async {
    var currentuser = await ParseUser.currentUser();

    setState(() {
      role = currentuser["role"];
      current_user_id = currentuser["objectId"];
      current_user_email = currentuser["email"];
    });
  }

  Future<void> get_all_transitions() async {
    transitions = await get_items_with_relations(
        tableName: "transitions",
        includeObject: ["from_user_id", "to_user_id"]);

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
        _item("Send coins"),
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

  Widget _item(textCenter) {
    return TextButton(
      onPressed: () => showDialog(
          context: context,
          builder: (_) {
            return UserDialog();
          }),
      child: Container(
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
      ),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.monetization_on_outlined,
              color: Colors.green,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TitleText(
                  text: "Manager",
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
                TitleText(
                  text: from.toString().split("@")[0],
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
                  text: to.toString().split("@")[0],
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
}

class UserDialog extends StatefulWidget {
  @override
  _UserDialogState createState() => new _UserDialogState();
}

class _UserDialogState extends State<UserDialog> {
  var users = [];
  var new_user_list = [];
  var user_id = "";
  var user_name = "";
  var coins;

  @override
  void initState() {
    get_users_list();
    super.initState();
  }

  get_users_list() async {
    users = await get_users();
    setState(() {
      new_user_list = users;
    });
  }

  setCoin(value) {
    setState(() {
      coins = value;
    });
    print(coins);
  }

  @override
  Widget build(BuildContext context) {
    var typeing = "";

    get_user_suggestions(value) {
      setState(() {
        typeing = value;
        if (typeing.length >= 0) {
          new_user_list = users
              .where((i) => (i["username"]
                      .toString()
                      .toLowerCase()
                      .contains(typeing.toLowerCase()) ||
                  i["objectId"]
                      .toString()
                      .toLowerCase()
                      .contains(typeing.toLowerCase())))
              .toList();
        } else {
          new_user_list = [];
        }
      });
    }

    return user_id == ""
        ? AlertDialog(
            title: Text('AlertDialog Title'),
            content: Container(
              height: 250,
              child: Column(
                children: [
                  textfield(
                      false, "Email / ID", "string", get_user_suggestions),
                  Container(
                      width: 250,
                      height: 150,
                      child: ListView.builder(
                        itemCount: new_user_list.length,
                        itemBuilder: (context, index) {
                          return TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                            ),
                            onPressed: () {
                              setState(() {
                                user_id =
                                    new_user_list[index]["objectId"].toString();
                                user_name =
                                    new_user_list[index]["username"].toString();
                              });
                            },
                            child: Text(
                              new_user_list[index]["username"],
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                              textAlign: TextAlign.start,
                            ),
                          );
                        },
                      )),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Approve'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          )
        : AlertDialog(
            title: Text('AlertDialog Title'),
            content: Container(
              height: 250,
              child: Column(
                children: [
                  textfield(false, "Amount", "number", setCoin),
                  Text(user_name)
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Sent'),
                onPressed: () async {
                  await set_coin(user_id, coins);
                },
              ),
            ],
          );
  }
}
