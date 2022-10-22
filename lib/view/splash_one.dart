import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weatther_cast/view/splash_two.dart';

class SplashOne extends StatefulWidget {
  const SplashOne({Key? key}) : super(key: key);

  @override
  State<SplashOne> createState() => _SplashOneState();
}

class _SplashOneState extends State<SplashOne> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => const SplashTwo()
            // const SplashTwo()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF0C1823),
      body: Center(
        child: Image(image: AssetImage('assets/images/logo.png')),
      ),
    );
  }
}