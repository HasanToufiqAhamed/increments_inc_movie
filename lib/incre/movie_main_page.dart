import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/activity/incre/colors.dart';
import 'package:untitled/activity/incre/list/movie_list.dart';

class MovieMainPage extends StatefulWidget {
  const MovieMainPage({Key? key}) : super(key: key);

  @override
  _MovieMainPageState createState() => _MovieMainPageState();
}

class _MovieMainPageState extends State<MovieMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                children: [
                  Text(
                    'One Time',
                    style: TextStyle(color: MyColors.mainColor, fontSize: 32),
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
            Container(
              height: MediaQuery.of(context).size.width/1.5,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return movieListLayout();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
