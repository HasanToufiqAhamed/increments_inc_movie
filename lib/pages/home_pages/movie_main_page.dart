import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:increments_inc_movie/cons_file/my_colors.dart';
import 'package:increments_inc_movie/list/movie_list.dart';
import 'package:increments_inc_movie/list/movie_slider_list.dart';

class MovieMainPage extends StatefulWidget {
  const MovieMainPage({Key? key}) : super(key: key);

  @override
  _MovieMainPageState createState() => _MovieMainPageState();
}

class _MovieMainPageState extends State<MovieMainPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            children: [
              Text(
                'INCREMENTS INC',
                style: TextStyle(color: MyColors.mainColor, fontSize: 30),
              ),
              Text(
                '.',
                style: TextStyle(color: Color(0xff6c63ff), fontSize: 30),
              ),
              Spacer(),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: MyColors.backgroundColorReg.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: MyColors.backgroundColorReg.withOpacity(0.5),
                    width: 1,
                  ),
                ),
                child: Icon(
                  CupertinoIcons.bell,
                  color: MyColors.backgroundColorReg,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CarouselSlider.builder(
                  itemCount: 5,
                  itemBuilder: (ctx, index, realIdx) {
                    return movieSliderListLayout();
                  },
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.width / 2.1,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    initialPage: 2,
                    autoPlay: false,
                  ),
                ),
                SizedBox(
                  height: 41,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Text(
                        'Trending Now',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      Spacer(),
                      Icon(
                        CupertinoIcons.right_chevron,
                        color: MyColors.backgroundColorReg,
                        size: 24,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 23,
                ),
                Container(
                  height: MediaQuery.of(context).size.width / 1.7 +
                      22 +
                      16 +
                      13 +
                      16,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return movieListLayout();
                    },
                  ),
                ),
                SizedBox(
                  height: 34,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Text(
                        'Featured Movie',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      Spacer(),
                      Icon(
                        CupertinoIcons.right_chevron,
                        color: MyColors.backgroundColorReg,
                        size: 24,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 23,
                ),
                Container(
                  height: MediaQuery.of(context).size.width / 1.7 +
                      22 +
                      16 +
                      13 +
                      16,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return movieListLayout();
                    },
                  ),
                ),
                SizedBox(
                  height: 34,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
