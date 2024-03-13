import 'package:diplom_work_mobile/domain/services/course_service.dart';
import 'package:diplom_work_mobile/ui/widgets/course_details_widget/course_details_page_widget.dart';
import 'package:flutter/cupertino.dart';

import '../entity/Course.dart';


class CourseDetailsModel extends ChangeNotifier{
  CourseDetailsWidgetConfiguration configuration;
  final _courseService = CourseService();
  late final Course course;


  CourseDetailsModel({required this.configuration}){
    _setup();
  }

  void _setup() async {
    course = (await _courseService.getOneCourse(configuration.courseId));
    notifyListeners();
  }
}