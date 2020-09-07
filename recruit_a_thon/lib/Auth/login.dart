import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:recruitathon/Auth/authHomePage.dart';
import 'package:recruitathon/CandidateList/listOfCandidates.dart';
import 'package:recruitathon/Models/User.dart';
import 'package:recruitathon/globals.dart';
import '../CandidateProfile/candidateProfile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<String> data;
  bool toggle = false;
  bool isValidated = true;

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
    //getData();
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
                inputField(type: "Email", hint: "Email...", pass: false),
                inputField(type: "Password", hint: "Password...", pass: true),
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
                getUsers();
                setState(() {
                  toggle = true;
                });
                // getUsers();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => CandidateProfile()),
                // );
              },
              child: toggle?SpinKitWave(color: Colors.white,size:30):Text(
                "Login",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
          isValidated?Container():Center(child: Text("Entered ID and Password not found!. Please try again."),)
        ],
      )),
    );
  }

  void getUsers()
  {
    Query query = FirebaseFirestore.instance.collection('Users');
    query
        .get()
        .then((value) => {
      value.docs.forEach((element) {
        User u = User();
        element.data().forEach((key, value) {
          debugPrint("$key $value");
          switch (key) {
            case "id":
              u.Id = value;
              break;
            case "email":
              u.Email = value;
              break;
            case "image":
              u.Image = value;
              break;
            case "skills":
              u.Skills = value;
              break;
            case "password":
              u.Password = value;
              break;
            case "projects":
              u.Projects = value;
              break;
            case "role":
              u.Role = value;
              break;
            case "certificates":
              u.Certificates = value;
              break;
            case "phone":
              u.Phone = value.toString();
              break;
            case "name":
              u.Name = value;
              break;
            case "locations":
              u.Locations = value;
              break;
          }
        });
        users.add(u);
        userMapping[u.Email] = u;
        debugPrint("lllllll ${users.length}");
      })
    }).whenComplete(() {
      if(userMapping.containsKey(enteredEmail)&&userMapping[enteredEmail].Password==enteredPassword)
      {
        currentUser = userMapping[enteredEmail];
        isValidated = true;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CandidateProfile()),
        );
      }
      else
      {
        setState(() {
          toggle = false;
          isValidated = false;
        });
      }
    });
  }
}


