import 'package:flutter/material.dart';
import 'package:youtube_bloc/screens/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BlocPattern',
      home: HomeScreen(),
    );
  }
}
