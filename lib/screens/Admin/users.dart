import 'package:pro_app/screens/welcome/components/background.dart';
import 'package:pro_app/widgets/title_text.dart';

import 'components/adminbar.dart';
import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Material(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            width: queryData.size.width,
            height: queryData.size.height,
            color: Colors.white,
            child: Center(
              child: TitleText(
                text: "here we go",
                fontSize: 27,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            child: Adimnbar(),
          ),
        ],
      ),
    );
  }
}
