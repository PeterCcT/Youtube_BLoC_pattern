import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:youtube_bloc/blocs/videos_bloc.dart';
import 'package:youtube_bloc/delegates/data_search.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 50,
          child: Image.asset('images/yt_logo.png'),
        ),
        elevation: 0,
        backgroundColor: Colors.black,
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text('0'),
          ),
          IconButton(
            icon: Icon(Icons.star),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String result =
                  await showSearch(context: context, delegate: DataSearch());
              if (result != null) {
                BlocProvider.getBloc<VideosBloc>().inSearch.add(result);
              }
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: BlocProvider.getBloc<VideosBloc>().outVideos/* BlocProvider.getBloc<VideosBloc>().outVideos */,
        builder: (context,snapshot){
          if(snapshot.hasData){
            return ListView.builder(itemBuilder: null);
          }else{
            return Container();
          }
        },
      ),
    );
  }
}
