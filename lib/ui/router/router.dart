
import 'package:auto_route/auto_route.dart';
import 'package:diplom_work_mobile/ui/widgets/auth/auth_page_widget.dart';
import 'package:diplom_work_mobile/ui/widgets/main_widget/main_page_widget.dart';

import '../widgets/home_page_widget/home_page_widget.dart';
import '../widgets/profile_page_widget/profile_page_widget.dart';
import '../widgets/search_page_widget/search_page_widget.dart';
import '../widgets/training/training_page_widget.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter{
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: AuthRouteWidget.page,
      path: '/auth',
    ),
    AutoRoute(
      page: MainRouteWidget.page,
      path: '/',
      children: [
        AutoRoute(
          page: HomeRouteWidget.page,
          path: 'home',
        ),
        AutoRoute(
          page: SearchRouteWidget.page,
          path: 'search',
        ),
        AutoRoute(
          page: TrainingRouteWidget.page,
          path: 'training',
        ),
        AutoRoute(
          page: ProfileRouteWidget.page,
          path: 'profile',
        ),
      ]
    ),
  ];
}