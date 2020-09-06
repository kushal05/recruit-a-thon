import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:recruitathon/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'globals.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((prefs){
    isUserLoggedIn = prefs.getBool('isUserLoggedIn');
    isUserLoggedIn = (isUserLoggedIn == null) ? false : isUserLoggedIn;
  });
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recruit-a-thon',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(isUserLoggedIn: isUserLoggedIn),
      debugShowCheckedModeBanner: false,
    );
  }
}

