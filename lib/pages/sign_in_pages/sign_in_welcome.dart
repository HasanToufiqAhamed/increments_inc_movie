import 'package:flutter/material.dart';
import 'package:increments_inc_movie/cons_file/my_colors.dart';
import 'package:increments_inc_movie/cons_file/text_file.dart';
import 'package:increments_inc_movie/pages/sign_in_pages/sign_up_page.dart';

import 'sign_in_page.dart';

class SignInWelcome extends StatefulWidget {
  const SignInWelcome({Key? key}) : super(key: key);

  @override
  _SignInWelcomeState createState() => _SignInWelcomeState();
}

class _SignInWelcomeState extends State<SignInWelcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Image.asset('assets/images/component.png'),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(height: 42,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Increments Inc.',
                            style: TextStyle(
                              color: MyColors.mainColor,
                              fontSize: 32,
                            ),
                          ),
                          SizedBox(width: 34,)
                        ],
                      ),
                      const Text(
                        'Movies in your palm!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 41,),
                      Text(
                        f_text,
                        maxLines: 4,
                        style: const TextStyle(
                          color: MyColors.backgroundColorReg,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: MyColors.backgroundColorReg,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(1),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SignUpPage()
                            ),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Text(
                              'Register',
                              style: TextStyle(
                                color: MyColors.darkTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SignInPage()
                            ),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
