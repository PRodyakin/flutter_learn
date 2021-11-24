import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Add box decoration
        decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 1],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Colors.blue[700]!,
              Colors.lightGreen,
            ],
          ),
        ),
        child: Column(
          children: [
            Flexible(
              flex: 5,
              child: Center(
                child: SvgPicture.asset(
                  'assets/icon/migcredit2.svg',
                  semanticsLabel: 'Logo',
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Center(
                child: Lottie.asset('assets/animations/loading_bubbles.json')
              ),
            ),
          ],
        ),
      ),
    );
  }
}
