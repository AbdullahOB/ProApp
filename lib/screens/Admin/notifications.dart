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
    orders = await get_items_with_many_relations_many(
        tableName: "orders",
        includeObject: [
          "user_id",
          "manager_id",
          "products",
          "coupon",
        ]);

    setState(() {
      loadorders = orders.isEmpty ? true : false;
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
                        orders[0][index]["objectId"],
                        orders[0][index]
                            .get<ParseObject>('user_id')
                            .get<String>('username')
                            .toString(),
                        orders[0][index]
                            .get<ParseObject>('manager_id')
                            .get<String>('username')
                            .toString(),
                        orders[0][index]["createdAt"],
                        orders[0][index]["status"],
                        orders[0][index]
                            .get<ParseObject>('coupon')
                            .get<String>('code')
                            .toString(),
                        orders[0][index]["total_amount_with_coupons"],
                        orders[0][index]["total_amount"],
                        orders[1][index]
                            [orders[0][index]["objectId"].toString()]);
                  },
                )
              : TitleText(
                  text: "no products",
                ),
        )
      ],
    );
  }

  Widget _item(list) {
    return SizedBox(
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
                  child: SizedBox(
                    height: 70,
                    width: 70,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image:
                                NetworkImage(list["picture"]["url"].toString()),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ListTile(
                  title: TitleText(
                    text: list["category"].get<String>('name').toString(),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                  subtitle: Row(
                    children: <Widget>[
                      TitleText(
                        text: list["name"],
                        fontSize: 14,
                      ),
                    ],
                  ),
                  trailing: Container(
                    width: 80,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.red.withAlpha(190),
                        borderRadius: BorderRadius.circular(10)),
                    child: TitleText(
                      text: list["price"].toString() + " coin",
                      fontSize: 11,
                      color: Colors.white,
                    ),
                  )))
        ],
      ),
    );
  }

  Widget _requestorder(queryData, id, user, manager, date, status, coupon,
      totalAmountWithCoupons, totalAmount, productsList) {
    return Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        height: (80 * 4) + 150,
        width: queryData.size.width,
        color: Colors.white,
        child: Column(children: [
          SizedBox(
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
                          Container(
                            decoration: BoxDecoration(
                                color: status.toString() == "in process"
                                    ? Colors.orange
                                    : status.toString() == "refused"
                                        ? Colors.red
                                        : Colors.green,
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.all(4),
                            margin: EdgeInsets.only(bottom: 3),
                            child: TitleText(
                              text: "Status : " + status.toString(),
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TitleText(
                            text: "Order ID : " + id.toString(),
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                          TitleText(
                            text: date.toString().split(" ")[0] +
                                " " +
                                date.toString().split(" ")[1].substring(0, 8),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TitleText(
                            text: coupon.toString() == ""
                                ? "coupon : " "no"
                                : "coupon : " + coupon.toString(),
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
          for (var list in productsList) _item(list),
          SizedBox(
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleText(
                  text: "Total",
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
                TitleText(
                  text: totalAmount.toString() + " coin",
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleText(
                  text: "Total paied",
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
                TitleText(
                  text: totalAmountWithCoupons.toString() + " coin",
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
