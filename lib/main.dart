import 'package:flutter/material.dart';
import 'package:weatther_cast/view/splash_one.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CCNW",
      theme: ThemeData(
        primaryColor: const Color(0xFF322DC4),
        brightness: Brightness.light,
        backgroundColor: const Color(0xFFFFFFFF),
        dividerColor: Colors.white54,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      home: Material(
        child: Builder(builder: (BuildContext context){
          return const SplashOne();

        }
        ),
      ),
    );
  }
}