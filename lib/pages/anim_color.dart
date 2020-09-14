import 'package:flutter/material.dart';

class AnimColor extends StatefulWidget {
  @override
  _AnimColorState createState() => _AnimColorState();
}

class _AnimColorState extends State<AnimColor>
    with SingleTickerProviderStateMixin {
  Animation _animation, _shapeanimation, _sizeanimation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    _animation = ColorTween(begin: Colors.blue, end: Colors.green).animate(
        CurvedAnimation(curve: Curves.fastOutSlowIn, parent: _controller));

    _shapeanimation = BorderRadiusTween(
            begin: BorderRadius.circular(0.0),
            end: BorderRadius.circular(150.0))
        .animate(CurvedAnimation(
            parent: _controller,
            curve: Interval(0.3, 0.9, curve: Curves.elasticOut)));

    _sizeanimation =
        SizeTween(begin: Size(200.0, 100.0), end: Size(300.0, 300.0)).animate(
            CurvedAnimation(
                parent: _controller,
                curve: Interval(0.2, 0.8, curve: Curves.fastOutSlowIn)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Animation'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              padding: const EdgeInsets.all(10.0),
              onPressed: () {
                setState(() {
                  _controller.forward();
                });
              },
              color: Colors.red,
              child: Text(
                'Start',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              padding: const EdgeInsets.all(10.0),
              onPressed: () {
                setState(() {
                  _controller.reset();
                });
              },
              child: Text('Reset',
                  style: TextStyle(color: Colors.white, fontSize: 20.0)),
              color: Colors.red,
            ),
            SizedBox(
              height: 40.0,
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget child) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: _shapeanimation.value,
                      color: _animation.value),
                  constraints: BoxConstraints.loose(_sizeanimation.value),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
