import 'package:boj/constants/routes.dart';
import 'package:boj/constants/theme.dart';
import 'package:boj/screens/home.dart';
import 'package:boj/screens/onboard/onboard.dart';
import 'package:flutter/material.dart';

int? isSeen;
void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OBJ App',
      debugShowCheckedModeBanner: false,
      theme: OBJTheme.lightTheme,
      darkTheme: OBJTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: BOJHome.id,
      routes: routes,
    );
  }
}
