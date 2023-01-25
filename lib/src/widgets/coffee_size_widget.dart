import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:flutter/material.dart';

class SizeChoice extends StatefulWidget {
  final Function(dynamic)? selectSizeCallback;
  final Function(dynamic)? selectColorCallback;
  final Function(dynamic)? onChartCallback;
  SizeChoice({
    this.selectSizeCallback,
    this.onChartCallback,
    this.selectColorCallback,
  });

  @override
  _SizeChoiceState createState() => _SizeChoiceState();
}

class _SizeChoiceState extends State<SizeChoice> {

  List<SizeList> sizeValue = [
    SizeList(
        text: "S"
    ),
    SizeList(
        text: "M"
    ),
    SizeList(
        text: "L"
    ),
  ];

  List<ColorList> colors = [
    ColorList(
        colors: Color(0xffEF8641)
    ),
    ColorList(
        colors: Color(0xff5609B3)
    ),
    ColorList(
        colors: Color(0xff12B39A)
    ),
    ColorList(
        colors: Color(0xff2473F2)
    ),
    ColorList(
        colors: Color(0xffF71D6D)
    ),


  ];


  String selectedChoice = "S";
  Color selectedColor = Colors.transparent;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      height: 35,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: sizeValue.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                setState(() {
                  selectedChoice =  sizeValue[index].text;
                  print(sizeValue[index].text);
                  widget.selectSizeCallback?.call(0);
                });
              },
              child: Container(
                margin: const EdgeInsets.only(right: 6),
                height: 20,width: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: selectedChoice == sizeValue[index].text ? Colors.white: Color(0xFFCB7642),
                    border: Border.all(width: 1,
                        color: selectedChoice == sizeValue[index].text ?Color(0xFFCB7642):Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Text(sizeValue[index].text,
                  style: TextStyle(fontSize: 13,
                      color:  selectedChoice == sizeValue[index].text ? Color(0xFFCB7642):appColors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            );
          }
      ),
    );
  }
}


class SizeList {
  final String text;
  SizeList({
    required this.text,
  });
}

class ColorList {
  final Color colors;
  ColorList({
    required this.colors,
  });
}