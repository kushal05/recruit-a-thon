import 'package:flutter/material.dart';
import '../CandidateProfile/candidateProfile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<String> data;

  void getData() async {
    print("In get data");
    QuerySnapshot dummy = await FirebaseFirestore.instance
        .collection('dummy')
        .get()
        .then((value) {
      print("Value is: $value");
      value.docs.forEach((element) {
        data.add(element.data()['text']);
        print("Element: ${element.data()['text']}");
      });
      return value;
    });
    print("Dummy is now: $dummy");
  }

  @override
  void initState() {
    print("In init state");
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginKey = GlobalKey<FormState>();
    return Container(
      child: Center(
          child: Column(
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
                "Enter into your account",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.deepOrangeAccent),
              ),
            ),
          ),
          Form(
            key: loginKey,
            child: Column(
              children: <Widget>[
                inputField(
                    type: "Email",
                    hint: "Email...",
                    pass: false
                ),
                inputField(
                    type: "Password",
                    hint: "Password...",
                    pass: true
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.0),
            width: MediaQuery.of(context).size.width / 2.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.deepPurpleAccent,
            ),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CandidateProfile()),
                );
              },
              child: Text(
                "Login",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      )),
    );
  }
  Widget inputField({String type, String hint, bool pass = false}){
    return Container(
      height: 60,
      margin: EdgeInsets.only(left: 30, right: 30, top: 13),
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: TextFormField(
          obscureText: pass,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint ?? "",
          ),
          validator: (value)=>
          (value.length==0 || value.isEmpty)? "$type should not be empty" : null,
        ),
      ),
    );
  }
}
