



import 'dart:ui';


import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../home_page_widget/home_page_widget.dart';
import '../search_page_widget/search_page_widget.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {

  int _selectedTab = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePageWidget(),
    const SearchPageWidget(),
    const Text('third'),
    const Text('fourth')
  ];

  void onSelectTab(int index){
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blue.withOpacity(0.5),
      //   titleTextStyle: const TextStyle(
      //     color: Colors.black,
      //     fontSize: 26,
      //     fontWeight: FontWeight.bold
      //   ),
      //   title: const Text('OQY'),
      //   actions: [
      //     IconButton(onPressed: (){}, icon: const Icon(Icons.notifications),)
      //   ],
      // ),z
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter:ImageFilter.blur(sigmaX: 30, sigmaY: 30, ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,

            backgroundColor: Colors.white.withOpacity(0.1),
            selectedItemColor: AppColors.selectedBottomNavigationItem,
            unselectedItemColor: AppColors.unSelectedBottomNavigationItem,
            currentIndex: _selectedTab,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            elevation: 0,
            landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
            items:  const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'Home'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                  label: 'Search',
                  activeIcon: Icon(Icons.search_rounded),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book_outlined),
                  activeIcon: Icon(Icons.menu_book_rounded),
                  label: 'My Training'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                  activeIcon: Icon(Icons.account_circle),
                label: 'Account'
              )
            ],
            onTap: onSelectTab,

          ),
        ),
      ),

      body:IndexedStack(
          index: _selectedTab,
          children: _widgetOptions
      ),
    );
  }
}
