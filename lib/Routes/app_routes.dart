import 'package:flutter/material.dart';
import 'package:remote_tv/view/Home/home_screen.dart';
import 'package:remote_tv/view/Settings/screens/legal.dart';
import 'package:remote_tv/view/Settings/screens/manage_app.dart';
import 'package:remote_tv/view/Settings/screens/manage_application.dart';
import 'package:remote_tv/view/Settings/screens/premium_access.dart';
import 'package:remote_tv/view/Settings/screens/remote_behavior.dart';
import 'package:remote_tv/view/Settings/screens/remote_layout.dart';
import 'package:remote_tv/view/Settings/setting.dart';

class AppRoutes {
  static const String homeScreen = '/HomeScreen';
  static const String settingScreen = '/SettingScreen';
  static const String remoteLayout = '/RemoteLayout';
  static const String legalScreen = '/LegalScreen';
  static const String premiumAccess = '/PremiumAccess';

  static const String manageApplication = '/ManageApplication';
  static const String remoteBehavior = '/RemoteBehavior';
  static const String manageApp = '/ManageApp';

  static Map<String, WidgetBuilder> get routes => {
        homeScreen: (_) => HomeScreen(),
        settingScreen: (_) => SettingScreen(),
        remoteLayout: (_) => RemoteLayout(),
        legalScreen: (_) => LegalScreen(),
        premiumAccess: (_) => PremiumAccess(),
        manageApplication: (_) => ManageApplication(),
        remoteBehavior: (_) => RemoteBehavior(),
        manageApp: (_) => ManageApp(),
      };
}
