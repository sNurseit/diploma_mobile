import 'package:flutter/material.dart';

abstract class AbbButtonStyle{
  static final  linkButton = ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.0),
      ),
    ),
      backgroundColor: MaterialStateProperty
          .all<Color>(const Color.fromRGBO(48,123,166,100)),
      textStyle: MaterialStateProperty
          .all(const TextStyle(
          color: Colors.white,
          fontSize: 16,

        ),
      ),
    );
}


abstract class InputStyle{
  static const inputPasswordDecorator =  InputDecoration(
    border:OutlineInputBorder(
      borderSide: BorderSide.none,
        borderRadius:BorderRadius.all(Radius.circular(7.0))
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
    focusColor: Colors.red,
    labelText: "Password",
    labelStyle: TextStyle(
      color: Color.fromRGBO(64, 58, 75, 60)
    ),
    filled: true,
    fillColor: Color.fromRGBO(248, 241, 255, 100),

  );

  static const inputLoginDecorator =  InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
    filled: true,
    fillColor: Color.fromRGBO(248, 241, 255, 100),
    border:OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius:BorderRadius.all(Radius.circular(7.0))
    ),
    focusColor: Colors.red,
    labelText: "Email",
    labelStyle: TextStyle(
        color: Color.fromRGBO(64, 58, 75, 60)
    ),
  );
}