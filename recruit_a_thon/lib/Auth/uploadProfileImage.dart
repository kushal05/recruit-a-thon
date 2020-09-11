
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../globals.dart';

class UploadProfileImage extends StatefulWidget {
  final GlobalKey<FormState> signUpKey;
  final PageController pageController;
  UploadProfileImage({this.signUpKey, this.pageController});
  @override
  _UploadProfileImageState createState() => _UploadProfileImageState();
}

class _UploadProfileImageState extends State<UploadProfileImage> {

  File _pic;
  ImagePicker _picker = new ImagePicker();

  Future getImage(File f) async
  {
    var image = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _pic = File(image.path);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children:[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: RaisedButton(
                    child: Text("Choose Profile Picture"),
                    onPressed: (){getImage(_pic);},
                  ),
                ),
                Center(
                  child: Container(
                    width: 250.0,
                    height: 250.0,
                    decoration:BoxDecoration(
                      color:Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5.0, // has the effect of softening the shadow
                          spreadRadius: 5.0, // has the effect of extending the shadow
                        )
                      ],
                    ),
                    child: (_pic!=null)?Image.file(_pic,fit:BoxFit.fill):Center(child: Text("Preview"),),
                  ),
                ),
              ],
            ),
          ),
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
                uploadImage();
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

  void uploadImage() async {
    StorageReference firebaseStorageRef1 = FirebaseStorage.instance.ref().child("$enteredEmail");
    StorageUploadTask uploadTask1 = firebaseStorageRef1.putFile(_pic);
    StorageTaskSnapshot taskSnapshot1=await uploadTask1.onComplete;
  }
}
