import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login.dart';
import 'signUp.dart';

class AuthHomePage extends StatelessWidget {

  List<String> tabList = ["LOGIN", "SIGN UP"];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
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
