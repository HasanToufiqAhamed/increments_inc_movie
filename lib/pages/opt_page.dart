import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:increments_inc_movie/cons_file/my_colors.dart';
import 'package:increments_inc_movie/pages/home_page.dart';

import 'home_pages/movie_main_page.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  FocusNode oneFocus = FocusNode();
  FocusNode twoFocus = FocusNode();
  FocusNode threeFocus = FocusNode();
  FocusNode fourFocus = FocusNode();
  TextEditingController oneText = TextEditingController();
  TextEditingController twoText = TextEditingController();
  TextEditingController threeText = TextEditingController();
  TextEditingController fourText = new TextEditingController();

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
                  'One Time Password',
                  style: TextStyle(color: MyColors.mainColor, fontSize: 32),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Container(
                padding: EdgeInsets.only(left: 11),
                child: Text(
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam',
                  style: const TextStyle(
                    color: MyColors.backgroundColorReg,
                    fontSize: 16,
                  ),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IntrinsicWidth(
                    child: Container(
                      width: 60,
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
                        controller: oneText,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        maxLines: 1,
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                        onFieldSubmitted: (v) {
                          FocusScope.of(context).requestFocus(twoFocus);
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          counterText: '',
                        ),
                        onChanged: (value) {
                          if (value != '')
                            FocusScope.of(context).requestFocus(twoFocus);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  IntrinsicWidth(
                    child: Container(
                      width: 60,
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
                        controller: twoText,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        maxLines: 1,
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          counterText: '',
                        ),
                        onChanged: (value) {
                          if (value == '') {
                            FocusScope.of(context).requestFocus(oneFocus);
                          } else
                            FocusScope.of(context).requestFocus(threeFocus);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  IntrinsicWidth(
                    child: Container(
                      width: 60,
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
                        focusNode: threeFocus,
                        controller: threeText,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                        /*onFieldSubmitted: (v) {
                              FocusScope.of(context).requestFocus(twoFocus);
                            },*/
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        onChanged: (value) {
                          if (value == '') {
                            FocusScope.of(context).requestFocus(twoFocus);
                          } else
                            FocusScope.of(context).requestFocus(fourFocus);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  IntrinsicWidth(
                    child: Container(
                      width: 60,
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
                        focusNode: fourFocus,
                        controller: fourText,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                        /*onFieldSubmitted: (v) {
                              FocusScope.of(context).requestFocus(twoFocus);
                            },*/
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        onChanged: (value) {
                          if (value == '') {
                            FocusScope.of(context).requestFocus(threeFocus);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Resend in', style: TextStyle(color: MyColors.backgroundColorReg, fontSize: 16),),
                  SizedBox(width: 6,),
                  Text('30:00', style: TextStyle(color: Colors.white, fontSize: 16),),
                  SizedBox(width: 6,),
                  Text('sec', style: TextStyle(color: MyColors.backgroundColorReg, fontSize: 16),),
                ],
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HomePage()
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
                    'Verify',
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
