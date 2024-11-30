import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remote_tv/Routes/app_routes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// flutter pub run easy_localization:generate -S "assets/languages" -O "lib/localization" -f keys

//   App version   =   3.24.3

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await EasyLocalization.ensureInitialized();

//   runApp(EasyLocalization(
//     supportedLocales: const [Locale('en'), Locale('ar')],
//     path: 'assets/languages',
//     fallbackLocale: const Locale('en'),
//     child: MyApp(),
//   ));
// }

import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/languages',
        fallbackLocale: const Locale('en'),
        child: MyApp(),
      ), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
          .copyWith(statusBarColor: Colors.transparent));
      return AdaptiveTheme(
          light: ThemeData.light(useMaterial3: true),
          dark: ThemeData.dark(useMaterial3: true),
          initial: AdaptiveThemeMode.light,
          builder: (theme, darkTheme) {
            // if (AdaptiveTheme.of(context).mode.isDark) {
            //   SystemChrome.setSystemUIOverlayStyle(
            //     SystemUiOverlayStyle.light.copyWith(
            //       statusBarColor: const Color.fromARGB(0, 241, 89, 89),
            //     ),
            //   );
            // } else {
            //   SystemChrome.setSystemUIOverlayStyle(
            //     SystemUiOverlayStyle.dark.copyWith(
            //       statusBarColor: const Color.fromARGB(0, 241, 89, 89),
            //     ),
            //   );
            // }
            return MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme: theme,
              darkTheme: darkTheme,
              initialRoute: AppRoutes.homeScreen,
              routes: AppRoutes.routes,
              title: 'Remote TV',
              debugShowCheckedModeBanner: false,
            );
          });
    });
  }
}
