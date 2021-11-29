import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:increments_inc_movie/cons_file/my_colors.dart';
import 'package:increments_inc_movie/helper/checker.dart';
import 'package:increments_inc_movie/helper/sign_in_helper/facebook_sign_in.dart';
import 'package:increments_inc_movie/helper/sign_in_helper/google_sign_in.dart';
import 'package:increments_inc_movie/pages/home_page.dart';

import '../opt_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  FocusNode oneFocus = FocusNode();
  FocusNode twoFocus = FocusNode();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool _showPassword = true;
  bool loading = false;

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  CupertinoIcons.back,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.only(left: 11),
                child: Text(
                  'Let’s sign you in.',
                  style: TextStyle(color: MyColors.mainColor, fontSize: 32),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 14),
                child: Text(
                  'Welcome back.\nYou’ve been missed!',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: MyColors.backgroundColorReg.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: MyColors.backgroundColorReg.withOpacity(0.5),
                    width: 1,
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                child: TextFormField(
                  focusNode: oneFocus,
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.white),
                  onFieldSubmitted: (v) {
                    FocusScope.of(context).requestFocus(twoFocus);
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Phone or email',
                    hintStyle: TextStyle(
                      color: MyColors.backgroundColorReg,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  color: MyColors.backgroundColorReg.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: MyColors.backgroundColorReg.withOpacity(0.5),
                    width: 1,
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                child: TextFormField(
                  focusNode: twoFocus,
                  controller: password,
                  keyboardType: TextInputType.visiblePassword,
                  style: TextStyle(color: Colors.white),
                  obscureText: _showPassword,
                  onFieldSubmitted: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: MyColors.backgroundColorReg,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    focusedBorder: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(CupertinoIcons.eye_solid),
                      color: this._showPassword
                          ? MyColors.backgroundColorReg
                          : MyColors.backgroundColor,
                      onPressed: () {
                        setState(() {
                          this._showPassword = !this._showPassword;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Spacer(),
                  Text(
                    'Forgot password?',
                    style: TextStyle(
                        color: MyColors.backgroundColorReg, fontSize: 16),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    'Reset',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account?',
                    style: TextStyle(
                        color: MyColors.backgroundColorReg, fontSize: 16),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    'Register',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () async {
                  String finalEmail = email.text.toString();
                  String finalPassword = password.text.toString();

                  if (checkValidPhoneNumber(finalEmail)) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OtpPage(
                          phoneNumber: finalEmail,
                        ),
                      ),
                    );
                  } else if (finalEmail.isEmpty || finalPassword.isEmpty) {
                    if (finalEmail.isEmpty)
                      Fluttertoast.showToast(msg: 'Enter you Phone/Email/Name');
                    else
                      Fluttertoast.showToast(msg: 'Enter password');
                  } else {
                    setState(() {
                      loading = true;
                    });
                    try {
                      await auth
                          .signInWithEmailAndPassword(
                              email: finalEmail, password: finalPassword)
                          .then((val) {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                              (Route<dynamic> route) => false,
                        );
                        setState(() {
                          loading = false;
                        });
                      });
                    } on FirebaseAuthException catch (e) {
                      Fluttertoast.showToast(msg: e.message.toString());
                      setState(() {
                        loading = false;
                      });
                    }
                  }
                },
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  alignment: Alignment.center,
                  child: loading
                      ? SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            color: MyColors.backgroundColor,
                            strokeWidth: 1,
                          ),
                        )
                      : Text(
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
                  signInWithFacebook().then((result) {
                    if (result.user != null) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return HomePage();
                          },
                        ),
                      );
                    }
                  });
                },
                child: Container(
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
              ),
              SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () {
                  googleSignInHelper().then((result) {
                    if (result.currentUser != null) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return HomePage();
                          },
                        ),
                      );
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
          ),
        ),
      ),
    );
  }
}
