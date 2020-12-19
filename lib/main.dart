import 'package:flutter/material.dart';
import 'package:movie_tracker/views/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Próximas Películas',
      theme: ThemeData(
        primaryColor: Colors.red,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.red,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: HomeScreen(),
    );
  }
}
