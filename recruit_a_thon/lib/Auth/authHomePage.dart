import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../globals.dart';
import 'login.dart';
import 'signUp.dart';

// ignore: must_be_immutable
class AuthHomePage extends StatelessWidget {

  List<String> tabList = ["LOGIN", "SIGN UP"];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: (){
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      },
      child: Scaffold(
          body: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(1000),
                child: Container(
                  height: 100.0,
                  child: screenTabs(),
                  padding: EdgeInsets.only(top: 30.0),
                  decoration: tabDecoration(),
                ),
              ),
              body: TabBarView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  Login(),
                  SignUp()
                ],
              ),
            ),
          )
      ),
    );
  }

  Decoration tabDecoration(){
    return BoxDecoration(
      color: Colors.deepPurpleAccent[200],
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.deepPurpleAccent[100],
          blurRadius: 10,
          offset: Offset(0, 3),
        )
      ],
    );
  }

  Widget screenTabs(){
    return TabBar(
      unselectedLabelColor: Colors.deepOrangeAccent[10],
      labelColor: Colors.white,
      indicator: CustomTabIndicator(),
      labelStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
      tabs: tabList.map((tab) => Tab(text: tab)).toList(),
    );
  }
}

class CustomTabIndicator extends Decoration {
  @override
  _CustomPainter createBoxPainter([VoidCallback onChanged]) =>
      _CustomPainter(this, onChanged);
}

class _CustomPainter extends BoxPainter {
  final CustomTabIndicator decoration;

  _CustomPainter(this.decoration, VoidCallback onChanged)
      : assert(decoration != null),
        super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);

    final Rect rect = Rect.fromLTWH(
        configuration.size.width / 2 + offset.dx - 35, offset.dy + 65, 75, 5);
    final Paint paint = Paint();
    paint.color = Colors.deepPurpleAccent;
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        rect,
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      paint,
    );
  }
}

Widget inputField({String type, String hint, bool pass = false, int keyboardType = 1}){
  return Container(
    height: 70,
    margin: EdgeInsets.only(left: 30, right: 30, top: 13),
    padding: EdgeInsets.only(left: 20),
    decoration: BoxDecoration(
      color: Colors.grey[100],
      borderRadius: BorderRadius.circular(16),
    ),
    child: Center(
      child: TextFormField(
        keyboardType: (keyboardType == 0) ? TextInputType.number : TextInputType.text,
        maxLines: (pass) ? 1 : null,
        onChanged: (value){
          if(pass)
          enteredPassword = value;
          else
          enteredEmail = value;
        },
        obscureText: pass,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint ?? "",
        ),
        validator: (value){
          print("Entered text is: $value");
          Pattern pattern;
          RegExp regex;
          if (value.length==0 || value.isEmpty){
            return "$type $value should not be empty" ;
          }
          else {
            if(type == 'Email') {
                pattern = r"[a-zA-Z]@[a-zA-Z].[a-zA-Z]";
                regex = new RegExp(pattern);
                if(!regex.hasMatch(value)){
                  return 'Email is not in a valid format';
                }
            }
            if(type == 'Phone Number') {
              pattern = r"^[0-9]{10}$";
              regex = new RegExp(pattern);
              if(!regex.hasMatch(value)){
                return 'Phone Number must be of 10 digits';
              }
            }
            return null;
          }
        }
      ),
    ),
  );
}
