import 'dart:async';
import 'dart:convert';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_bloc/modules/video.dart';

class FavoriteBloc implements BlocBase {
  Map<String, Video> _favoritos = {};
  final _favController = BehaviorSubject<Map<String, Video>>(seedValue: {});
  Stream<Map<String, Video>> get outfav => _favController.stream;

  FavoriteBloc() {
    SharedPreferences.getInstance().then(
      (value) {
        if (value.getKeys().contains('favorites')) {
          _favoritos =
              json.decode(value.getString('favorites')).map((key, value) {
            return MapEntry(key, Video.fromJson(value));
          }).cast<String, Video>();
          _favController.add(_favoritos);
        }
      },
    );
  }

  void ativarFavs(Video video) {
    if (_favoritos.containsKey(video.id))
      _favoritos.remove(video.id);
    else
      _favoritos[video.id] = video;
    _favController.sink.add(_favoritos);
    _saveFav();
  }

  void _saveFav() {
    SharedPreferences.getInstance().then((value) {
      value.setString('favorites', json.encode(_favoritos));
    });
  }

  @override
  void dispose() {
    _favController.close();
  }
}
