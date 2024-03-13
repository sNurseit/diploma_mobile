import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/models/auth_model.dart';
import '../../theme/app_button_style.dart';


class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
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
        create: (_)=>AuthModel(),
        child: const _FormWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {

    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
             Text("Log in"),
             SizedBox(height: 20.0,),
              InputLoginWidget(),
             SizedBox(height: 12.0,),
              InputPasswordWidget(),
             SizedBox(height: 12.0,),
            LoginButtonWidget(),
          ],
        ),
    );
  }
}


class InputLoginWidget extends StatelessWidget {
  const InputLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<AuthModel>();
    return  TextField(
      controller: model.loginTextController,
      decoration: InputStyle.inputLoginDecorator,
    );
  }
}



class InputPasswordWidget extends StatelessWidget {
  const InputPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<AuthModel>();

    return  TextField(
      decoration: InputStyle.inputPasswordDecorator,
      obscureText: true,
      controller: model.passwordTextController,
    );
  }
}


class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<AuthModel>();

    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed:()=>model.auth(context),
        style: AbbButtonStyle.linkButton,
        child: const Text('Login'),
      ),
    );
  }
}

