import 'package:pro_app/constants.dart';
import 'package:pro_app/models/Admin/delete_items.dart';
import 'package:pro_app/models/Admin/get_items.dart';
import 'package:pro_app/screens/Admin/products/edit.dart';
import 'package:pro_app/widgets/title_text.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
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

    if (mounted) {
      setState(() {
        loadproducts = products.isNotEmpty ? false : true;
      });
    }
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
                      return _item(
                          products[index]["objectId"],
                          products[index]["name"],
                          products[index]["old_price"],
                          products[index]["price"],
                          products[index]["discription"],
                          products[index]["category"]
                              .get<String>('objectId')
                              .toString(),
                          products[index]["language_code"],
                          products[index]["tag"],
                          products[index]["picture"],
                          context);
                    },
                  ))
      ],
    );
  }

  Widget _item(id, name, oldprice, price, discription, selectedCategories,
      selectedLanguages, selectedTags, picture, context) {
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
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: 50,
                        child: TitleText(
                          text: name,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: kPrimaryColor,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditService(
                                          id: id,
                                          name: name,
                                          oldprice: oldprice,
                                          price: price,
                                          discription: discription,
                                          selectedCategories:
                                              selectedCategories,
                                          selectedLanguages: selectedLanguages,
                                          selectedTags: selectedTags,
                                          imageFile: picture,
                                        )),
                              );
                            },
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () async {
                                await delete_item(id, "products");
                                await get_all_prducts();
                              }),
                        ],
                      )
                    ],
                  ),
                  trailing: Container(
                    width: 80,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.red.withAlpha(190),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: TitleText(
                        text: price.toString() + " " + "coin",
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  )))
        ],
      ),
    );
  }
}
