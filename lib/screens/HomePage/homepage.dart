import 'package:pro_app/widgets/title_text.dart';
import 'components/adminbar.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

Widget slider() {
  return Container(
    height: 150,
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
                    text: "Express",
                    fontSize: 27,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  Expanded(
                      child: ListView(children: [
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
