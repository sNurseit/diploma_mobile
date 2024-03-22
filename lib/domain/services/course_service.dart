

import 'dart:convert';
import 'package:dio/dio.dart';
import '../api/api_const.dart';
import '../data_providers/session_data_provider.dart';
import '../entity/Course.dart';

class CourseService {
    late  Dio _dio = Dio();
    final String GET_ALL_COURSES = ApiClientConstants.GET_ALL_COURSES;
    final String GET_ONE_COURSE = ApiClientConstants.GET_ONE_COURSE;

    Future<List<Course>?> getAllCourses() async {
        final String? token = await SessionDataProvider().getToken();
        _dio.options.headers['Authorization'] = token;
        try {
            Response response = await _dio.get(GET_ALL_COURSES);
            if (response.statusCode == 200) {
                List<Course> courses = (response.data['content'] as List)
                    .map((courseJson) => Course.fromJson(courseJson))
                    .toList();
                return courses;
            } else {
                throw Exception('Failed to load content. Status code: ${response.statusCode}');
            }
        } catch (error) {
            print('Error in CourseService: $error');
            throw Exception('Failed to make the request: $error');
        }
    }

    Future<Course> getOneCourse(int courseId) async {
        final String? token = await SessionDataProvider().getToken();
        _dio.options.headers['Authorization'] = token;

        try {
            Response response = await _dio.get('$GET_ONE_COURSE/$courseId');
            if (response.statusCode == 200) {
                Course course = Course.fromJson(response.data);
                return course;
            } else {
                throw Exception('Failed to load content. Status code: ${response.statusCode}');
            }
        } catch (error) {
            print('Error in CourseService: $error');
            throw Exception('Failed to make the request: $error');
        }
    }

}
