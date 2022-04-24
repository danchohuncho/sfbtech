import 'package:flutter/material.dart';
import 'package:sfbtech/ui/navigation/main_navigation.dart';

import '../themes/app_theme.dart';

class MyApp extends StatelessWidget {
  final mainNavigation = MainNavigation();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SFB tech',
      theme: AppTheme.light,
      routes: mainNavigation.routes,
      onGenerateRoute: mainNavigation.onGenerateRoute,
    );
  }
}
