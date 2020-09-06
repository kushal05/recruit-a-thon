import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recruitathon/CandidateList/listOfCandidates.dart';
import 'package:recruitathon/Models/User.dart';
import 'package:recruitathon/globals.dart';


import '../CandidateProfile/candidateProfile.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
