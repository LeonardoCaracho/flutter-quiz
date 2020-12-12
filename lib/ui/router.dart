import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider_arc/core/constants/app_contstants.dart';
import 'package:provider_arc/ui/views/Home/home_view.dart';
import 'package:provider_arc/ui/views/quiz/quiz_view.dart';
import 'package:provider_arc/ui/views/result/result_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RoutePaths.Home:
        return MaterialPageRoute(builder: (_) => HomeView());
      case RoutePaths.Quiz:
        return MaterialPageRoute(builder: (_) => QuizView());
      case RoutePaths.Result:
        return MaterialPageRoute(
          builder: (_) => ResultView(
            finalScore: args,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
