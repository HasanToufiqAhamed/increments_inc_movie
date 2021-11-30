import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:increments_inc_movie/cons_file/my_colors.dart';
import 'package:increments_inc_movie/model/movie_details_model.dart';
import 'package:increments_inc_movie/pages/web_view_page.dart';

class MovieDetailsPage extends StatefulWidget {
  String imdbMovieId, image;

  MovieDetailsPage({required this.imdbMovieId, required this.image});

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  MovieDetailsModel? _movieDetails;
  bool loading = true;
  List<Widget> items = [];

  @override
  void initState() {
    super.initState();
    getMovieDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? Container(
              child: CircularProgressIndicator(
                color: MyColors.mainColor,
                strokeWidth: 2,
              ),
              alignment: Alignment.center,
            )
          : Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width / 1.2,
                    child: CachedNetworkImage(
                      imageUrl: widget.image,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        color: MyColors.backgroundColorReg,
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${_movieDetails!.collection!.name}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Locations',
                          style: TextStyle(
                              color: MyColors.backgroundColorReg, fontSize: 24),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Wrap(
                                  children: items,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
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
        _movieDetails = MovieDetailsModel.fromJson(jsonDecode(response.body));

        loading = false;
        addInItems(_movieDetails!.collection!.locations!);
      });
    } else {
      throw Exception('Failed to load album');
    }
  }

  void addInItems(List<Location> list) {
    for (int a = 0; a != list.length; a++) {
      items.add(
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      WebViewPage(url: list[a].url!),),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 15, bottom: 10),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: MyColors.mainColor,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(1000),)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10,),
                child: CachedNetworkImage(
                  imageUrl:
                  '${list[a].icon}',
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: MyColors.backgroundColorReg,
                  ),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error),
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
