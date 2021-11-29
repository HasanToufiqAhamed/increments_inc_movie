import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:increments_inc_movie/cons_file/my_colors.dart';
import 'package:increments_inc_movie/model/movie_details_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovieDetailsPage extends StatefulWidget {
  String imdbMovieId;

  MovieDetailsPage({required this.imdbMovieId});

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  MovieDetailsModel? _movieDetailsModel;
  bool loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSharedPrefForTest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading? Container(child: CircularProgressIndicator(color: MyColors.mainColor, strokeWidth: 2,), alignment: Alignment.center,) : Column(
        children: [
          Text('Hello')
        ],
      ),
    );
  }

  getMovieDetails() async {
    var response = await http.get(
        Uri.https(
          'utelly-tv-shows-and-movies-availability-v1.p.rapidapi.com',
          'idlookup',
          {
            'source_id': '${widget.imdbMovieId}',
            'source': 'imdb',
          },
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-rapidapi-host':
              'utelly-tv-shows-and-movies-availability-v1.p.rapidapi.com',
          'x-rapidapi-key':
              '9012c3fffbmsh846ce58520319b2p1034b5jsnc501ee5409a7',
        });
    if (response.statusCode == 200) {
      setState(() {
        _movieDetailsModel =
            MovieDetailsModel.fromJson(jsonDecode(response.body));

        loading = false;
      });

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('demoMovie', jsonDecode(response.body).toString());
    } else {
      throw Exception('Failed to load album');
    }
  }

  void getSharedPrefForTest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString('demoMovie') == null){
      getMovieDetails();
    } else {
      setState(() {
        print(prefs.getString('demoMovie'));

        _movieDetailsModel =
            MovieDetailsModel.fromJson(jsonDecode(prefs.getString('demoMovie')!.toString()));

        loading = false;
      });
    }
  }
}
