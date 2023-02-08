import 'dart:io';

import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:flutter/material.dart';

class LoadingWidget2 {
  static endLoadingWidget(BuildContext context) {
    Navigator.pop(context);
  }

  static startLoadingWidget(BuildContext context,{bool useRootNavigator = false,double loaderSize = 25,}) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        useRootNavigator: useRootNavigator,
        builder: (BuildContext context) {
          return Center(
            child:
            /*SpinKitCircle(
              color: ColorsHelper.whiteColor(),
              size: 50.0,
            )*/
            SizedBox(
              height: loaderSize,
              width: loaderSize,
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color?>(
                    appColors.loaderColor2),
              ),
            ),
          );
        });
  }

  //It is simple transparent bg loader user for any view not like popup loader
  static loadViewWidget({double loaderSize = 25,double strokeWidth = 4.0,double squareSize = 50}) => Center(
    child: SizedBox.fromSize(
      size: Size.square(squareSize),
      child: (Platform.isIOS || Platform.isMacOS)
          ? Center(
        child: SizedBox(
          height: loaderSize,
          width: loaderSize,
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color?>(
                appColors.loaderColor2),strokeWidth: strokeWidth,
          ),
        ),
      )
          : Center(
        child: SizedBox(
          height: loaderSize,
          width: loaderSize,
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color?>(
                appColors.loaderColor2),strokeWidth: strokeWidth,
          ),
        ),
      ),
    ),
  );



  static loadViewNotificationWidget({double loaderSize = 50,double strokeWidth = 0.5}) => Center(
    child: SizedBox.fromSize(
      size: Size.square(30),
      child: (Platform.isIOS || Platform.isMacOS)
          ? Center(
        child: SizedBox(
          height: loaderSize,
          width: loaderSize,
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color?>(
                appColors.loaderColor2),strokeWidth: strokeWidth,
          ),
        ),
      )
          : Center(
        child: SizedBox(
          height: loaderSize,
          width: loaderSize,
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color?>(
                appColors.loaderColor2)
            ,strokeWidth: strokeWidth,
          ),
        ),
      ),
    ),
  );
}
