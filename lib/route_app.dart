import 'package:flutter/material.dart';
import 'package:news_app/presentation/screens/navigation_bar_screen.dart';
import 'package:news_app/presentation/screens/search_screen.dart';
import 'package:news_app/presentation/screens/web_screen.dart';
import 'package:news_app/strings.dart';

class RouteApp {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Web_Screen:
        return MaterialPageRoute(builder: (_) =>  WebScreen(url: settings.arguments));
      case Search_Screen:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case Navigation_Bar_Screen:
        return MaterialPageRoute(builder: (_) => const NavigationBarScreen());
    }
  }
}
