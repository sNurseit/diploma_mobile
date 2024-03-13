import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/models/home_model.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0.5),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
        title: const Text('OQY'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),
      body: _ListCourses.create(),
    );
  }
}

class _ListCourses extends StatelessWidget {
  const _ListCourses({Key? key}) : super(key: key);

  static Widget create() {
    return ChangeNotifierProvider.value(
      value: HomeModel(),
      child: const _ListCourses(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final courses = Provider.of<HomeModel>(context).model;
    final _model = Provider.of<HomeModel>(context);

    final width = MediaQuery.of(context).size.width-40;
    final height = width*9/16;
    if (courses == null || courses.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (BuildContext context, int index) {
        final course = courses[index];

        return Padding(

          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: GestureDetector(
            onTap: ()=>_model.navigateToCourseDetails(context, course.id, course.title),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.memory(
                      course.imageBytes,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(11),
                  child: Text(
                    course.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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



