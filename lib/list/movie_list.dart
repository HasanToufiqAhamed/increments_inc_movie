import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:increments_inc_movie/cons_file/my_colors.dart';

class movieListLayout extends StatelessWidget {
  movieListLayout();

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
                  child: Text('h'),
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 13,),
              Text(
                'Movie Name',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16,),
              Text(
                'Action, Adventure',
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
      ],
    );
  }
}
