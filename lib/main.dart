import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pro_app/constants.dart';
import 'package:pro_app/screens/welcome/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pro App',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: FutureBuilder(
            future: _fbApp,
            builder: (context, snapshot) {
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
