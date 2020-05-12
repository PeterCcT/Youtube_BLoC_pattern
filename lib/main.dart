import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:youtube_bloc/blocs/videos_bloc.dart';
import 'package:youtube_bloc/screens/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        blocs: [
          Bloc((i) => VideosBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'BlocPattern',
          home: HomeScreen(),
        ));
  }
}
