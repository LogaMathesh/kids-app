import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(KidsLearningApp());
}

class KidsLearningApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kids Learning AI",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}
