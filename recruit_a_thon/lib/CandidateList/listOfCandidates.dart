import 'package:flutter/material.dart';

class CandidatesList extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.deepPurpleAccent[200],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 5.0,
              child:Row(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                      width:125,
                      height:125,
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
                Text("Richard Hendricks")
              ],)
            ),
          )
        ],
      ),
    );
  }
}