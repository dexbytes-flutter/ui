import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:flutter/material.dart';

class CommonAppBarNew extends StatelessWidget {
  final bool isHideLeftIcon;
  final bool isHideRightICon;
  final bool isShowTitle;
  final String title;
  final Color? appBarColor;
  final EdgeInsetsGeometry? leftIconMargin;
  const CommonAppBarNew({
    Key? key,
    this.isHideLeftIcon = false,
    this.isHideRightICon = false,
    this.isShowTitle = false,
    this.title = "",
    this.appBarColor,
    this.leftIconMargin
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: appBarColor??appColors.white,
      body: Container(
        margin: EdgeInsets.only(top: 15),
        child: Stack(
          children: [
            isHideLeftIcon ? Container() :
            Positioned(
              left: 20,
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                    FocusScope.of(context).unfocus();
                  },
                  child: Container(
                    // margin: leftIconMargin ?? EdgeInsets.symmetric(horizontal: 10),
                    child: iconApps.iconImage(imageUrl: iconApps.arrowLeft,
                        iconSize: Size(28,28),
                        imageColor: appColors.appBarTextColor
                    ),
                  ),
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Text(title,
                  style: appStyles.commonAppBarTitleTextStyle(
                    texColor: appColors.appBarTextColor
                  ))
                ]
            ),
            isHideRightICon? Container() :
            Positioned(
              right: 15,
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: iconApps.iconImage(imageUrl: iconApps.rightArrow1,
                  iconSize: Size(20,20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
