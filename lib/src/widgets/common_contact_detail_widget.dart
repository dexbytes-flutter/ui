import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:flutter/material.dart';

import '../all_file_import/app_utils_files_link.dart';

class CommonContactDetailCard extends StatelessWidget {
  final EdgeInsetsGeometry? cardMargin;
  final EdgeInsetsGeometry? cardPadding;
  final String? imageUrl;
  final String? title;
  String? subTitle;
  final int? index;
  final int? selectedIndex;

  CommonContactDetailCard({
    Key? key,
    this.cardMargin,
    this.cardPadding,
    this.imageUrl,
    this.title,
    this.subTitle,
    this.index,
    this.selectedIndex
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: cardPadding ?? EdgeInsets.zero,
      margin: cardMargin ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: appColors.appBgColor2.withOpacity(0.70),
        border: Border.all(
          color: index == selectedIndex? appColors.buttonBgColor.withOpacity(0.50) : appColors.appBgColorJungleGreen,
          width: 2.5
        )
      ),
      child: Row(
        children: [
          iconApps.iconImage(
              imageUrl: imageUrl!,
              iconSize: Size(25, 25),
              imageColor: appColors.buttonBgColor.withOpacity(0.40)
          ),
          SizedBox(width: 30,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title!,
              style: appStyles.commonSubTitleTextStyle(),
              ),
              SizedBox(height: 8,),
              Text(subTitle!.replaceRange(0, 8,"•••• •••• "),
                style: appStyles.commonSubTitleTextStyle(
                    texColor: appColors.textNormalColor,
                  letterSpacing: 1.3,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
