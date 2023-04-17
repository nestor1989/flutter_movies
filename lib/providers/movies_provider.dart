import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_movies/model/Movie.dart';
import 'package:flutter_movies/model/now_playing_response.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  String _apiKey = 'a37c96e86eeea0418f276ff4b39740b7';
  String _baseUrl = 'api.themoviedb.org';
  String _languaje = 'es-ES';

  List<Movie> onDisplayMovies = [];

  MoviesProvider() {
    print('se inicializó movies provider');
    getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'baseUrl': _baseUrl, 'languaje': _languaje});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }
}
