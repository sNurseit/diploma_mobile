import 'package:diplom_work_mobile/ui/widgets/course_details_widget/course_details_page_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/auth/auth_page_widget.dart';
import '../widgets/main_widget/main_page_widget.dart';




abstract class MainNavigationRouteNames{
  static const authScreen = 'auth';
  static const registerScreen = 'register';
  static const mainScreen = '/';
  static const courseDetails = '/course_details';
}


class MainNavigation{
  String initialRoute() =>MainNavigationRouteNames.authScreen;

  final routes = <String,Widget Function(BuildContext)>{
    MainNavigationRouteNames.authScreen: (context) => const AuthPageWidget(),
    MainNavigationRouteNames.mainScreen: (context) => const MainPageWidget(),
    MainNavigationRouteNames.registerScreen: (context) => const MainPageWidget(),
  };

  Route<Object> onGenerateRoute(RouteSettings settings){
    switch (settings.name){
      case MainNavigationRouteNames.courseDetails:
        final arguments = settings.arguments;
        final configuration = arguments as CourseDetailsWidgetConfiguration;
        return MaterialPageRoute(builder: (context) =>CourseDetailsPageWidget(configuration: configuration));
      default:
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (context) => widget);
    };
  }


}