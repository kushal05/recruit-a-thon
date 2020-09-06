import 'package:flutter/material.dart';

import '../CandidateProfile/candidateProfile.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: OutlineButton(
          child: Text("Login"),
          onPressed: () {
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CandidateProfile()),
            );
          },
        )
        ),
    );
  }
}
