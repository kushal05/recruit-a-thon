import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:recruitathon/CandidateList/listOfCandidates.dart';
import 'package:recruitathon/Models/User.dart';
import 'package:recruitathon/globals.dart';


=======
>>>>>>> 5ed3166b61fc05c47b82d55e52f7584c406e729d
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
        child: OutlineButton(
          child: Text("Login"),
          onPressed: () {           
            Query query = FirebaseFirestore.instance.collection('Users');
            query.get().then((value) => {
              value.docs.forEach((element) { 
                User u = User();
                element.data().forEach((key, value) { 
                  debugPrint("$key $value");
                  switch(key)
                  {
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
                debugPrint("lllllll ${users.length}");
              })
            }).whenComplete(() => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CandidatesList()),
              )
            });        
          },
        )
        ),
      ),
    );
  }
}
