import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/like_button_icon.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget {
  final bool isHideLeftIcon;
  final bool isHideRightICon;
  final bool isShowTitle;
  final String title;
  final bool isFav;
  final EdgeInsetsGeometry? margin;

  const CommonAppBar({
    Key? key,
    this.isHideLeftIcon = false,
    this.isHideRightICon = false,
    this.isShowTitle = false,
    this.title = "",
    this.isFav = false,
    this.margin
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: isShowTitle? appColors.appBgColor1.withOpacity(0.15): Colors.white,
      // margin: isShowTitle ? EdgeInsets.only(left: 0, right: 0) : EdgeInsets.only(left: 20, right: 20),
      margin: margin ?? EdgeInsets.only(left: 0, right: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isHideLeftIcon ? Container():
          GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
              FocusScope.of(context).unfocus();
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
          isShowTitle ? Center(
            child: Align(
              alignment: Alignment.center,
              child: Text(this.title,
              style: appStyles.commonAppBarTitleTextStyle()),
            ),
          ) : Container(),
          isHideRightICon? Container():
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(right: 10, top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: appColors.appBgColor1.withOpacity(0.60)
            ),
            child: FavoriteButton(
              isFavorite: isFav,
              iconDisabledColor: appColors.black.withOpacity(0.60),
              valueChanged: (_isFavorite) {
                print('Is Favorite : $_isFavorite');
              },
            ),
          ),
        ],
      ),
    );
  }
}