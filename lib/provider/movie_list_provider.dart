import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:increments_inc_movie/model/movie_list_model.dart';

class MovieListProvider with ChangeNotifier {
  MovieListModel? _movieListProvider;

  MovieListModel get movieList => _movieListProvider!;

  bool _loading = true;

  bool get loading => _loading;

  getMovieList() async {
    var response = await http.get(
        Uri.https(
          'utelly-tv-shows-and-movies-availability-v1.p.rapidapi.com',
          'lookup',
          {
            'term': 'hello',
            'country': 'uk',
          },
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-rapidapi-host':
              'utelly-tv-shows-and-movies-availability-v1.p.rapidapi.com',
          'x-rapidapi-key':
              '3bd5b8ac36msh0d8d8e229c33d6dp17cc07jsn80c1df293ee1',
        });
    if (response.statusCode == 200) {
      _movieListProvider = MovieListModel.fromJson(jsonDecode(response.body));
      _loading = false;

      notifyListeners();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
