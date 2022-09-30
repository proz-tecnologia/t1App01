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
      ),
      home: ProfilePage(),
    );
  }
}
