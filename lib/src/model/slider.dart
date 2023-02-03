import 'package:flutter/cupertino.dart';
import '../helper/local_constant.dart';

class Slider {
  final String sliderImageUrl;
  final String sliderHeading;
  final String sliderSubHeading;

  Slider(
      {required this.sliderImageUrl,
        required this.sliderHeading,
        required this.sliderSubHeading});
}

final sliderArrayList = [
  Slider(
      sliderImageUrl: 'assets/images/slider/slider_1.png',
      sliderHeading: SLIDER_HEADING_1,
      sliderSubHeading: SLIDER_DESC),
  Slider(
      sliderImageUrl: 'assets/images/slider/slider_2.png',
      sliderHeading: SLIDER_HEADING_2,
      sliderSubHeading: SLIDER_DESC),
  Slider(
      sliderImageUrl: 'assets/images/slider/slider_3.png',
      sliderHeading: SLIDER_HEADING_3,
      sliderSubHeading: SLIDER_DESC),
];