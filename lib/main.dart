import 'package:flutter/material.dart';
import 'package:pro_2/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'You Pick We Deliver',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.orange,
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          headlineMedium: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 16),
          labelLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      home: SplashScreen(), // Set SplashScreen as home
    );
  }
}
