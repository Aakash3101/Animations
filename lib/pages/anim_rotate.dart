import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimRotate extends StatefulWidget {
  @override
  _AnimRotateState createState() => _AnimRotateState();
}

class _AnimRotateState extends State<AnimRotate>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation =
        Tween<double>(begin: 0.0, end: 5.0).animate(_animationController);
    _animationController.addListener(
      (){
        if (_animationController.status == AnimationStatus.completed){
          _animationController.reset();
        }
      }
    );
    //_animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rotation Animation'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedBuilder(
              animation: animation,
              child: Container(
                color: Colors.blue,
                width: 100.0,
                height: 100.0,
              ),
              builder: (BuildContext context, Widget child) {
                return Transform.rotate(
                  angle: 2 * math.pi * animation.value,
                  child: child,
                );
              },
            ),
            SizedBox(
              height: 25.0,
            ),
            RaisedButton(
              child: Text('Rotate'),
              onPressed: () {
                setState(() {
                  _animationController.forward();
                });
              },
            ),
            RaisedButton(
              child: Text('Stop'),
              onPressed: () {
                setState(() {
                  _animationController.stop();
                });
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
