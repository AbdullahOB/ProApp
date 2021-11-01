import 'package:flutter/material.dart';
import 'package:pro_app/constants.dart';
import 'package:pro_app/screens/welcome/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pro App',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: FutureBuilder(builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("You have an error Here! ${snapshot.error.toString()}");
            return Text("Something went wrong!");
          } else if (snapshot.hasData) {
            return WelcomeScreen();
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: kPrimaryColor,
              ),
            );
          }
        })
        //WelcomeScreen(),
        );
  }
}
