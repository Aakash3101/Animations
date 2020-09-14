import 'package:flutter/material.dart';

class AnimScale extends StatefulWidget {
  @override
  _AnimScaleState createState() => _AnimScaleState();
}

class _AnimScaleState extends State<AnimScale>
    with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    _animation = Tween<double>(begin: 0.8, end: 2.0).animate(
        CurvedAnimation(curve: Curves.fastOutSlowIn, parent: _controller));
    _controller.addListener((){
      if(_animation.status == AnimationStatus.completed) {
        _controller.reset();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scale Animation'),
        backgroundColor: Colors.red,
      ),
      body: AnimatedBuilder(
        animation: _animation,
        child: Container(width: 100.0, height: 100.0, color: Colors.green),
        builder: (BuildContext context, Widget child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Transform.scale(
                  scale: _animation.value,
                  child: child,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    _controller.forward();
                  });
                },
                child: Text('Animate'),
              )
            ],
          );
        },
      ),
    );
  }
}
