import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/bookmark_button.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget {
  final bool? isHideLeftIcon;
  final bool? isHideRightIcon;
  final Color? appBarColor;
  final bool? isBookMarked;
  final EdgeInsetsGeometry? appBarRowMargin;
  const CommonAppBar(
      {Key? key,
      this.isHideLeftIcon = false,
      this.appBarColor,
      this.isHideRightIcon = false,
      this.isBookMarked,
      this.appBarRowMargin,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: appBarRowMargin ?? EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              FocusScope.of(context).unfocus();
            },
            child: Container(
              child: iconApps.iconImage(
                imageUrl: iconApps.leftArrow,
                iconSize: Size(28, 28),
                imageColor: appColors.textNormalColor,
              ),
            ),
          ),
          isHideRightIcon!
              ? Container()
              : BookmarkButton(
                  isFavorite: isBookMarked,
                  iconDisabledColor:
                      appColors.appBgColorLeanWhite.withOpacity(0.40),
                  valueChanged: (_isFavorite) {
                    print('Is Favorite : $_isFavorite');
                  },
                ),
        ],
      ),
    );
  }
}
