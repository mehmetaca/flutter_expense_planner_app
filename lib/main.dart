
import 'package:flutter/material.dart';
import 'package:flutter_expense_planner_app/screens/home_screen.dart';
import 'package:flutter_expense_planner_app/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Planner',
      theme: myLightTheme,
      home: const HomeScreen(),
    );
  }
}


