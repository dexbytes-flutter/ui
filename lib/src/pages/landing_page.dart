import 'package:base_flutter_app/src/pages/slider_layout_view.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: onBoardingBody(),
    );
  }

  Widget onBoardingBody() => Container(
    child: SliderLayoutView(),
  );
}