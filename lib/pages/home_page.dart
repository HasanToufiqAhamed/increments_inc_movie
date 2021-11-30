import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:increments_inc_movie/cons_file/my_colors.dart';
import 'package:increments_inc_movie/pages/home_pages/download_page.dart';
import 'package:increments_inc_movie/pages/home_pages/movie_main_page.dart';
import 'package:increments_inc_movie/pages/home_pages/profile_page.dart';
import 'package:increments_inc_movie/pages/home_pages/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isSelected = 1;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  tabItem(1, FeatherIcons.home),
                  tabItem(2, FeatherIcons.search),
                  tabItem(3, FeatherIcons.download),
                  tabItem(4, FeatherIcons.menu),
                  tabItem(5, FeatherIcons.user),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // SizedBox(height: statusBarHeight),
            //home page
            Expanded(
              flex: 1,
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  MovieMainPage(),
                  SearchPage(),
                  DownloadPage(),
                  DownloadPage(),
                  ProfilePage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget tabItem(var pos, var icon) {
    return GestureDetector(
      onTap: () {
        if (isSelected != pos) {
          setState(() {
            isSelected = pos;
            _pageController.animateToPage(pos - 1,
                curve: Curves.easeIn, duration: Duration(milliseconds: 1));
          });
        }
      },
      child: Stack(
        children: [
          //Container(padding: EdgeInsets.only(left: 5, top: 5), child: SvgPicture.asset(pos==1?'icons/home.svg':pos==2?'icons/heart.svg':pos==3?'icons/bell.svg':'icons/user.svg', color: isSelected == pos ? MyColors.edit_text_tint_color : Colors.white),),
          Icon(
            icon,
            size: isSelected == pos? 34 : 24,
            color: isSelected == pos
                ? const Color(0xff6c63ff)
                : MyColors.backgroundColorReg,
          ),
        ],
      ),
    );
  }
}
