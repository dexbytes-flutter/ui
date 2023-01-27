import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget {
  final bool isHideLeftIcon;
  final bool isHideRightICon;
  final bool isShowTitle;
  final String title;

  const CommonAppBar({
    Key? key,
    this.isHideLeftIcon = false,
    this.isHideRightICon = false,
    this.isShowTitle = false,
    this.title = ""
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isShowTitle? Colors.white : appColors.appBgColor1.withOpacity(0.15),
      margin: isShowTitle ? EdgeInsets.only(left: 0, right: 0) : EdgeInsets.only(left: 20, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isHideLeftIcon ? Container():
          GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 10,top: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: appColors.appBgColor1.withOpacity(0.60)
              ),
              child: iconApps.iconImage(imageUrl: iconApps.backArrowIcon,
                iconSize: Size(20,20),
              ),
            ),
          ),
          isShowTitle ? Align(
            alignment: Alignment.center,
            child: Text(this.title,
            style: TextStyle(fontSize: 20),),
          ) : Container(),
          isHideRightICon? Container():
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(right: 10, top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: appColors.appBgColor1.withOpacity(0.60)
            ),
            child: iconApps.iconImage(imageUrl: iconApps.favoriteIcon,
              iconSize: Size(22,22),
              imageColor: appColors.black.withOpacity(0.60)
            ),
          ),
        ],
      ),
    );
  }
}