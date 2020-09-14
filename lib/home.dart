import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String text =
      'There are a number of built-in animated widgets in Flutter. Below are some implementations of them like AnimatedContainer, AnimatedBuilder, Tween animations etc.';
  ScrollController _scrollController;
  bool sliverCollapsed = false;
  static const List<String> names = [
    'Animated Container',
    'Rotation Animation',
    'Translation Animation',
    'Scale \nAnimation',
    'Color & Shape Animation',
    'Opacity Animation',
    'Padding Animation',
    'Stack Animation',
  ];

  static const List<String> pages = [
    '/anim-container',
    '/anim-rotate',
    '/anim-translate',
    '/anim-scale',
    '/anim-color',
    '/anim-opacity',
    '/anim-rotate',
    '/anim-stack'
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.offset > 80 &&
          !_scrollController.position.outOfRange) {
        if (!sliverCollapsed) {
          //print('Collapsed');
          sliverCollapsed = true;
          setState(() {});
        }
      }
      if (_scrollController.offset <= 220 &&
          !_scrollController.position.outOfRange) {
        if (sliverCollapsed) {
          //print('not collapsed');
          sliverCollapsed = false;
          setState(() {});
        }
      }
    });
  }

  Widget flexiblespacebar() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.parallax,
      background: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(20.0),
                  bottomStart: Radius.circular(20.0)),
              color: Colors.red),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: height * 0.08,
                    left: width * 0.05,
                    right: width * 0.05),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Animations\nin Flutter',
                    style: GoogleFonts.lobsterTwo(
                        fontSize: MediaQuery.of(context).textScaleFactor * 50,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: height * 0.02,
                    left: width * 0.05,
                    right: width * 0.05),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    text,
                    style: GoogleFonts.cairo(
                        fontSize: MediaQuery.of(context).textScaleFactor * 20,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, isScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.48,
              elevation: 12.0,
              floating: false,
              pinned: true,
              //backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.only(
                      bottomEnd: Radius.circular(20.0),
                      bottomStart: Radius.circular(20.0))),
              flexibleSpace: sliverCollapsed
                  ? FlexibleSpaceBar(
                      title: Text('Animations in Flutter'),
                      centerTitle: true,
                    )
                  : flexiblespacebar(),
            ),
          ];
        },
        body: GridView.builder(
          padding: EdgeInsets.all(10.0),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              splashColor: Colors.black,
              borderRadius: BorderRadius.circular(25.0),
              onTap: () {
                ExtendedNavigator.root.pushNamed(pages[index]);
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Text(
                  '${names[index]}',
                  style: TextStyle(fontSize: 22.0, color: Colors.white),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(25.0)),
              ),
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            crossAxisCount: 2,
          ),
          itemCount: 8,
        ),
      ),
    );
  }
}
