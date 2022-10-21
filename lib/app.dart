import 'package:first_app/design_system/my_color.dart';
import 'package:first_app/design_system/text_theme.dart';
import 'package:first_app/features/authentication/splash.dart';
import 'package:first_app/features/home/home_page.dart';
import 'package:first_app/features/login/login_page.dart';
import 'package:first_app/model/todo_model.dart';
import 'package:flutter/material.dart';

import 'features/create_todo/create_todo.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      home: const SplashPage(),
      onGenerateRoute: (settings) {
        if (settings.name == 'create-todo') {
          return MaterialPageRoute<TodoModel>(
            builder: (context) => CreateTodo(),
          );
        }
        return null;
      },
      routes: {
        'splash': (context) => const SplashPage(),
        'login': (context) => LoginPage(),
        'home': (context) => const HomePage(title: 'Cindi'),
        //'create-todo': (context) => CreateTodo(),
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
          hintStyle: TextStyle(color: Color(0xFFBAC9D4)),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFBAC9D4),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFFFFC82C),
            fixedSize: const Size.fromHeight(30),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
          primary: const Color(0xFFFFC82C),
          side: const BorderSide(color: Color(0xFFFFC82C)),
        )),
      ),
    );
  }
}
