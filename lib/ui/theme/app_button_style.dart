import 'package:flutter/material.dart';

abstract class AppButtonStyle{
  static final  linkButton = ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(60.0),
      ),
    ),

      backgroundColor: MaterialStateProperty
          .all<Color>(const Color.fromRGBO(48, 123, 166, 1)),
      textStyle: MaterialStateProperty
          .all(const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
}

abstract class AppFonts{
  static const mainFont = 'GothicA1';

}

abstract class InputStyle{

  static final inputLoginDecorator =  InputDecoration(
    contentPadding: const EdgeInsets.symmetric(horizontal: 17,vertical: 20),
    filled: false,
    border:  OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(6.0),
    ),
    labelText: "Email",
    labelStyle: const TextStyle(
        color: Color.fromRGBO(64, 58, 75, 60)
    ),
  );

  static final inputPasswordDecorator =  InputDecoration(
    filled: false,
    border:  OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(6.0),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 17,vertical: 20),
    labelText: "Password",
    labelStyle: const TextStyle(
      color:  Color.fromRGBO(64, 58, 75, 60)
    ),

  );


}