import 'dart:async';
import 'package:youtube_bloc/api.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:youtube_bloc/modules/video.dart';

class VideosBloc implements BlocBase {
  Api api;

  List<Video> videos;

  final _videoController = StreamController<List<Video>>();

  Stream get outVideos => _videoController.stream;

  final _searchController = StreamController<String>();

  Sink get inSearch => _searchController.sink;

  VideosBloc() {
    api = Api();
    _searchController.stream.listen(_search);
  }

  void _search(String search) async {
    videos = await api.search(search);
    _videoController.sink.add(videos);
  }

  @override
  void addListener(listener) {}

  @override
  void dispose() {
    _videoController.close();
    _searchController.close();
  }

  @override
  bool get hasListeners => throw UnimplementedError();

  @override
  void notifyListeners() {}

  @override
  void removeListener(listener) {}
}