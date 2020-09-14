import 'package:flutter/material.dart';

class AnimOpacity extends StatefulWidget {
  @override
  _AnimOpacityState createState() => _AnimOpacityState();
}

class _AnimOpacityState extends State<AnimOpacity>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    _animation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opacity Animation'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedBuilder(
            animation: _animation,
            child: Center(
              child: Container(
                color: Colors.purple,
                constraints: BoxConstraints.tight(Size(200.0, 200.0)),
              ),
            ),
            builder: (BuildContext context, Widget child) {
              return Opacity(
                opacity: _animation.value,
                child: child,
              );
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            padding: const EdgeInsets.all(5.0),
            onPressed: () {
              setState(() {
                _controller.forward();
              });
            },
            color: Colors.red,
            child: Text(
              'Start',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ),
          SizedBox(height: 5.0,),
          RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            padding: const EdgeInsets.all(5.0),
            onPressed: () {
              setState(() {
                _controller.reset();
              });
            },
            color: Colors.red,
            child: Text(
              'Reset',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
