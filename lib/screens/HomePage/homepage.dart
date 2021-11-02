import 'dart:math';

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
var images2 = [
  "https://lh3.googleusercontent.com/LWTYG2vtR2LglsyL-tCvy_B08toYN1ewwQGMqIgrVA1sFEUFlhWHb3CYjb2ZLl8w9MA",
  "https://lh3.googleusercontent.com/proxy/sOMZRAnpZPfcNHRRMvjjlCT7lDjmtnD5WL2BVsuufzMXqwemtbFbgoHOVB_Pg-YDIh8N_unHfQZ0SKmmdS6yQcQbGhhuAywxjjPcmx48iKqUqyN671lGnHKbGbjtPGg7NkXHv8j7mvzcTbr01SvvqvjlTzT9dQ",
];

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
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
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext ctxt, int index) {
          return index != 9
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

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return SafeArea(
      child: Material(
        child: Stack(
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
                    sliderTitle(),
                    slider(),
                    sliderTitle(),
                    slider(),
                    sliderTitle(),
                    slider(),
                    sliderTitle(),
                    slider(),
                    sliderTitle(),
                    slider(),
                    Container(
                      height: 100,
                    )
                  ]))
                ],
              ),
            ),
            Container(
              child: UserBar(),
            ),
          ],
        ),
      ),
    );
  }
}
