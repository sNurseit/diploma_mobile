import 'package:flutter/material.dart';
import '../../navigation/main_navigation.dart';
import '../../router/router.dart';

class MyApp extends StatefulWidget{
  static final mainNavigation = MainNavigation();

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      title: "Oqy",
      theme: ThemeData.light(),
      routerConfig: _appRouter.config(),
    );
  }
}