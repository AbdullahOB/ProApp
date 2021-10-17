import 'package:flutter/material.dart';
import 'package:pro_app/widgets/BottomNavigationBar/bottom_navigation_bar.dart';

class Adimnbar extends StatefulWidget {
  const Adimnbar({Key? key}) : super(key: key);

  @override
  _AdimnbarState createState() => _AdimnbarState();
}

class _AdimnbarState extends State<Adimnbar> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Material(
      child: Container(
        width: queryData.size.width,
        height: queryData.size.height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: CustomBottomNavigationBar(
                onIconPresedCallback: onBottomIconPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onBottomIconPressed(int index) {
    print("dada");
  }
}
