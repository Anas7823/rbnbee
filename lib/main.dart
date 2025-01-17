import 'package:flutter/material.dart';
import 'package:rbnbee/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time Tracker',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
      ),
      home: const HomePage()
    );
  }
}