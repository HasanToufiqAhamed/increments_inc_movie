import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:increments_inc_movie/cons_file/my_colors.dart';
import 'package:increments_inc_movie/model/movie_list_model.dart';
import 'package:increments_inc_movie/pages/movie_details_page.dart';

class movieSliderListLayout extends StatelessWidget {
  Result movie;

  movieSliderListLayout({required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  MovieDetailsPage(imdbMovieId: '${movie.externalIds!.imdb!.id}', image: '${movie.picture}',)
          ),
        );
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Stack(
          children: [
            Container(
              child: CachedNetworkImage(
                imageUrl: '${movie.picture}',
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: MyColors.backgroundColorReg,
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              width: double.maxFinite,
              height: MediaQuery.of(context).size.width / 2.1,
              color: Colors.white,
            ),
            Positioned(
              bottom: 12,
              left: 18,
              right: 18,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${movie.name}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Icon(Icons.star, color: MyColors.mainColor,),
                  const SizedBox(width: 6,),
                  const Text(
                    '0',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
