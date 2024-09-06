import 'package:cats/features/cat/data/models/cat.dart';
import 'package:cats/features/cat/presentation/pages/cat_detail_page.dart';
import 'package:cats/features/cat/presentation/pages/cat_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const String catPage = '/';
  static const String catDetailPage = '/detail';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case catPage:
        return MaterialPageRoute(builder: (_) => const CatPage());
      case catDetailPage:
        final cat = settings.arguments as Cat;
        return MaterialPageRoute(
            builder: (_) => CatDetailPage(
                  cat: cat,
                ));

      default:
        return MaterialPageRoute(builder: (_) => const CatPage());
    }
  }
}
