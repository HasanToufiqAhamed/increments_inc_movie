import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:increments_inc_movie/cons_file/my_colors.dart';
import 'package:http/http.dart' as http;
import 'package:increments_inc_movie/list/movie_slider_list.dart';
import 'package:increments_inc_movie/model/movie_list_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _textFieldCtrl = TextEditingController();
  FocusNode oneFocus = FocusNode();
  MovieListModel? _movieList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              IntrinsicWidth(
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                  decoration: BoxDecoration(
                    color: MyColors.backgroundColorReg.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: MyColors.backgroundColorReg.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                  child: TextFormField(
                    focusNode: oneFocus,
                    controller: _textFieldCtrl,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      counterText: '',
                      hintText: 'Search keyword',
                      hintStyle: TextStyle(
                        color: MyColors.backgroundColorReg,
                        fontSize: 16,
                      ),
                    ),
                    onChanged: (value) {
                      getMovieList();
                    },
                  ),
                ),
              ),
              Expanded(
                child: _movieList == null
                    ? Container(
                        alignment: Alignment.center,
                        child: Text(
                          'No search result',
                          style: TextStyle(
                            fontSize: 24,
                            color: MyColors.backgroundColorReg,
                          ),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: _movieList!.results!.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            movieSliderListLayout(
                              movie: _movieList!.results![index],
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getMovieList() async {
    var response = await http.get(
        Uri.https(
          'utelly-tv-shows-and-movies-availability-v1.p.rapidapi.com',
          'lookup',
          {
            'term': _textFieldCtrl.text.toString(),
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
      setState(() {
        _movieList = MovieListModel.fromJson(jsonDecode(response.body));
      });
    } else {
      throw Exception('Failed to load album');
    }
  }
}
