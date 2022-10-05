import 'package:first_app/design_system/my_color.dart';
import 'package:first_app/features/profile/profile_page.dart';
import 'package:flutter/material.dart';

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
        inputDecorationTheme: const InputDecorationTheme(
          fillColor: Colors.black,
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.yellow, width: 3),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 3),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 3),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),
      home: ProfilePage(),
    );
  }
}
