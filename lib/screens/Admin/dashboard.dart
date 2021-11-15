import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:pro_app/models/Admin/get_items.dart';
import 'package:pro_app/widgets/title_text.dart';

import 'components/adminbar.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

Widget _item(name, price, picture) {
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
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(picture["url"].toString()),
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
                  text: name,
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
                trailing: Container(
                  width: 80,
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.red.withAlpha(190),
                      borderRadius: BorderRadius.circular(10)),
                  child: TitleText(
                    text: price.toString() + " " + "coin",
                    fontSize: 12,
                    color: Colors.white,
                  ),
                )))
      ],
    ),
  );
}

class _DashboardState extends State<Dashboard> {
  var products = [];
  var loadproducts = true;
  @override
  void initState() {
    get_all_prducts();
    super.initState();
  }

  Future<void> get_all_prducts() async {
    products = await get_items(tableName: "products");
    setState(() {
      loadproducts = products.length > 0 ? false : true;
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
          text: "Admin Panel / Dashboard",
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
                    // Let the ListView know how many items it needs to build.
                    itemCount: 1,
                    // Provide a builder function. This is where the magic happens.
                    // Convert each item into a widget based on the type of item it is.
                    itemBuilder: (context, index) {
                      return Center(
                        child: TitleText(text: "loading products"),
                      );
                    },
                  )
                : ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return _item(products[index]["name"],
                          products[index]["price"], products[index]["picture"]);
                    },
                  ))
      ],
    );
  }
}
