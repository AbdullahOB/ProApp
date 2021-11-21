import 'package:pro_app/components/main_button.dart';
import 'package:pro_app/components/text_field.dart';
import 'package:pro_app/constants.dart';
import 'package:pro_app/models/User/get_items.dart';
import 'package:pro_app/models/User/set_items.dart';
import 'package:pro_app/widgets/title_text.dart';
import 'package:flutter/material.dart';

AppBar appBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
      onPressed: () => Navigator.of(context).pop(),
    ),
    title: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Text("Order",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        SizedBox(height: 5),
        Text("complete your order",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400))
      ],
    ),
    backgroundColor: kPrimaryColor,
  );
}

class Order extends StatefulWidget {
  final products;
  const Order({Key? key, this.products}) : super(key: key);

  @override
  _OrderState createState() => _OrderState(products: products);
}

class _OrderState extends State<Order> {
  var products;
  var coupon = "";
  var varifyCoupon = [];
  var onceCoupon = true;
  var price;
  _OrderState({this.products});
  var loadproducts = false;
  @override
  void initState() {
    price = products["price"];
    print(products.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Material(
      child: Scaffold(
        appBar: appBar(context),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(top: 10)),
                  SizedBox(
                    width: double.infinity,
                    child: _item(
                        products["objectId"],
                        products["name"],
                        products["old_price"],
                        products["discription"],
                        products["category"].get<String>('objectId').toString(),
                        products["language_code"],
                        products["tag"],
                        products["picture"],
                        context,
                        queryData),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _item(id, name, oldprice, discription, selectedCategories,
      selectedLanguages, selectedTags, picture, context, queryData) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            height: queryData.size.height / 3,
            width: queryData.size.width / 1.2,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: TitleText(
                              text: name,
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      trailing: Container(
                        width: 120,
                        height: 40,
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TitleText(
                              textalign: TextAlign.right,
                              text: price.toString(),
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            const TitleText(
                              textalign: TextAlign.right,
                              text: " coin",
                              fontSize: 16,
                              color: kPrimaryColor,
                            ),
                          ],
                        ),
                      )))
            ],
          ),
          Divider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 50,
                color: Colors.transparent,
                child: Center(
                    child: Icon(
                  Icons.info,
                  color: kPrimaryColor,
                  size: 14,
                )),
              ),
              SizedBox(
                width: 4,
              ),
              Container(
                color: Colors.transparent,
                child: TitleText(
                  color: Colors.black,
                  text: "Discription :",
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 5, left: 5),
            width: double.infinity,
            color: Colors.transparent,
            child: TitleText(
              text: discription.toString(),
            ),
          ),
          Divider(),
          Container(
            child: Row(
              children: [
                selectedTags.toString() == "pubg"
                    ? Container(
                        width: 250,
                        color: Colors.transparent,
                        child: TextInput(
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(bottom: 4.0),
                                  child: Icon(
                                    Icons.account_circle_outlined,
                                    color: Colors.grey,
                                  ),
                                ),
                                hintText: 'Pubg ID',
                                hintStyle: TextStyle(fontSize: 12.0)),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {},
                          ),
                        ),
                      )
                    : SizedBox(),
                selectedTags.toString() == "pubg"
                    ? TextButton(
                        onPressed: () {},
                        child: Text(
                          "check",
                          style: TextStyle(color: Colors.black),
                        ))
                    : SizedBox()
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.transparent,
                width: 250,
                child: TextInput(
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(bottom: 4.0),
                          child: Icon(
                            Icons.confirmation_number_outlined,
                            color: Colors.grey,
                          ),
                          // icon is 48px widget.
                        ),
                        hintText: 'Coupon',
                        hintStyle: TextStyle(fontSize: 12.0)),
                    onChanged: (value) {
                      coupon = value.toString();
                    },
                  ),
                ),
              ),
              TextButton(
                  onPressed: () async {
                    if (onceCoupon) {
                      varifyCoupon = await get_coupon(coupon);
                      if (!varifyCoupon.isEmpty) {
                        setState(() {
                          price = products["price"] /
                              (100 / varifyCoupon[0]["percentage"]);
                          onceCoupon = false;
                          final snackBar =
                              SnackBar(content: Text('Coupon applied'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        });
                      } else {
                        final snackBar = SnackBar(
                            content: Text('Coupon is invalide or expired'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }
                  },
                  child: Text(
                    "apply",
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          ),
          !varifyCoupon.isEmpty
              ? Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Coupon applied : "),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TitleText(
                            textalign: TextAlign.right,
                            text: varifyCoupon[0]["percentage"].toString(),
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          const TitleText(
                            textalign: TextAlign.right,
                            text: " %",
                            fontSize: 16,
                            color: kPrimaryColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : SizedBox(),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total : "),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TitleText(
                      textalign: TextAlign.right,
                      text: price.toString(),
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    const TitleText(
                      textalign: TextAlign.right,
                      text: " coin",
                      fontSize: 16,
                      color: kPrimaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
          ButtonMain(
            text: "buy",
            press: () async {
              if (await set_order(products["objectId"], products["price"],
                  price, onceCoupon == true ? null : varifyCoupon[0], "")) {
                final snackBar =
                    SnackBar(content: Text('You order is in process'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }
}
