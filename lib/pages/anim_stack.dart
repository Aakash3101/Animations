import 'package:flutter/material.dart';

class AnimStack extends StatefulWidget {
  @override
  _AnimStackState createState() => _AnimStackState();
}

class _AnimStackState extends State<AnimStack>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation blue, black, green, red;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1200));
    // Right translation
    blue = Tween<Offset>(begin: Offset(-1.5, 0.0), end: Offset.zero).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Interval(0.0, 1, curve: Curves.easeInOut)));

    // Top translation
    black = Tween<Offset>(begin: Offset(0.0, -2.0), end: Offset.zero).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Interval(0, 1, curve: Curves.easeInOut)));

    // Left translation
    green = Tween<Offset>(begin: Offset(2.0, 0.0), end: Offset.zero).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Interval(0, 1, curve: Curves.easeInOut)));

    // Bottom translation
    red = Tween<Offset>(begin: Offset(0.0, 7.0), end: Offset.zero).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Interval(0, 1.0, curve: Curves.easeInOut)));

    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Stack Animation'),
          backgroundColor: Colors.red,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: AnimatedBuilder(
                animation: _controller,
                child: Stack(
                  overflow: Overflow.clip,
                  fit: StackFit.passthrough,
                  alignment: Alignment.center,
                  children: <Widget>[
                    SlideTransition(
                      position: blue,
                      child: Container(
                        color: Colors.blue,
                        height: 380.0,
                        width: 380.0,
                      ),
                    ),
                    SlideTransition(
                      position: black,
                      child: Container(
                        color: Colors.black,
                        height: 280.0,
                        width: 280.0,
                      ),
                    ),
                    SlideTransition(
                      position: green,
                      child: Container(
                        color: Colors.cyan,
                        height: 170.0,
                        width: 170.0,
                      ),
                    ),
                    SlideTransition(
                      position: red,
                      child: Container(
                        color: Colors.indigo,
                        height: 70.0,
                        width: 70.0,
                      ),
                    )
                  ],
                ),
                builder: (BuildContext context, Widget child) {
                  return child;
                },
              ),
            ),
          ],
        ));
  }
}
