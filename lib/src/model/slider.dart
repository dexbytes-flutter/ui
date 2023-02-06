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
      sliderImageUrl: 'assets/images/slider/slider_4.png',
      sliderHeading: '',
      sliderSubHeading: SLIDER_DESC_1),
  Slider(
      sliderImageUrl: 'assets/images/slider/slider_5.png',
      sliderHeading: '',
      sliderSubHeading: SLIDER_DESC_2),
  Slider(
      sliderImageUrl: 'assets/images/slider/slider_6.png',
      sliderHeading: '',
      sliderSubHeading: SLIDER_DESC_3),
];