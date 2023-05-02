import 'package:flutter/material.dart';
import 'package:myapp/pages/home_view/view/home_view.dart';

class AppRoutes {
  Route? onGenerateRoute(RouteSettings s) {
    var args = s.arguments;
    switch (s.name) {
      case "/home":
        return MaterialPageRoute(builder: (context) => HomeView());
    }
  }
}
