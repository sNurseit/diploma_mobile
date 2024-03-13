import 'dart:typed_data';

import 'package:diplom_work_mobile/domain/models/course_details_model.dart';
import 'package:flutter/material.dart';

import '../../../domain/entity/Course.dart';


class CourseDetailsWidgetConfiguration{
  final int courseId;
  final String title;

  CourseDetailsWidgetConfiguration({required this.courseId, required this.title});
}


class CourseDetailsPageWidget extends StatefulWidget {
  final CourseDetailsWidgetConfiguration configuration;
  const CourseDetailsPageWidget({super.key, required this.configuration});

  @override
  State<CourseDetailsPageWidget> createState() => _CourseDetailsPageWidgetState();
}

class _CourseDetailsPageWidgetState extends State<CourseDetailsPageWidget> {

  @override
  Widget build(BuildContext context) {
    Course course = CourseDetailsModel(configuration: widget.configuration).course;

    return  Scaffold(
      body: CustomScrollView(
        slivers: <Widget> [
          SliverAppBar(
            pinned: false,
            floating: false,
            expandedHeight: 220.0,
            flexibleSpace: FlexibleSpaceBar(
              title:  Text(course.title!),
              background:Image.memory(
                Uint8List.fromList(course.imageBytes ?? []),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index){
                    return ListTile(
                      title: Text('Item $index'),
                    );
                  }
              ),
          ),
        ],
      ),
    );
  }
}
