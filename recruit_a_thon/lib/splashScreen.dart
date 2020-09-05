import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruitathon/Auth/authHomePage.dart';
import 'Home/homeScreen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatelessWidget {
  bool isUserLoggedIn;
  SplashScreen({this.isUserLoggedIn});

  @override
  Widget build(BuildContext context) {
    if (isUserLoggedIn) {
      HomeScreen();
    } else {
      return Scaffold(
        body: Container(
          color: Colors.deepPurpleAccent[200],
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 350.0,
                child: TypewriterAnimatedTextKit(
                    onTap: () {
                      print("Tapped");
                    },
                    repeatForever: true,
                    speed: Duration(milliseconds: 200),
                    text: ["Recruit-a-thon"],
                    textStyle: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                    textAlign: TextAlign.start,
                    alignment:
                        AlignmentDirectional.topStart // or Alignment.topLeft
                    ),
              ),
              SizedBox(height: 30,),
              Text(
                "Your chance to",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 30,),
              SizedBox(
                width: 450.0,
                child: ScaleAnimatedTextKit(
                  onTap: () {
                    print("Tapped");
                  },
                  repeatForever: true,
                  text: ["Recruit.", "Get Recruited."],
                  textStyle: TextStyle(fontSize: 35.0, color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(height: 30,),
              MaterialButton(
                height: 50,
                onPressed: (){
                  print("Hey");
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => AuthHomePage()));
                },
                elevation: 5.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                child: Text('Get Started'),
                color: Colors.white,
              )
            ],
          ),
        ),
      );
    }
  }
}
