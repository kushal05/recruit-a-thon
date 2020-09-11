import 'package:flutter/material.dart';
import 'package:recruitathon/Auth/authHomePage.dart';
import 'package:recruitathon/Auth/candidateSignUp.dart';
import 'package:recruitathon/Auth/recruiterSignUp.dart';
import 'package:recruitathon/Auth/uploadProfileImage.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  PageController signUpController = PageController();
  bool candidateRole = true;
  final _signUpKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Container(
      child: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: signUpController,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          basicUserDetailsForm(),
          (candidateRole) ? CandidateSignUp(signUpKey: _signUpKey, pageController: signUpController)
                          : RecruiterSignUp(signUpKey: _signUpKey, pageController: signUpController,),
          UploadProfileImage(signUpKey: _signUpKey, pageController: signUpController),
        ],
      )
    );
  }

  Widget basicUserDetailsForm(){
    return Container(
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 40),
          ),
          Center(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Text(
                  "Welcome",
                  style: TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.deepPurpleAccent),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
          ),
          Center(
            child: Container(
              child: Text(
                "Let's create your account",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.deepOrangeAccent),
              ),
            ),
          ),
          Form(
            key: _signUpKey,
            child: Column(
              children: <Widget>[
                inputField(type: "Name", hint: "Your Name...", pass: false),
                inputField(type: "Email", hint: "Email...", pass: false),
                inputField(type: "Password", hint: "Password...", pass: true),
                inputField(type: "Phone Number", hint: "Phone Number...", pass: false, keyboardType: 0),
                Container(
                  height: 60,
                  margin: EdgeInsets.only(left: 30, right: 30, top: 13),
                  padding: EdgeInsets.only(left: 0),
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('You are a...', style: TextStyle(fontSize: 18),),
                  ),
                ),
                Wrap(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Candidate',
                      ),
                      leading: Radio(
                        value: true,
                        groupValue: candidateRole,
                        onChanged: (value){
                          setState(() {
                            candidateRole = true;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Recruiter',
                      ),
                      leading: Radio(
                        value: false,
                        groupValue: candidateRole,
                        onChanged: (value){
                          setState(() {
                            candidateRole = false;
                          });
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 15.0, right: 30, left: 30),
              width: MediaQuery.of(context).size.width / 2.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.deepPurpleAccent,
              ),
              child: MaterialButton(
                onPressed: (){
                  if(_signUpKey.currentState.validate()){
                    _signUpKey.currentState.save();
                    signUpController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.easeInOutQuad);
                  } else {
                    Scaffold
                        .of(context)
                        .showSnackBar(SnackBar(content: Text('Enter valid data')));
                  }
                },
                child: Icon(Icons.arrow_downward, color: Colors.white, size: 30,)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
