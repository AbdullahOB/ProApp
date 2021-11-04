import 'package:flutter/material.dart';
import 'package:pro_app/widgets/title_text.dart';
import '../../constants.dart';
import 'components/body.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUserProfile(context),
      body: Body(),
    );
  }
}
