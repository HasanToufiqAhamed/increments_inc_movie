import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:increments_inc_movie/cons_file/my_colors.dart';
import 'package:increments_inc_movie/cons_file/text_file.dart';
import 'package:increments_inc_movie/pages/sign_in_pages/sign_in_welcome.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: auth.currentUser == null
          ? Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome to.',
                        style: TextStyle(
                          color: MyColors.backgroundColorReg,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(height: 12,),
                      Text(
                        'Increments Inc.',
                        style: TextStyle(
                          color: MyColors.mainColor,
                          fontSize: 32,
                        ),
                      ),
                      SizedBox(height: 64,),
                      Text(
                        '$f_text',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: MyColors.backgroundColorReg,
                          fontSize: 16,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SignInWelcome()
                      ),
                    );
                  },
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    alignment: Alignment.center,
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        color: MyColors.backgroundColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16,),
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Color(0xFF2550A0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  alignment: Alignment.center,
                  child: Text(
                    'Facebook',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: 16,),
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Color(0xFF18A82E),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  alignment: Alignment.center,
                  child: Text(
                    'Google',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            )
          : Text(
              'user',
              style: TextStyle(fontSize: 50),
            ),
    );
  }
}
