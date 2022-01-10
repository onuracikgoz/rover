import 'package:flutter/material.dart';
import 'package:rover/core/config/path_config.dart';

class AppConfig {
  static const Color primaryColor = Colors.white;
  static const Color secondaryColor = Colors.deepOrangeAccent;
}

class IconConstant {
  static IconConstant? _instance;
  static IconConstant get instance => _instance ??= IconConstant._initialize();

  final String _asset = "assets/svg";

  final String logo = PathConfig.svgPath + "logo.svg";
  final String ship_1 = PathConfig.svgPath + "ship1.svg";
  final String ship_2 = PathConfig.svgPath + "ship2.svg";
  final String ship_3 = PathConfig.svgPath + "ship3.svg";
  final String facebook = PathConfig.svgPath + "facebook.svg";
  IconConstant._initialize();
}
