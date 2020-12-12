import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_arc/provider_setup.dart';
import 'package:provider_arc/ui/router.dart';
import 'package:provider_arc/ui/shared/app_colors.dart';

import 'core/constants/app_contstants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quiz - Origem das montadoras',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: primaryColor,
          accentColor: secondaryColor,
          fontFamily: 'Roboto',
          buttonTheme: ButtonThemeData(
            buttonColor: primaryColor,
            textTheme: ButtonTextTheme.primary,
          ),
        ),
        initialRoute: RoutePaths.Home,
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
