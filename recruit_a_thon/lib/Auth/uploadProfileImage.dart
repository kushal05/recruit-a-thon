import 'package:flutter/material.dart';

class UploadProfileImage extends StatefulWidget {
  final GlobalKey<FormState> signUpKey;
  final PageController pageController;
  UploadProfileImage({this.signUpKey, this.pageController});
  @override
  _UploadProfileImageState createState() => _UploadProfileImageState();
}

class _UploadProfileImageState extends State<UploadProfileImage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Text('Upload image here'),
        ),
        MaterialButton(
          child: Text('Go Back'),
          onPressed: (){
            widget.pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.easeInOutQuad);
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

              },
              child: Text(
                "SignUp",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              )
          ),
        ),
      ],
    );
  }
}
