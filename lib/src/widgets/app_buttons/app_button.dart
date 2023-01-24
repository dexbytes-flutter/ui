import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final buttonCallback,buttonName;
  final bool isDisabled ;
  const AppButton({Key? key, this.buttonCallback, this.buttonName,this.isDisabled = false}) : super(key: key);

  @override
  State<AppButton> createState() => _AppButtonState(isDisabled: isDisabled);
}

class _AppButtonState extends State<AppButton> {
  bool isDisabled ;
  _AppButtonState({this.isDisabled = false});

  @override
  void didUpdateWidget(covariant AppButton oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    setState(() {
      this.isDisabled = widget.isDisabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonButton(isDisable: isDisabled,
      buttonHeight: 50,
      buttonName:widget.buttonName,
      buttonColor: isDisabled?appColors.appDisabledColor:appColors.appDisabledColor,
      buttonBorderRadius : 10,
      textStyle:  appStyles.buttonTextStyle1(),
      backCallback: widget.buttonCallback,
      isBottomMarginRequired: false,
    );
  }
}

