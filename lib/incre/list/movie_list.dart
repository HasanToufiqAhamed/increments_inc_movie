import 'package:flutter/material.dart';

class movieListLayout extends StatelessWidget {
  movieListLayout();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 30,),
        Container(
          width: MediaQuery.of(context).size.width/2.1,
          height: MediaQuery.of(context).size.width/1.5,
          child: Text('h'),
          color: Colors.white,
        ),
      ],
    );
  }
}
