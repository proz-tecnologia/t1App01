import 'package:first_app/design_system/my_color.dart';
import 'package:first_app/design_system/text_theme.dart';
import 'package:first_app/features/authentication/login_page.dart';
import 'package:first_app/features/authentication/splash.dart';
import 'package:first_app/features/home/home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      home: const SplashPage(),
      routes: {
        'splash': (context) => const SplashPage(),
        'login': (context) => const LoginPage(),
        'home': (context) => const HomePage(title: 'Cindi'),
      },
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
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFC82C),
            fixedSize: const Size.fromHeight(30),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xFFFFC82C),
          side: const BorderSide(color: Color(0xFFFFC82C)),
        )),
      ),
    );
  }
}
