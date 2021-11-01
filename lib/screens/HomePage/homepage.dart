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
  "data:image/jpeg;base64,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"
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
                                  images2[Random().nextInt(2)],
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
