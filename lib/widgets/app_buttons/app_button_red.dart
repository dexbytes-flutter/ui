import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:flutter/material.dart';

class AppButtonRed extends StatefulWidget {
  final buttonCallback,buttonName;
  const AppButtonRed({Key? key, this.buttonCallback, this.buttonName}) : super(key: key);

  @override
  State<AppButtonRed> createState() => _AppButtonRedState();
}

class _AppButtonRedState extends State<AppButtonRed> {
  @override
  Widget build(BuildContext context) {
    return CommonButton(
      buttonHeight: 50,
      buttonName:widget.buttonName,
      buttonColor:appColors.buttonBgColor,
      buttonBorderRadius : 10,
      textStyle:  appStyles.buttonTextStyle1(),
      backCallback: widget.buttonCallback,
      isBottomMarginRequired: false,
    );
  }
}

