import 'dart:math';

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:pro_app/components/bottomNavBar.dart';
import 'package:pro_app/models/User/delete_items.dart';
import 'package:pro_app/models/User/get_items.dart';
import 'package:pro_app/models/User/set_items.dart';
import 'package:pro_app/screens/Favourite/favourite.dart';
import 'package:pro_app/widgets/title_text.dart';
import '../../constants.dart';
import 'components/adminbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

var images = [
  "https://cdn.upstation.asia/wp-content/uploads/sites/4/2019/10/30172834/pub-350x150.jpg",
  "https://cdn.upstation.asia/wp-content/uploads/sites/6/2020/01/09235510/36847-350x150.jpeg",
  "https://cdn.upstation.asia/wp-content/uploads/sites/6/2020/09/15130834/Upgrade-PUBG-Mobile-Royale-Pass-S15-Beyond-A.C.E-on-UniPin-350x150.jpg"
];

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var favourite = [];
  var products = [];
  var categories = [];
  var role = "u";
  var current_user_email = "";
  var current_user_id = "";
  var children = <Widget>[];
  @override
  void initState() {
    get_products_categories();
    get_current_user();

    super.initState();
  }

  get_current_user() async {
    var currentuser = await ParseUser.currentUser();
    get_favourite();
    setState(() {
      role = currentuser["role"];
      current_user_id = currentuser["objectId"];
      current_user_email = currentuser["email"];
    });
  }

  get_products_categories() async {
    children.clear();
    products = await get_items_with_relations(
        tableName: "products", includeObject: ["category"]);
    for (var product in products) {
      if (categories == []
          ? true
          : categories.indexWhere((element) =>
                  element["objectId"] == product["category"]["objectId"]) ==
              -1) {
        categories.add(product["category"]);
        children.add(sliderTitle(product["category"]["name"]));

        children.add(SliderProducts(
          products: products.where((element) =>
              element["category"]["objectId"] ==
              product["category"]["objectId"]),
          favourite: favourite,
          current_user_id: current_user_id,
          get_favourite_function: get_favourite(),
        ));
      }
    }
    setState(() {
      children;
    });
  }

  get_favourite() async {
    favourite = await get_favourite_with_relations();
    setState(() {
      favourite;
      children;
    });
    return favourite;
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return SafeArea(
      child: Material(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              padding: EdgeInsets.all(0),
              width: queryData.size.width,
              height: queryData.size.height,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(top: 10)),
                  TitleText(
                    text: "ProApp",
                    fontSize: 27,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  categoriesSlider(),
                  Expanded(
                      child: ListView(children: [
                    AspectRatio(
                      aspectRatio: 350 / 150,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.green,
                        child: Swiper(
                          autoplay: true,
                          itemBuilder: (BuildContext context, int index) {
                            return new Image.network(
                              images[index],
                              fit: BoxFit.fill,
                            );
                          },
                          itemCount: 3,
                          pagination: new SwiperPagination(
                              margin: new EdgeInsets.all(0.0),
                              builder: new SwiperCustomPagination(builder:
                                  (BuildContext context,
                                      SwiperPluginConfig config) {
                                return new ConstrainedBox(
                                  child: new Row(
                                    children: <Widget>[
                                      new Expanded(
                                        child: new Align(
                                          alignment: Alignment.center,
                                          child: new DotSwiperPaginationBuilder(
                                                  color: Colors.transparent,
                                                  activeColor:
                                                      Colors.transparent,
                                                  size: 10.0,
                                                  activeSize: 15.0)
                                              .build(context, config),
                                        ),
                                      )
                                    ],
                                  ),
                                  constraints:
                                      new BoxConstraints.expand(height: 50.0),
                                );
                              })),
                          control: new SwiperControl(color: Colors.transparent),
                        ),
                      ),
                    ),
                    for (var i = 0; i < children.length; i++) children[i],
                    Container(
                      height: 100,
                    )
                  ]))
                ],
              ),
            ),
            Container(
              child: bottomNavBar(),
            ),
          ],
        ),
      ),
    );
  }

  Widget categoriesSlider() {
    return Container(
      color: Colors.white,
      height: 80,
      margin: EdgeInsets.only(bottom: 0, top: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    border: Border.all(width: 2.0, color: kPrimaryLightColor),
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 0.0,
                        blurRadius: 5.0,
                        offset: Offset(0.0, 3.0),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(left: 5, right: 10),
                  child: Center(
                    child: Row(
                      children: [
                        Icon(
                          Icons.clear_all_outlined,
                          color: kPrimaryColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        TitleText(
                          text: categories[index]["name"],
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: kPrimaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }

  Widget sliderTitle(category) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 20)),
        Container(
          margin: EdgeInsets.fromLTRB(3, 0, 3, 0),
          width: double.infinity,
          child: Row(
            children: [
              TitleText(
                text: category,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: 18,
              )
            ],
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
      ],
    );
  }
}

class SliderProducts extends StatefulWidget {
  final products;
  final favourite;
  final get_favourite_function;
  final current_user_id;

  const SliderProducts(
      {Key? key,
      this.products,
      this.favourite,
      this.get_favourite_function,
      this.current_user_id})
      : super(key: key);

  @override
  _SliderProductsState createState() => _SliderProductsState(
      products_cat: products,
      favourite: favourite,
      get_favourite: get_favourite_function,
      current_user_id: current_user_id);
}

class _SliderProductsState extends State<SliderProducts> {
  var products_cat;
  var favourite;
  var get_favourite;
  var current_user_id;
  _SliderProductsState(
      {this.products_cat,
      this.favourite,
      this.get_favourite,
      this.current_user_id});

  get_fav() async {
    favourite = await get_favourite;
    print(favourite);
    setState(() {
      favourite;
      products_cat;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 310,
      color: Colors.white,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: products_cat.length + 1,
          itemBuilder: (BuildContext ctxt, int index) {
            return index != products_cat.length
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 180,
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              topLeft: Radius.circular(8)),
                          color: Colors.green,
                          shape: BoxShape.rectangle,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 0.0,
                              blurRadius: 5.0,
                              offset: Offset(0.0, 3.0),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(left: 5, right: 10),
                        child: Center(
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(8),
                                      topLeft: Radius.circular(8)),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        products_cat
                                            .elementAt(index)["picture"]["url"]
                                            .toString(),
                                      )),
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 1, 15, 0),
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0.8),
                                  color: Colors.transparent,
                                  shape: BoxShape.rectangle,
                                ),
                                child: favourite.indexWhere((element) =>
                                            element["product_id"]["objectId"] ==
                                            products_cat.elementAt(
                                                index)["objectId"]) !=
                                        -1
                                    ? IconButton(
                                        icon: Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                        onPressed: () async {
                                          await delete_item(
                                              favourite.firstWhere((element) =>
                                                  element["product_id"]
                                                      .get<String>('objectId')
                                                      .toString() ==
                                                  products_cat.elementAt(index)[
                                                      "objectId"])["objectId"],
                                              "favourite");
                                          await get_fav();
                                        },
                                      )
                                    : IconButton(
                                        icon: Icon(
                                          Icons.favorite_border,
                                          color: Colors.red,
                                        ),
                                        onPressed: () async {
                                          await set_favourite(
                                              products_cat
                                                  .elementAt(index)["objectId"]
                                                  .toString(),
                                              current_user_id);
                                          await get_fav();
                                        },
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 120,
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8)),
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 0.0,
                              blurRadius: 5.0,
                              offset: Offset(0.0, 3.0),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(left: 5, right: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: TitleText(
                                          textalign: TextAlign.center,
                                          text: products_cat
                                              .elementAt(index)["name"]
                                              .toString(),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        )),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(4),
                                    child: Center(
                                      child: Text.rich(
                                        TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: products_cat
                                                      .elementAt(
                                                          index)["old_price"]
                                                      .toString() +
                                                  " coin\n",
                                              style: new TextStyle(
                                                color: Colors.grey,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                            TextSpan(
                                              style: TextStyle(
                                                  color: kPrimaryColor),
                                              text: products_cat
                                                      .elementAt(index)["price"]
                                                      .toString() +
                                                  " coin",
                                            ),
                                          ],
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.add_shopping_cart_outlined,
                                        color: Colors.black,
                                      ),
                                      Icon(
                                        Icons.flash_on_rounded,
                                        color: kPrimaryColor,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 0.0,
                          blurRadius: 15.0,
                          offset: Offset(0.0, 5.0),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                  );
          }),
    );
  }
}
