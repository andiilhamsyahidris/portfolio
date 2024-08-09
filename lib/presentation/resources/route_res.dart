import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/presentation/features/main/main_screen.dart';
import 'package:portfolio/presentation/features/project/project_screen.dart';
import 'package:portfolio/presentation/resources/string_res.dart';

class AppRoutes {
  static const String mainRoute = '/main';
  static const String projectRoute = '/project';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case AppRoutes.projectRoute:
        return MaterialPageRoute(builder: (_) => const ProjectScreen());
      default:
        return unDefinedRoute();
    }
  }
}

Route<dynamic> unDefinedRoute() {
  return MaterialPageRoute(
      builder: (_) => Scaffold(
            appBar: AppBar(
              title: Text(StringResMain.noRouteFoundTitle.tr()),
            ),
            body: Center(child: Text(StringResMain.noRouteFoundTitle.tr())),
          ));
}
