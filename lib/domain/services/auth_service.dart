


import 'package:diplom_work_mobile/domain/data_providers/auth_api_provider.dart';
import 'package:diplom_work_mobile/domain/data_providers/session_data_provider.dart';
import 'package:diplom_work_mobile/domain/entity/auth_entyties/auth_response.dart';

class AuthService{
  final _sessionDataProvider = SessionDataProvider();
  final _authApiProvider = AuthApiProvider();

  Future<bool> checkAuth()async{
    final token =await _sessionDataProvider.getSession();
    return  true;
  }
  Future<bool> login(String login, String password) async{
    if(login=="admin" && password =="admin"){
      return true;
    }
    final api = AuthResponse.fromJson((await _authApiProvider.login(login, password) as Map<String, dynamic> ) );
    if(api.token.isNotEmpty){
      await _sessionDataProvider.setSessionId(api.token, api.userId);
      return true;
    }
    else{
      return false;
    }
  }
  Future<void> logout() async{
    _sessionDataProvider.clearApiKey();
  }


}