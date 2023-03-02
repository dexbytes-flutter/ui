import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  const TitleText(
      {Key? key,
      this.text,
      this.style
      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text("$text",
    style: style?? TextStyle(
      fontSize: 15, fontFamily: "Raleway",
      color: appColors.textColor,fontWeight: FontWeight.w500)
    );
  }
}
