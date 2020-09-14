import 'package:animations/home.dart';
import 'package:animations/pages/pages.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: Home, initial: true),
  CustomRoute(
    page: AnimContainer,
    transitionsBuilder: TransitionsBuilders.slideLeft,
  ),
  CustomRoute(
    page: AnimRotate,
    transitionsBuilder: TransitionsBuilders.slideBottom,
  ),
  CustomRoute(
    page: AnimTranslate,
    fullscreenDialog: false,
    transitionsBuilder: TransitionsBuilders.slideRight,
  ),
  CustomRoute(
    page: AnimScale,
    transitionsBuilder: TransitionsBuilders.slideTop,
  ),
  CustomRoute(page: AnimColor, transitionsBuilder: TransitionsBuilders.zoomIn),
  CustomRoute(
      page: AnimOpacity, transitionsBuilder: TransitionsBuilders.fadeIn),
  CustomRoute(page: AnimStack, transitionsBuilder: TransitionsBuilders.fadeIn)
])
class $Router {}
