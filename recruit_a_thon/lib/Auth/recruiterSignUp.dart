import 'package:flutter/material.dart';
import 'package:recruitathon/Auth/authHomePage.dart';

class RecruiterSignUp extends StatefulWidget {
  final GlobalKey<FormState> signUpKey;
  final PageController pageController;
  RecruiterSignUp({this.signUpKey, this.pageController});
  @override
  _RecruiterSignUpState createState() => _RecruiterSignUpState();
}

class _RecruiterSignUpState extends State<RecruiterSignUp> {
  final recruiterSignUpKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 40),
          ),
          Center(
            child: Container(
              child: Text(
                "Some more details about you...",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.deepOrangeAccent),
              ),
            ),
          ),
          Form(
            key: recruiterSignUpKey,
            child: Column(
              children: <Widget>[
                inputField(type: "Company", hint: "Your company...", pass: false),
                inputField(type: "Designation", hint: "Your designation...", pass: false),
              ],
            ),
          ),
          MaterialButton(
            child: Text('Go Back'),
            onPressed: (){
              widget.pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.easeInOutQuad);
            },
          ),
          Container(
            margin: EdgeInsets.only(top: 15.0),
            width: MediaQuery.of(context).size.width / 2.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.deepPurpleAccent,
            ),
            child: MaterialButton(
              onPressed: (){
                widget.pageController.animateToPage(2, duration: Duration(milliseconds: 500), curve: Curves.easeInOutQuad);
              },
                child: Icon(Icons.arrow_downward, color: Colors.white, size: 30,)
            ),
          ),
        ],
      ),
    );
  }
}
