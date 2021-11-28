import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:increments_inc_movie/cons_file/my_colors.dart';

class movieSliderListLayout extends StatelessWidget {
  movieSliderListLayout();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Container(
          child: Text('hello'),
          width: double.maxFinite,
          height: MediaQuery.of(context).size.width / 2.1,
          color: Colors.white,
        ),
      ),
    );
  }
}
