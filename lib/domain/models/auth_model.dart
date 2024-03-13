


import 'dart:async';

import 'package:diplom_work_mobile/domain/services/auth_service.dart';
import 'package:flutter/material.dart';

import '../../ui/navigation/main_navigation.dart';




class AuthModel extends ChangeNotifier{

  final loginTextController =TextEditingController();
  final passwordTextController = TextEditingController();
  final _authService = AuthService();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isAuthProgress = false;
  bool get canAuth =>!_isAuthProgress;
  bool get isAuthProgress =>_isAuthProgress;

  Future<void> auth(BuildContext context) async {
    final login= loginTextController.text;
    final password = passwordTextController.text;

    if (login.isEmpty || password.isEmpty){
      _errorMessage = 'Enter login or password';
      notifyListeners();
      return;
    }
    bool request= await _authService.login(login, password);
    if( request){
      _errorMessage = null;
      _isAuthProgress = true;
      notifyListeners();
      unawaited(Navigator.of(context).pushReplacementNamed(MainNavigationRouteNames.mainScreen));
    }
  }
}