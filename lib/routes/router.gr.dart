// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:animations/home.dart';
import 'package:animations/pages/anim_container.dart';
import 'package:animations/pages/anim_rotate.dart';
import 'package:animations/pages/anim_translate.dart';
import 'package:animations/pages/anim_scale.dart';
import 'package:animations/pages/anim_color.dart';
import 'package:animations/pages/anim_opacity.dart';
import 'package:animations/pages/anim_stack.dart';

class Routes {
  static const String home = '/';
  static const String animContainer = '/anim-container';
  static const String animRotate = '/anim-rotate';
  static const String animTranslate = '/anim-translate';
  static const String animScale = '/anim-scale';
  static const String animColor = '/anim-color';
  static const String animOpacity = '/anim-opacity';
  static const String animStack = '/anim-stack';
  static const all = <String>{
    home,
    animContainer,
    animRotate,
    animTranslate,
    animScale,
    animColor,
    animOpacity,
    animStack,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.home, page: Home),
    RouteDef(Routes.animContainer, page: AnimContainer),
    RouteDef(Routes.animRotate, page: AnimRotate),
    RouteDef(Routes.animTranslate, page: AnimTranslate),
    RouteDef(Routes.animScale, page: AnimScale),
    RouteDef(Routes.animColor, page: AnimColor),
    RouteDef(Routes.animOpacity, page: AnimOpacity),
    RouteDef(Routes.animStack, page: AnimStack),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    Home: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Home(),
        settings: data,
      );
    },
    AnimContainer: (RouteData data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            AnimContainer(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeft,
      );
    },
    AnimRotate: (RouteData data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => AnimRotate(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideBottom,
      );
    },
    AnimTranslate: (RouteData data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            AnimTranslate(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideRight,
        fullscreenDialog: false,
      );
    },
    AnimScale: (RouteData data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => AnimScale(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideTop,
      );
    },
    AnimColor: (RouteData data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => AnimColor(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.zoomIn,
      );
    },
    AnimOpacity: (RouteData data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => AnimOpacity(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    AnimStack: (RouteData data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => AnimStack(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
  };
}
