import 'package:flutter/material.dart';

import 'package:pro_app/widgets/title_text.dart';

import '../../../constants.dart';

class userNotifications extends StatefulWidget {
  const userNotifications({Key? key}) : super(key: key);

  @override
  _userNotificationsState createState() => _userNotificationsState();
}

class _userNotificationsState extends State<userNotifications> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      body: notificationUserProfileBody(context),
      appBar: AppBarUserProfile(context),
    );
  }

  Widget notificationUserProfileBody(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Material(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              width: queryData.size.width,
              height: queryData.size.height,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(top: 10)),
                  TitleText(
                    text: "User Notifications",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  TitleText(
                    text: "Abdullah Obaid",
                    fontSize: 27,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  Expanded(
                      child: ListView(children: [
                    _requestorder(queryData),
                    SizedBox(
                      height: 100,
                    )
                  ]))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _item() {
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
                    height: 60,
                    width: 60,
                    child: Container(
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                Center(
                  child: Icon(
                    Icons.card_giftcard_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: ListTile(
                  title: TitleText(
                    text: "Gifts",
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                  subtitle: Row(
                    children: <Widget>[
                      TitleText(
                        text: "pubg coin",
                        fontSize: 14,
                      ),
                    ],
                  ),
                  trailing: Container(
                    width: 35,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: TitleText(
                      text: 'x20',
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  )))
        ],
      ),
    );
  }

  Widget _requestorder(queryData) {
    return Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        height: (80 * 4) + 150,
        width: queryData.size.width,
        color: Colors.white,
        child:
            ListView(physics: const NeverScrollableScrollPhysics(), children: [
          Container(
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ignore: deprecated_member_use
                FlatButton(
                  splashColor: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TitleText(
                            text: "Abdullah Ob Order",
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                          TitleText(
                            text: "Status : In process",
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TitleText(
                            text: "Order ID : 588czs965",
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                          TitleText(
                            text: "10/02/2020",
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TitleText(
                            text: "Sponser : Abdullah",
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                    ],
                  ),
                  onPressed: () => {
                    _showMyDialog(),
                  },
                ),
              ],
            ),
          ),
          FlatButton(
            splashColor: Colors.transparent,
            child: _item(),
            onPressed: _showMyDialog,
          ),
          FlatButton(
            splashColor: Colors.transparent,
            child: _item(),
            onPressed: _showMyDialog,
          ),
          FlatButton(
            splashColor: Colors.transparent,
            child: _item(),
            onPressed: _showMyDialog,
          ),
          FlatButton(
            splashColor: Colors.transparent,
            child: _item(),
            onPressed: _showMyDialog,
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          Container(
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleText(
                  text: "Total",
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                TitleText(
                  text: "200TL",
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ]));
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

AppBar AppBarUserProfile(BuildContext context) {
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
      onPressed: () => Navigator.of(context).pop(),
    ),
    title: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Notifications",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
      ],
    ),
    backgroundColor: kPrimaryColor,
  );
}
