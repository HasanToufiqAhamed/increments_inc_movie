import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:increments_inc_movie/cons_file/my_colors.dart';
import 'package:increments_inc_movie/cons_file/text_file.dart';
import 'package:increments_inc_movie/helper/sign_in_helper/google_sign_in.dart';
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
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Increments Inc.',
                        style: TextStyle(
                          color: MyColors.mainColor,
                          fontSize: 32,
                        ),
                      ),
                      SizedBox(
                        height: 64,
                      ),
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
                      MaterialPageRoute(builder: (context) => SignInWelcome()),
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
                SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () {
                    /*signInWithFacebook().then((result) {
                        if (result.user != null) {
                          setState(() {

                          });
                        }
                      });*/
                  },
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2550A0),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    alignment: Alignment.center,
                    child: const Text(
                      'Facebook',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () {
                    googleSignInHelper().then((result) {
                      if (result.currentUser != null) {
                        setState(() {});
                      }
                    });
                  },
                  child: Container(
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
                ),
              ],
            )
          : Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CachedNetworkImage(
                        imageUrl: auth.currentUser!.photoURL == null
                            ? ''
                            : auth.currentUser!.photoURL!,
                        imageBuilder: (context, imageProvider) => Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          ),
                        ),
                        placeholder: (context, url) => Center(
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: CircularProgressIndicator(
                              color: MyColors.mainColor,
                              strokeWidth: 1,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Icon(
                              FeatherIcons.user,
                              color: MyColors.backgroundColorReg,
                              size: 70,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(120),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        auth.currentUser!.phoneNumber == null
                            ? '${auth.currentUser!.email}'
                            : '${auth.currentUser!.phoneNumber}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Increments Inc.',
                        style: TextStyle(
                          color: MyColors.mainColor,
                          fontSize: 32,
                        ),
                      ),
                      SizedBox(
                        height: 64,
                      ),
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
                  onTap: () async {
                    auth.signOut();
                    await GoogleSignIn().signOut();
                    setState(() {});
                  },
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    alignment: Alignment.center,
                    child: const Text(
                      'Log out',
                      style: TextStyle(
                        color: MyColors.backgroundColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
