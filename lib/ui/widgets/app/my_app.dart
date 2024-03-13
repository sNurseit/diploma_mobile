import 'package:flutter/material.dart';

import '../../navigation/main_navigation.dart';




class MyApp extends StatelessWidget{
  static final mainNavigation = MainNavigation();

  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,

          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.white,
              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.grey
          )
      ),
      routes:mainNavigation.routes,
      initialRoute: mainNavigation.initialRoute(),
      onGenerateRoute: mainNavigation.onGenerateRoute,

    );
  }

}