import 'package:first_app/design_system/my_color.dart';
import 'package:first_app/design_system/text_theme.dart';
import 'package:flutter/material.dart';

import 'features/authentication/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
          brightness: Brightness.light,
          appBarTheme: const AppBarTheme(backgroundColor: MyColor.success),
          scaffoldBackgroundColor: const Color(0xFF262D2A),
          textTheme: MyTexTheme.myTheme,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color(0xFFBAC9D4),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFBAC9D4),
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFBAC9D4),
              ),
            ),
          )),
      home: const SplashPage(),
    );
  }
}
