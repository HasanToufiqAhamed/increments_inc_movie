import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:increments_inc_movie/cons_file/my_colors.dart';
import 'package:increments_inc_movie/helper/checker.dart';

import '../home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  FocusNode oneFocus = FocusNode();
  FocusNode twoFocus = FocusNode();
  FocusNode twoThree = FocusNode();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password2 = TextEditingController();

  bool _showPassword = true;
  bool _showPassword2 = true;

  bool loading = false;

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;

    return Scaffold(
      body: SafeArea(
        child: Padding(
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 11),
                        child: Text(
                          'Let’s sign up.',
                          style: TextStyle(
                              color: MyColors.mainColor, fontSize: 32),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 14),
                        child: Text(
                          'Welcome to \nIncrements Inc.',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                      SizedBox(
                        height: 42,
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 3),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                        child: TextFormField(
                          focusNode: twoFocus,
                          controller: password,
                          keyboardType: TextInputType.visiblePassword,
                          style: TextStyle(color: Colors.white),
                          obscureText: _showPassword,
                          onFieldSubmitted: (v) {
                            FocusScope.of(context).requestFocus(twoThree);
                          },
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                        child: TextFormField(
                          focusNode: twoThree,
                          controller: password2,
                          keyboardType: TextInputType.visiblePassword,
                          style: TextStyle(color: Colors.white),
                          obscureText: _showPassword2,
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
                              color: this._showPassword2
                                  ? MyColors.backgroundColorReg
                                  : MyColors.backgroundColor,
                              onPressed: () {
                                setState(() {
                                  this._showPassword2 = !this._showPassword2;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              keyboardIsOpened
                  ? SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have account?',
                          style: TextStyle(
                              color: MyColors.backgroundColorReg, fontSize: 16),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Log in',
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
                  String finalPassword2 = password2.text.toString();

                  if (finalEmail.isEmpty ||
                      finalPassword.isEmpty ||
                      finalPassword2.isEmpty ||
                      finalPassword != finalPassword2) {
                    if (finalEmail.isEmpty)
                      Fluttertoast.showToast(msg: 'Enter email');
                    else if (finalPassword.isEmpty)
                      Fluttertoast.showToast(msg: 'Enter password');
                    else if (finalPassword2.isEmpty)
                      Fluttertoast.showToast(msg: 'Enter secondary password');
                    else
                      Fluttertoast.showToast(msg: 'Password1 != Password2');
                  } else {
                    try {
                      setState(() {
                        loading = true;
                      });
                      await auth
                          .createUserWithEmailAndPassword(
                        email: finalEmail,
                        password: finalPassword,
                      )
                          .then((val) {
                        setState(() {
                          loading = false;
                        });
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                          (Route<dynamic> route) => false,
                        );
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
                          'Register',
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
        ),
      ),
    );
  }
}
