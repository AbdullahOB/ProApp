import 'package:pro_app/constants.dart';
import 'package:pro_app/models/Admin/delete_items.dart';
import 'package:pro_app/models/Admin/get_items.dart';
import 'package:pro_app/screens/Admin/coupons/edit.dart';
import 'package:pro_app/widgets/title_text.dart';

import '../components/adminbar.dart';
import 'package:flutter/material.dart';

class Coupons extends StatefulWidget {
  const Coupons({Key? key}) : super(key: key);

  @override
  _CouponsState createState() => _CouponsState();
}

class _CouponsState extends State<Coupons> {
  var coupons = [];
  var loadproducts = true;
  @override
  void initState() {
    get_all_coupons();
    super.initState();
  }

  Future<void> get_all_coupons() async {
    coupons = await get_items(tableName: "coupons");
    setState(() {
      loadproducts = coupons.isNotEmpty ? false : true;
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
          child: loadproducts
              ? ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Center(
                      child: TitleText(text: "loading products"),
                    );
                  },
                )
              : ListView.builder(
                  itemCount: coupons.length,
                  itemBuilder: (context, index) {
                    return _item(
                        coupons[index]["name"],
                        coupons[index]["code"],
                        coupons[index]["percentage"],
                        coupons[index]["from"],
                        coupons[index]["to"],
                        coupons[index]["objectId"],
                        context);
                  },
                ),
        ),
      ],
    );
  }

  Widget _item(name, code, percentage, from, to, id, context) {
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
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: 100,
                        child: TitleText(
                          text: name,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditCoupon(
                                          id: id,
                                          name: name,
                                          code: code,
                                          percentage: percentage,
                                          activationDate: from,
                                          expirDate: to,
                                        )),
                              );
                            },
                            icon: Icon(
                              Icons.edit,
                              color: kPrimaryColor,
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              await delete_item(id, "coupons");
                              await get_all_coupons();
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
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
                      text: "%" + percentage.toString(),
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  )))
        ],
      ),
    );
  }
}
