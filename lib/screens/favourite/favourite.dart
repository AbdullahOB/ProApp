import 'dart:math';
import 'package:pro_app/screens/HomePage/components/adminbar.dart';
import 'package:pro_app/widgets/title_text.dart';
import '../../constants.dart';
import 'package:flutter/material.dart';

var images = [
  "https://cdn.upstation.asia/wp-content/uploads/sites/4/2019/10/30172834/pub-350x150.jpg",
  "https://cdn.upstation.asia/wp-content/uploads/sites/6/2020/01/09235510/36847-350x150.jpeg",
  "https://cdn.upstation.asia/wp-content/uploads/sites/6/2020/09/15130834/Upgrade-PUBG-Mobile-Royale-Pass-S15-Beyond-A.C.E-on-UniPin-350x150.jpg"
];
var images2 = [
  "https://lh3.googleusercontent.com/LWTYG2vtR2LglsyL-tCvy_B08toYN1ewwQGMqIgrVA1sFEUFlhWHb3CYjb2ZLl8w9MA",
  "https://lh3.googleusercontent.com/proxy/sOMZRAnpZPfcNHRRMvjjlCT7lDjmtnD5WL2BVsuufzMXqwemtbFbgoHOVB_Pg-YDIh8N_unHfQZ0SKmmdS6yQcQbGhhuAywxjjPcmx48iKqUqyN671lGnHKbGbjtPGg7NkXHv8j7mvzcTbr01SvvqvjlTzT9dQ",
];

class Favouritepage extends StatefulWidget {
  const Favouritepage({Key? key}) : super(key: key);

  @override
  _FavouritepageState createState() => _FavouritepageState();
}

Widget sliderTitle() {
  return Column(
    children: [
      Padding(padding: EdgeInsets.only(top: 20)),
      Container(
        margin: EdgeInsets.fromLTRB(3, 0, 3, 0),
        width: double.infinity,
        child: Row(
          children: [
            TitleText(
              text: "Category",
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

Widget slider() {
  return Container(
      width: double.infinity,
      height: 270,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 180,
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8), topLeft: Radius.circular(8)),
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
                          image: NetworkImage(
                        images2[Random().nextInt(1)],
                      )),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 2, 4, 0),
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0.8),
                      color: Colors.transparent,
                      shape: BoxShape.rectangle,
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 80,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TitleText(
                        text: "Pubg coin",
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                      TitleText(
                        text: "Royal pass 12",
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: kPrimaryColor,
                      ),
                      TitleText(
                        text: "25 Coin",
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Icon(Icons.add_shopping_cart_outlined)
                  ],
                ),
              ],
            ),
          ),
        ],
      ));
}

Widget categoriesSlider() {
  return Container(
    color: Colors.white,
    height: 80,
    margin: EdgeInsets.only(bottom: 0, top: 10),
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
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
                        Icons.gamepad,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      TitleText(
                        text: "Gamming",
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

class _FavouritepageState extends State<Favouritepage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return SafeArea(
      child: Material(
          child: Container(
        width: double.infinity,
        height: queryData.size.height,
        child: ListView(children: [
          Container(
            padding: EdgeInsets.only(bottom: 20),
            width: double.infinity,
            height: 100,
            color: Colors.green,
            child: TitleText(
              text: "ProApp",
              fontSize: 27,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          Container(
            height: queryData.size.height - 100,
            width: double.infinity,
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              children: List.generate(100, (index) {
                return Container(
                  child: slider(),
                );
              }),
            ),
          )
        ]),
      )),
    );
  }
}
