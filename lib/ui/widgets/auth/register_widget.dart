

import 'package:diplom_work_mobile/domain/models/register_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<RegisterWidget> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body:Center(
            child: _FormWidget.create()
        )
    );
  }
}

class _FormWidget extends StatelessWidget {
  const _FormWidget({super.key});

  static Widget create(){
    return ChangeNotifierProvider(
      create: (_)=>RegisterModel(),
      child: const _FormWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          const Text(
            "Log in",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                fontFamily: "GothicA1"
            ),
          ),
          // SizedBox(height: 25.0,),
          // _InputLoginWidget(),
          // SizedBox(height: 25.0,),
          // _InputPasswordWidget(),
          // SizedBox(height: 20.0,),
          // _RedirectToLogin(),
          // SizedBox(height: 25.0,),
          // _LoginButtonWidget(),
        ],
      ),
    );
  }
}