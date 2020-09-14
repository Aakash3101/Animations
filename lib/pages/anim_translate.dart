import 'package:flutter/material.dart';

class AnimTranslate extends StatefulWidget {
  @override
  _AnimTranslateState createState() => _AnimTranslateState();
}

class _AnimTranslateState extends State<AnimTranslate>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation animation;
  //Animation _animation, _yanimation,
  Tween x, y, z, w;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    // _animation = Tween<double>(begin: 0, end: 0.638).animate(CurvedAnimation(
    //   parent: _controller,
    //   curve: Curves.fastOutSlowIn,
    // ));
    // _yanimation = Tween<double>(begin: 0.5, end: 1.1).animate(CurvedAnimation(
    //   curve: Curves.fastOutSlowIn,
    //   parent: _controller,
    // ));
    x = FractionalOffsetTween(
        begin: FractionalOffset(50.0, -125.0),
        end: FractionalOffset(50.0, 125.0));
    y = FractionalOffsetTween(
        begin: FractionalOffset(50.0, 125.0),
        end: FractionalOffset(280.0, 125.0));
    z = FractionalOffsetTween(
        begin: FractionalOffset(280.0, 125.0),
        end: FractionalOffset(280.0, -125.0));
    w = FractionalOffsetTween(
        begin: FractionalOffset(280.0, -125.0),
        end: FractionalOffset(50.0, -125.0));

    animation = TweenSequence([
      TweenSequenceItem(
        tween: x,
        weight: 1,
      ),
      TweenSequenceItem(tween: y, weight: 1),
      TweenSequenceItem(tween: z, weight: 1),
      TweenSequenceItem(tween: w, weight: 1)
    ]).animate(CurvedAnimation(curve: Curves.ease, parent: _controller));
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
        title: Text('Translation Animation'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.all(10.0),
              height: 500.0,
              width: 400.0,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 5.0),
              ),
              child: AnimatedBuilder(
                animation: animation,
                child: Container(
                  constraints: BoxConstraints.tight(Size(50.0, 50.0)),
                  color: Colors.red,
                ),
                builder: (BuildContext context, Widget child) {
                  //print('${animation.value.dx}, ${animation.value.dy}');
                  return Transform(
                    child: child,
                    transform: Matrix4.translationValues(
                        animation.value.dx, animation.value.dy, 0.0),
                  );
                },
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      _controller.forward();
                    });
                  },
                  child: Text('Translate'),
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      _controller.stop();
                    });
                  },
                  child: Text('Stop'),
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      _controller.reset();
                    });
                  },
                  child: Text('Reset'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
// AnimatedBuilder(
//                 animation: _animation,
//                 child: Container(
//                   color: Colors.red,
//                   constraints: BoxConstraints.loose(Size(120.0, 120.0)),
//                 ),
//                 builder: (BuildContext context, Widget child) {
//                   return AnimatedBuilder(
//                     animation: _yanimation,
//                     child: child,
//                     builder: (BuildContext context, Widget child) {
//                       return Transform(
//                         child: child,
//                         transform: Matrix4.translationValues(
//                             _animation.value * width,
//                             _yanimation.value * 100,
//                             0.0),
//                       );
//                     },
//                   );
//                 },
//               )
