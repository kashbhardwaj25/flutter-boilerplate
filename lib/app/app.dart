import 'package:flutter_boilerplate/routes/app_router.dart';
import 'package:flutter_boilerplate/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/utils/themes/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taskaide',
      theme: Themes.defaultTheme,
      initialRoute: Routes.splash,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
