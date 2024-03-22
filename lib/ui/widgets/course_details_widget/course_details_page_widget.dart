import 'dart:typed_data';
import 'package:diplom_work_mobile/domain/models/course_details_model.dart';
import 'package:diplom_work_mobile/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../domain/entity/Course.dart';

class CourseDetailsWidgetConfiguration{
  final int courseId;
  final String title;
  CourseDetailsWidgetConfiguration({required this.courseId, required this.title});
}

class CourseDetailsPageWidget extends StatelessWidget {
  final CourseDetailsWidgetConfiguration configuration;

  const CourseDetailsPageWidget({Key? key, required this.configuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder<Course>(
        future: CourseDetailsModel(configuration: configuration).courseFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final Course course = snapshot.data!;
            return CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  pinned: true,
                  forceElevated: true,
                  floating: false,
                  expandedHeight: 250.0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(course.title ?? "",
                        maxLines: 1,
                        style: const TextStyle(
                            color: AppColors.fontDark,
                          fontSize: 16
                        ),

                    ),
                    background: Image.memory(
                      Uint8List.fromList(course.imageBytes ?? []),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return ListTile(
                        title: Text('Item $index'),
                      );
                    },
                    childCount: 40,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

