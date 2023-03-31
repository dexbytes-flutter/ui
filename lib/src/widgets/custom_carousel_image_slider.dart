// https://blog.logrocket.com/creating-image-carousel-flutter/
import 'package:flutter/material.dart';

class CustomCarouselImageSlider extends StatefulWidget {
  const CustomCarouselImageSlider({Key? key}) : super(key: key);

  @override
  State<CustomCarouselImageSlider> createState() => _CustomCarouselImageSliderState();
}

class _CustomCarouselImageSliderState extends State<CustomCarouselImageSlider> {

  List<String> images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU",
    "https://wallpaperaccess.com/full/2637581.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return  PageView.builder(
        itemCount: 2,
        pageSnapping: true,
        itemBuilder: (context,pagePosition){
          return Container(
              margin: EdgeInsets.all(10),
              child: Image.network(images[pagePosition]));
        });
  }
}
