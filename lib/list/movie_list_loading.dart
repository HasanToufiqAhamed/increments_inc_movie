import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:increments_inc_movie/cons_file/my_colors.dart';
import 'package:increments_inc_movie/model/movie_list_model.dart';
import 'package:increments_inc_movie/pages/movie_details_page.dart';

class movieListLayoutLoading extends StatelessWidget {
  movieListLayoutLoading();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 30,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2.8,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.8,
                  height: MediaQuery.of(context).size.width / 1.7,
                  color: MyColors.backgroundColorReg,
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Container(
                  height: 18,
                  color: MyColors.backgroundColorReg,
                  width: double.maxFinite,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  height: 14,
                  color: MyColors.backgroundColorReg,
                  width: double.maxFinite,
                ),
              ),
            ],
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
