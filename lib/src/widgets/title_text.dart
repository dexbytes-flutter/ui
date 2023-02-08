import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String? text;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry margin;

  const TitleText(
      {Key? key,
      this.text,
        this.textStyle = const TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black),
      this.margin = const EdgeInsets.symmetric(horizontal: 20),
    })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Text("$text",
      style:textStyle ?? appStyles.titleTextStyle1() ,
        textAlign: TextAlign.start,
      ),
    );
  }
}