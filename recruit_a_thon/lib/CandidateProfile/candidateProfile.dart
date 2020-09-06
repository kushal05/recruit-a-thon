import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CandidateProfile extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.deepPurpleAccent[200]
      ));
    return Scaffold(
      body:ListView(
        children: <Widget>[
          Container(
            height: 350,
            child: Stack(
              children: <Widget>[
                Container(
                  color: Colors.deepPurpleAccent[200],
                  height:250
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(125, 170, 100, 0),
                  child: Container(
                    width:160,
                    height:160,
                    child: Image.asset('assets/download.jpg'),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey,
                      boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 2.0,
                              spreadRadius: 0.0,
                              offset: Offset(2.0, 2.0), // shadow direction: bottom right
                          )
                      ],
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom:60),
            child: Center(child: Text("Richard Hendricks",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          ),
          UserInfo(),
          UserProjects(),
        ],
      )
    );
  }
  
}

class UserProjects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
            alignment: Alignment.topLeft,
            child: Text(
              "User Projects",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Card(
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      ...ListTile.divideTiles(
                        color: Colors.grey,
                        tiles: [
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            leading: Icon(Icons.assessment),
                            title: Text("Project Name"),
                            subtitle: Text("Pied Piper"),
                          ),
                          ListTile(
                            leading: Icon(Icons.category),
                            title: Text("Description"),
                            subtitle: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                          ),
                          // ListTile(
                          //   leading: Icon(Icons.phone),
                          //   title: Text("Phone"),
                          //   subtitle: Text("99--99876-56"),
                          // ),
                          // ListTile(
                          //   leading: Icon(Icons.person),
                          //   title: Text("About Me"),
                          //   subtitle: Text(
                          //       "Software Engineer at Hooli"),
                          // ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
            alignment: Alignment.topLeft,
            child: Text(
              "User Information",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Card(
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      ...ListTile.divideTiles(
                        color: Colors.grey,
                        tiles: [
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            leading: Icon(Icons.my_location),
                            title: Text("Location"),
                            subtitle: Text("Silicon Valley"),
                          ),
                          ListTile(
                            leading: Icon(Icons.email),
                            title: Text("Email"),
                            subtitle: Text("rhendricks@gmail.com"),
                          ),
                          ListTile(
                            leading: Icon(Icons.phone),
                            title: Text("Phone"),
                            subtitle: Text("99--99876-56"),
                          ),
                          ListTile(
                            leading: Icon(Icons.person),
                            title: Text("About Me"),
                            subtitle: Text(
                                "Software Engineer at Hooli"),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}