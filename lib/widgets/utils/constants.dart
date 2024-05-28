import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppColor {
  // final primaryColor = const Color(0xFF1b9fb7);
  final primaryColor = Colors.amber;

  // final theme = SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Colors.blue,
  //   statusBarBrightness: Brightness.light,
  // ));
  // final themeYellow =
  //     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Colors.amber,
  //   statusBarBrightness: Brightness.light,
  // ));
  static void setBlueStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.blue,
      statusBarBrightness: Brightness.light,
    ));
  }

  static void setAmberStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.amber,
      statusBarBrightness: Brightness.light,
    ));
  }
}
