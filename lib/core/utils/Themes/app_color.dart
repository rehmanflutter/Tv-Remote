import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xff2196FF);
  static const Color red = Color(0xffdb4f4e);

  static const Color green = Color(0xff2cba64);
  static const Color yello = Color(0xffdbdd20);
  static const Color blue = Color(0xff4974DD);
  static const Color remoteColor = Color(0xff353535);

  static const Color grayColor = Colors.grey;

  static Color backgroundColor(BuildContext context) {
    return AdaptiveTheme.of(context).mode.isDark
        ? Color(0xff1e1e1e)
        : Colors.white;
  }

  static Color offBlack(BuildContext context) {
    return AdaptiveTheme.of(context).mode.isDark
        ? Color(0xff353535)
        : const Color.fromARGB(255, 237, 233, 233);
  }

  static Color offwhite(BuildContext context) {
    return AdaptiveTheme.of(context).mode.isDark
        ? const Color.fromARGB(255, 201, 191, 191)
        : Color.fromARGB(255, 121, 119, 119);
  }

  static Color black(BuildContext context) {
    return AdaptiveTheme.of(context).mode.isDark ? Colors.white : Colors.black;
  }

  static Color white(BuildContext context) {
    return AdaptiveTheme.of(context).mode.isDark ? Colors.black : Colors.white;
  }

  static Color grey(BuildContext context) {
    return AdaptiveTheme.of(context).mode.isDark
        ? Color(0xff696969)
        : Color.fromARGB(255, 178, 176, 176);
  }
}

class AppColorssss {
  static final AppColorssss _instance = AppColorssss._internal();
  static BuildContext? _context;

  // Private constructor
  AppColorssss._internal();

  factory AppColorssss() {
    return _instance;
  }

  // Set the context from your widget
  static void setContext(BuildContext context) {
    _context = context;
  }

  static Color primaryColor = const Color(0xff2196FF);
  static Color red = const Color(0xffdb4f4e);
  static Color green = const Color(0xff2cba64);
  static Color yellow = const Color(0xffdbdd20);
  static Color blue = const Color(0xff4974DD);
  static Color grayColor = Colors.grey;

  static Color backgroundColor() {
    if (_context == null) throw Exception("Context is not set");
    return AdaptiveTheme.of(_context!).mode.isDark
        ? const Color(0xff1e1e1e)
        : Colors.white;
  }

  static Color offBlack() {
    if (_context == null) throw Exception("Context is not set");
    return AdaptiveTheme.of(_context!).mode.isDark
        ? const Color(0xff353535)
        : const Color.fromARGB(255, 237, 233, 233);
  }

  static Color offWhite() {
    if (_context == null) throw Exception("Context is not set");
    return AdaptiveTheme.of(_context!).mode.isDark
        ? const Color.fromARGB(255, 201, 191, 191)
        : const Color.fromARGB(255, 121, 119, 119);
  }

  static Color black() {
    if (_context == null) throw Exception("Context is not set");
    return AdaptiveTheme.of(_context!).mode.isDark
        ? Colors.white
        : Colors.black;
  }

  static Color white() {
    if (_context == null) throw Exception("Context is not set");
    return AdaptiveTheme.of(_context!).mode.isDark
        ? Colors.black
        : Colors.white;
  }

  static Color grey() {
    if (_context == null) throw Exception("Context is not set");
    return AdaptiveTheme.of(_context!).mode.isDark
        ? const Color(0xff696969)
        : const Color.fromARGB(255, 178, 176, 176);
  }
}
