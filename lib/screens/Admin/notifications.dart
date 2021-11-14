import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:pro_app/models/Admin/get_items.dart';
import 'package:pro_app/widgets/title_text.dart';

import 'components/adminbar.dart';
import 'package:flutter/material.dart';

class ServiceNotifications extends StatefulWidget {
  const ServiceNotifications({Key? key}) : super(key: key);

  @override
  _ServiceNotificationsState createState() => _ServiceNotificationsState();
}

class _ServiceNotificationsState extends State<ServiceNotifications> {
  var orders = [];
  var loadorders = true;
  @override
  void initState() {
    get_all_orders();
    super.initState();
  }

  Future<void> get_all_orders() async {
    orders = await get_items_with_one_relations_many(
        tableName: "orders",
        includeObject: [
          "user_id",
          "manager_id",
          "products",
          "coupon",
        ]);

    setState(() {
      loadorders = orders.length == 0 ? true : false;
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
          text: "Admin Panel / Recent Orders",
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
          child: loadorders == false
              ? ListView.builder(
                  itemCount: orders[0].length,
                  itemBuilder: (context, index) {
                    return _requestorder(
                        queryData,
                        orders[0][index]
                            .get<ParseObject>('user_id')
                            .get<String>('username')
                            .toString(),
                        orders[0][index]
                            .get<ParseObject>('manager_id')
                            .get<String>('username')
                            .toString(),
                        orders[1][index]["q9CMoy9JfX"]);
                  },
                )
              : TitleText(
                  text: "no products",
                ),
        )
      ],
    );
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
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                Center(
                  child: Icon(
                    Icons.card_giftcard_rounded,
                    color: Colors.black,
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
                        text: "pubg coin",
                        fontSize: 14,
                      ),
                    ],
                  ),
                  trailing: Container(
                    width: 35,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.red.withAlpha(190),
                        borderRadius: BorderRadius.circular(10)),
                    child: TitleText(
                      text: 'x20',
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  )))
        ],
      ),
    );
  }

  Widget _requestorder(queryData, user, manager, products_list) {
    print("*************\n" +
        products_list.length.toString() +
        "*************\n");
    return Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        height: (80 * 4) + 150,
        width: queryData.size.width,
        color: Colors.white,
        child: Column(children: [
          Container(
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ignore: deprecated_member_use
                FlatButton(
                  splashColor: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TitleText(
                            text: user.toString(),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                          TitleText(
                            text: "Status : In process",
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TitleText(
                            text: "Order ID : 588czs965",
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                          TitleText(
                            text: "10/02/2020",
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TitleText(
                            text: "Sponser : " + manager.toString(),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                    ],
                  ),
                  onPressed: () => {
                    _showMyDialog(),
                  },
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: products_list.length,
                itemBuilder: (context, index) {
                  return FlatButton(
                    splashColor: Colors.transparent,
                    child: _item(),
                    onPressed: _showMyDialog,
                  );
                },
              ),
            ),
          ),
          Container(
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleText(
                  text: "Total",
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                TitleText(
                  text: "200TL",
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ]));
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
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
        );
      },
    );
  }
}
