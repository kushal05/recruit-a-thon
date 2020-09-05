import 'package:flutter/material.dart';
import 'package:recruitathon/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'globals.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((prefs){
    isUserLoggedIn = prefs.getBool('isUserLoggedIn');
    isUserLoggedIn = (isUserLoggedIn == null) ? false : isUserLoggedIn;
  });
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

