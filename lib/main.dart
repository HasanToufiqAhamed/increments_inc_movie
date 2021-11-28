import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:increments_inc_movie/cons_file/my_colors.dart';
import 'package:increments_inc_movie/cons_file/text_file.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: MyColors.backgroundColor,
      ),
      home: SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Increments Inc.',
                  style: TextStyle(
                    color: MyColors.mainColor,
                    fontSize: 32,
                  ),
                ),
              ],
            ),
            const Text(
              'Movies in your palm!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            Text(
              f_text,
              style: const TextStyle(
                  color: MyColors.backgroundColorReg, fontSize: 18),
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
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18),
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
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18),
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
