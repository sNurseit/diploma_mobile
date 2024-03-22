import 'package:auto_route/annotations.dart';
import 'package:diplom_work_mobile/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/models/auth_model.dart';
import '../../theme/app_button_style.dart';

@RoutePage()
class AuthPageWidget extends StatefulWidget {
  const AuthPageWidget({super.key});

  @override
  State<AuthPageWidget> createState() => _AuthPageWidgetState();
}

class _AuthPageWidgetState extends State<AuthPageWidget> {
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
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
             Text(
               "Sign in",
               style: TextStyle(
                 fontSize: 40,
                 fontWeight: FontWeight.w600,
                 fontFamily: AppFonts.mainFont
               ),
             ),
             SizedBox(height: 25.0,),
              _InputLoginWidget(),
             SizedBox(height: 25.0,),
              _InputPasswordWidget(),
             SizedBox(height: 20.0,),
            _RedirectToRegister(),
            SizedBox(height: 25.0,),

            _LoginButtonWidget(),
          ],
        ),
    );
  }
}


class _InputLoginWidget extends StatelessWidget {
  const _InputLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<AuthModel>();
    return  TextField(
      controller: model.loginTextController,
      decoration: InputStyle.inputLoginDecorator,
      style: const TextStyle(fontSize: 18),
    );
  }
}



class _InputPasswordWidget extends StatelessWidget {
  const _InputPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<AuthModel>();

    return  TextField(
      decoration: InputStyle.inputPasswordDecorator,
      obscureText: true,
      controller: model.passwordTextController,
      style: const TextStyle(fontSize: 18),
    );
  }
}



class _RedirectToRegister extends StatelessWidget {
  const _RedirectToRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      width: double.infinity,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              "If you don't have an account",
              style: TextStyle(
                fontSize: 14,
                fontFamily: AppFonts.mainFont,
              ),
            ),
            GestureDetector(
              onTap: ()=>{},
              child: const Text(
                "Register",
                style: TextStyle(
                  fontFamily: AppFonts.mainFont,
                  color: AppColors.loginButtonColor,
                  fontSize: 14,
                ),
              ),
            ),
          ]
      ),
    );
  }
}


class _LoginButtonWidget extends StatelessWidget {
  const _LoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<AuthModel>();

    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed:()=>model.auth(context),
        style: AppButtonStyle.linkButton,

        child: const Padding(
          padding:  EdgeInsets.all(16.0),
          child:  Text(
            'Log In',
            style: TextStyle(
                fontSize: 18,
                fontFamily: AppFonts.mainFont
            ),
          ),
        ),
      ),
    );
  }
}

