import 'dart:async';

import 'package:covid_tracker/View/world_stats.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose(); 
  }

  void initState() {
    // TODO: implement initState
    super.initState(); 
    Timer(
        Duration(seconds: 5),
        (() => Navigator.push(context,
            MaterialPageRoute(builder: (context) => WorldStatsScreen()))));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
 AnimatedBuilder(
                animation: _controller,
                child: Container(
                  height: 200,
                  width: 200,
                  child: Center(
                      child: Image(image: AssetImage('images/virus.png'))),
                ),
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: _controller.value * 2.0 * math.pi,
                    child: child,
                  );
                }),
            SizedBox(
              height: MediaQuery.of(context).size.height * .08,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Covid-19 \n Tracker App",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
