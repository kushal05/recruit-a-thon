import 'package:flutter/material.dart';
import 'package:recruitathon/Auth/authHomePage.dart';

class CandidateSignUp extends StatefulWidget {
  final GlobalKey<FormState> signUpKey;
  final PageController pageController;
  CandidateSignUp({this.signUpKey, this.pageController});
  @override
  _CandidateSignUpState createState() => _CandidateSignUpState();
}

class _CandidateSignUpState extends State<CandidateSignUp> {
  final candidateSignUpKey = GlobalKey<FormState>();
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
            key: candidateSignUpKey,
            child: Column(
              children: <Widget>[
                inputField(type: "Experience", hint: "Experience in yrs (optional)...", pass: false, keyboardType: 0),
                inputField(type: "Skills", hint: "Your skills...", pass: false),
                inputField(type: "Locations", hint: "Preferred Locations", pass: false),
                inputField(type: "Certificates", hint: "Add Your certificates...", pass: false),
                inputField(type: "Projects", hint: "Your projects...", pass: false),
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
