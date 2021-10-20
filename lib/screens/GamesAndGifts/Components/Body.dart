import 'package:flutter/material.dart';
import 'package:pro_app/components/data.dart';
import 'package:pro_app/components/lightColor.dart';
import 'package:pro_app/components/product_card.dart';
import 'package:pro_app/components/theme.dart';
import 'package:pro_app/components/title_text.dart';
import 'package:pro_app/components/extentions.dart';
import 'package:pro_app/constants.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppTheme.fullHeight(context) - 0,
      decoration: BoxDecoration(),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _appBar(),
            _title(),
            _productWidget(),
          ]),
    );
  }

  Widget _icon(IconData icon, {Color color = LightColor.iconColor}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          color: kPrimaryColor,
          boxShadow: AppTheme.shadow),
      child: Icon(
        icon,
        color: color,
      ),
    ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)));
  }

  Widget _appBar() {
    return Container(
      padding: AppTheme.padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RotatedBox(
            quarterTurns: 4,
            child: _icon(Icons.sort, color: Colors.white),
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            child: Container(
              decoration: BoxDecoration(
                color: kPrimaryColor,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Color(0xfff8f8f8),
                      blurRadius: 10,
                      spreadRadius: 10),
                ],
              ),
              child: _icon(Icons.person, color: Colors.white),
            ),
          ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)))
        ],
      ),
    );
  }

  Widget _productWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      width: AppTheme.fullWidth(context),
      height: AppTheme.fullWidth(context),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 4 / 3,
            mainAxisSpacing: 30,
            crossAxisSpacing: 20),
        padding: EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        children: AppData.productList
            .map(
              (product) => ProductCard(
                product: product,
                onSelected: (model) {},
              ),
            )
            .toList(),
      ),
    );
  }
}

Widget _title() {
  return Container(
      margin: AppTheme.padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TitleText(
                color: Colors.black87,
                text: 'Our',
                fontSize: 27,
                fontWeight: FontWeight.w400,
              ),
              TitleText(
                color: Colors.black87,
                text: 'Products',
                fontSize: 27,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.all(10),
          ),
          SizedBox()
        ],
      ));
}
