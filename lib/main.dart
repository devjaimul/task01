import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task01/views/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(title: 'Task01'),
    );
  }
}

