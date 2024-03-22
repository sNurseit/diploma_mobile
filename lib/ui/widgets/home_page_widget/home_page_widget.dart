import 'dart:convert';
import 'dart:typed_data';

import 'package:auto_route/annotations.dart';
import 'package:diplom_work_mobile/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import '../../../domain/models/home_model.dart';

@RoutePage()
class HomePageWidget extends StatelessWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, 
        backgroundColor: AppColors.mainBlueColor,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
        title: const Text('OQY'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_outlined)),
        ],
      ),
      backgroundColor: Color.fromRGBO(242, 242, 242, 1.0),
      body: _ListCourses.create(),
    );
  }
}

class _ListCourses extends StatelessWidget {
  const _ListCourses({Key? key}) : super(key: key);

  static Widget create() {
    return ChangeNotifierProvider.value(
      value: HomeModel(),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: const _ListCourses()
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final courses = Provider.of<HomeModel>(context).model;
    final model = Provider.of<HomeModel>(context);
    final width = MediaQuery.of(context).size.width;
    final height = width*9/16;

    if (courses == null || courses.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(

      itemCount: courses.length,
      itemBuilder: (BuildContext context, int index) {
        final course = courses[index];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: GestureDetector(
            onTap: ()=>model.navigateToCourseDetails(context, course.id, course.title),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height,
                  width: width,
                  decoration: const BoxDecoration(
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(12), topLeft: Radius.circular(12)),
                    child: Image.memory(
                      course.imageBytes,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12)),
                  child: Container(
                    color: AppColors.mainLightColor,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(

                                  course.title,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.fontDark,

                                  ),
                                ),
                                const SizedBox(height: 4,),
                                Text(
                                  course.description,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.fontMid
                                  ),
                                ),
                                const SizedBox(height: 8,),
                                Row(
                                  children: [
                                    RatingBarIndicator(
                                      rating: course.averageRating,
                                      itemBuilder: (context, index) => const Icon(
                                        Icons.star,
                                        color: AppColors.mainBlueColor,
                                      ),
                                      itemCount: 5,
                                      itemSize: 24.0,
                                      direction: Axis.horizontal,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Text('${course.price}',
                            style: const TextStyle(
                              color: AppColors.mainBlueColor,
                              fontSize: 18,

                            ),
                          ),
                        ],

                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}



