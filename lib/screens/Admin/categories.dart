import 'package:pro_app/models/Admin/get_items.dart';
import 'package:pro_app/widgets/title_text.dart';

import 'components/adminbar.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

Widget _item(name) {
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
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Center(
                child: Icon(
                  Icons.category_rounded,
                  color: Colors.blue,
                  size: 40,
                ),
              )
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
        ))
      ],
    ),
  );
}

class _CategoriesState extends State<Categories> {
  var categories = [];
  var loadproducts = true;
  @override
  void initState() {
    get_all_coupons();
    super.initState();
  }

  Future<void> get_all_coupons() async {
    categories = await get_items(tableName: "categories");
    setState(() {
      loadproducts = categories.length > 0 ? false : true;
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
          text: "Admin Panel / Categories",
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
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return _item(categories[index]["name"]);
                  },
                ),
        )
      ],
    );
  }
}
