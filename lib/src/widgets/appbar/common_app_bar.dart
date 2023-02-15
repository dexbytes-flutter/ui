import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget {
  final bool isHideLeftIcon;
  final bool isHideRightIcon;
  final bool isShowTitle;
  final String title;
  final Color? appBarColor;
  final EdgeInsetsGeometry? leftIconMargin;
  final EdgeInsetsGeometry? rightIconMargin;
  const CommonAppBar({
    Key? key,
    this.isHideLeftIcon = false,
    this.isShowTitle = false,
    this.title = "",
    this.appBarColor,
    this.leftIconMargin,
    this.rightIconMargin,
    this.isHideRightIcon = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
        // margin: leftIconMargin??EdgeInsets.zero,
        child: Stack(
          children: [
            isHideLeftIcon ? Container() :
            GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
                FocusScope.of(context).unfocus();
              },
              child: Container(
                margin: leftIconMargin??EdgeInsets.zero,
                child: iconApps.iconImage(imageUrl: iconApps.leftArrow,
                    iconSize: Size(25,25),
                    imageColor: appColors.appBarTextColor
                ),
              ),
            ),
            Container(
              margin: rightIconMargin ?? EdgeInsets.zero,
              child: isHideRightIcon
                  ? Container()
                  : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    iconApps.iconImage(imageUrl: iconApps.locationIcon,
                        iconSize: Size(15,15),
                        imageColor: appColors.appBarTextColor
                    ),
                    SizedBox(width: 5,),
                    Center(
                        child:
                        Text(title, style: appStyles.commonAppBarTextTextStyle()
                        )
                    )
                  ]
              ),
            ),
          ],
        ),
      );
  }
}