import 'package:diplom_work_mobile/ui/widgets/course_details_widget/course_details_page_widget.dart';
import 'package:flutter/material.dart';

import '../../ui/navigation/main_navigation.dart';
import '../entity/Course.dart';
import '../services/course_service.dart';

class HomeModel extends ChangeNotifier {
  final _courseService =CourseService();
  List<Course> _model = [];
  get model=>_model;

  HomeModel(){
    getAllCourses();
  }
  Future<void> getAllCourses()async {
    _model = (await _courseService.getAllCourses())!;
    notifyListeners();
  }

  void navigateToCourseDetails (BuildContext context, int index, String title) {
    final configuration = CourseDetailsWidgetConfiguration(courseId: index, title: title);
    Navigator.of(context).pushNamed(MainNavigationRouteNames.courseDetails,arguments: configuration);
  }

}