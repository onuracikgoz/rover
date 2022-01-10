import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rover/core/config/app_config.dart';

class AppTheme {
  AppTheme._();


  static final TextTheme darkTextTheme = TextTheme(
    headline1: TextStyle(
      fontFamily: "Roboto",
      fontSize: 24.sp,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    headline2:
        TextStyle(fontFamily: "Roboto", fontSize: 22.sp, color: Colors.black),
    headline3:
        TextStyle(fontFamily: "Roboto", fontSize: 20.sp, color: Colors.black),
    headline4:
        TextStyle(fontFamily: "Roboto", fontSize: 18.sp, color: Colors.black),
    headline5:
        TextStyle(fontFamily: "Roboto", fontSize: 16.sp, color: Colors.black),
    headline6:
        TextStyle(fontFamily: "Roboto", fontSize: 14.sp, color: Colors.black),
    subtitle1:
        TextStyle(fontFamily: "Roboto", fontSize: 14.sp, color: Colors.black),
    subtitle2:
        TextStyle(fontFamily: "Roboto", fontSize: 14.sp, color: Colors.black),
    bodyText1: TextStyle(
        fontFamily: "Roboto", fontSize: 12.sp, color: Color(0xffACACAC)),
    bodyText2:
        TextStyle(fontFamily: "Roboto", fontSize: 16.sp, color: Colors.black),
      
    button: TextStyle(
      fontFamily: "Roboto",
      fontSize: 20.sp,
      
      color: Colors.white,
      fontWeight: FontWeight.normal,
    ),
    caption: TextStyle(
        fontFamily: "Roboto", fontSize: 10.sp, color: const Color(0xffACACAC)),
    overline:
        TextStyle(fontFamily: "Roboto", fontSize: 12.sp, color: Colors.black),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: "Roboto",
    brightness: Brightness.light,
    
    dialogBackgroundColor: Colors.white,
    primaryColor:  AppConfig.primaryColor,

    
  
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
    ),
    cardTheme: const CardTheme(color: Color(0xffffffff)),
    
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.white,
      circularTrackColor: AppConfig.secondaryColor,
      linearTrackColor: AppConfig.secondaryColor,
      linearMinHeight: 3,
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontFamily: "Roboto",
        color: Colors.black,
      ),
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: Color(0xff000000),
        size: 20,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xff000000),
      size: 20,
    ),
    
  
    highlightColor: Colors.white,
    textTheme: darkTextTheme,
    
    inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: AppConfig.secondaryColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1, color: AppConfig.secondaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: AppConfig.secondaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Color(0xffef4765)),
        ),
        errorStyle: TextStyle(color: Color(0xffef4765))),
    dividerColor: const Color(0xffd1d1d1),
    errorColor: const Color(0xffef4765),
    cardColor: const Color(0xff282a2b),
    splashColor: Colors.white,
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateColor.resolveWith((states) => Colors.white),
      fillColor:
          MaterialStateColor.resolveWith((states) => AppConfig.secondaryColor),
    ),
    canvasColor: AppConfig.primaryColor,

    
    snackBarTheme: SnackBarThemeData(backgroundColor: AppConfig.secondaryColor,contentTextStyle: TextStyle(color: Colors.white)),
  
    
    
  );

  static ThemeData getThemeFromThemeMode() {
    return darkTheme;
  }
}
