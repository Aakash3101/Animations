import 'package:flutter/material.dart';

class AnimContainer extends StatefulWidget {
  @override
  _AnimContainerState createState() => _AnimContainerState();
}

class _AnimContainerState extends State<AnimContainer> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Animated Container'),
          backgroundColor: Colors.red,
        ),
        body: GestureDetector(
          onTap: () {
            setState(() {
              selected = !selected;
            });
          },
          child: Center(
            child: AnimatedContainer(
              width: selected ? 250.0 : 200.0,
              height: selected ? 200.0 : 500.0,
              color: selected ? Colors.red : Colors.black,
              alignment:
                  selected ? Alignment.center : AlignmentDirectional.topCenter,
              duration: Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: FlutterLogo(size: 75),
            ),
          ),
        ));
  }
}
