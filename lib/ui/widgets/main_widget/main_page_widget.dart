
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:diplom_work_mobile/ui/router/router.dart';
import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

@RoutePage()
class MainPageWidget extends StatefulWidget {
  const MainPageWidget({Key? key}) : super(key: key);

  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {

  void onSelectTab(int index, TabsRouter tabsRouter){
    tabsRouter.setActiveIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
        routes:  const [
          HomeRouteWidget(),
          SearchRouteWidget(),
          TrainingRouteWidget(),
          ProfileRouteWidget(),
        ],
    builder: (context, child){
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white.withOpacity(0.8),
              selectedItemColor: AppColors.selectedBottomNavigationItem,
              unselectedItemColor: AppColors.unSelectedBottomNavigationItem,
              currentIndex: tabsRouter.activeIndex,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              elevation: 0,
              landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
              items:  const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    activeIcon: Icon(Icons.home, weight: 0.01,),
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
              onTap: (index) => onSelectTab(index, tabsRouter),
            ),
          );
      }
    );
  }
}
