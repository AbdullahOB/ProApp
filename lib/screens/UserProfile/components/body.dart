import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pro_app/components/gradient_icon.dart';
import 'package:pro_app/screens/UserProfile/components/edit_user_profile.dart';
import 'package:pro_app/screens/UserProfile/components/notification_user_profile.dart';
import 'package:pro_app/widgets/title_text.dart';
import '../../../constants.dart';

AppBar AppBarUserProfile(BuildContext context) {
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
      onPressed: () => Navigator.of(context).pop(),
    ),
    title: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Text("My Profile",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        SizedBox(height: 5),
        Text("You Can Edit Your Profile From Here",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400))
      ],
    ),
    backgroundColor: kPrimaryColor,
  );
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return SafeArea(
      child: Material(
        child: Container(
          child: ListView(
            children: <Widget>[
              ListTile(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return editUserProfile();
                    },
                  ),
                ),
                leading: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        "Abdullah Obaid",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "abdullahobeid@gmail.com",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 13,
                            fontStyle: FontStyle.normal),
                      ),
                    ],
                  ),
                ),
                trailing: Icon(
                  Icons.edit_outlined,
                  size: 20,
                  color: kPrimaryColor,
                ),
              ),
              ListTile(
                leading: RadiantGradientMask(
                    child: Icon(
                  Icons.shopping_bag,
                  size: 40,
                  color: Colors.white,
                )),
                title: Text('Your Orders'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: kPrimaryColor,
                  size: 20,
                ),
              ),
              ListTile(
                leading: RadiantGradientMask(
                    child: Icon(
                  Icons.favorite,
                  size: 40,
                  color: Colors.white,
                )),
                title: Text('Fav'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: kPrimaryColor,
                  size: 20,
                ),
              ),
              ListTile(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return userNotifications();
                    },
                  ),
                ),
                leading: RadiantGradientMask(
                    child: Icon(
                  Icons.notifications,
                  size: 40,
                  color: Colors.white,
                )),
                title: Text('Notifications'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: kPrimaryColor,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
