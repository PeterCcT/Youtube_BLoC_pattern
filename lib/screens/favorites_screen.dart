import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:youtube_bloc/blocs/favorite_bloc.dart';
import 'package:youtube_bloc/modules/video.dart';

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<FavoriteBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: StreamBuilder<Map<String, Video>>(
        initialData: {},
        stream: bloc.outfav,
        builder: (context, snapshot) {
          return ListView(
            children: snapshot.data.values.map((video) {
              return InkWell(
                onTap: () {},
                onLongPress: () {
                  bloc.ativarFavs(video);
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      child: Image.network(video.thumb),
                    ),
                    Expanded(
                        child: Text(
                      video.title,
                      style: TextStyle(color: Colors.white),
                    )),
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
