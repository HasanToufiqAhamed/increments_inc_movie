import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:increments_inc_movie/cons_file/my_colors.dart';
import 'package:increments_inc_movie/model/movie_list_model.dart';
import 'package:increments_inc_movie/pages/movie_details_page.dart';

class movieListLayout extends StatelessWidget {
  Result movie;

  movieListLayout({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 30,
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MovieDetailsPage(imdbMovieId: '${movie.externalIds!.imdb!.id}', image: '${movie.picture}',)
              ),
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 2.8,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.8,
                    height: MediaQuery.of(context).size.width / 1.7,
                    child: CachedNetworkImage(
                      imageUrl: '${movie.picture}',
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        color: MyColors.backgroundColorReg,

                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Text(
                  '${movie.name}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  '${getLocations(movie.locations)}',
                  style: TextStyle(
                    fontSize: 14,
                    color: MyColors.backgroundColorReg,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  getLocations(List<Location>? locations) {
    String locationName = '';
    for (int a = 0; a != locations!.length; a++) {
      if (a == 0)
        locationName = locations[a].displayName!.toString();
      else if (a == locations.length)
        locationName = locationName + locations[a].displayName!.toString();
      else
        locationName =
            locationName + ', ' + locations[a].displayName!.toString();
    }
    return locationName;
  }
}
