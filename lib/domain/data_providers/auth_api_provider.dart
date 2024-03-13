import 'package:dio/dio.dart';

import '../api/api_const.dart';

class AuthApiProvider{

  final dio = Dio();
  Future<Map<String,dynamic>?> login(String login, String password) async{
      const url ="http://10.0.2.2:8000/gateway/auth/token";
      Response response;
      response = await dio.post(
          url,
          data: {'email': login, 'password': password}
      );
      print(response.data);
      return response.data;


  }
}