import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/activity/incre/colors.dart';

import 'opt_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  FocusNode oneFocus = new FocusNode();
  FocusNode twoFocus = new FocusNode();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                CupertinoIcons.back,
                color: Colors.white,
                size: 24,
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
                    hintText: 'Phone, email or username',
                    hintStyle: TextStyle(
                      color: MyColors.backgroundColorReg,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 16,),
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
                  onFieldSubmitted: (v) {
                    FocusScope.of(context).requestFocus(twoFocus);
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
              SizedBox(height: 12,),
              Row(
                children: [
                  Spacer(),
                  Text('Forgot password?', style: TextStyle(color: MyColors.backgroundColorReg, fontSize: 16),),
                  SizedBox(width: 6,),
                  Text('Reset', style: TextStyle(color: Colors.white, fontSize: 16),),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don’t have an account?', style: TextStyle(color: MyColors.backgroundColorReg, fontSize: 16),),
                  SizedBox(width: 6,),
                  Text('Register', style: TextStyle(color: Colors.white, fontSize: 16),),
                ],
              ),
              SizedBox(height: 16,),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            OtpPage()
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
          ),
        ),
      ),
    );
  }
}
