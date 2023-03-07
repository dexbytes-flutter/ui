import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/bookmark_button.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget {
  final bool isHideLeftIcon;
  final bool isHideRightIcon;
  final bool? isShowTitle;
  final String title;
  final Color? appBarColor;
  final EdgeInsetsGeometry? leftIconMargin;
  final EdgeInsetsGeometry? rightIconMargin;
  final bool? isBookMarked;
  final EdgeInsetsGeometry? appBarRowMargin;
  const CommonAppBar({
    Key? key,
    this.isHideLeftIcon = false,
    this.isShowTitle,
    this.title = "",
    this.appBarColor,
    this.leftIconMargin,
    this.rightIconMargin,
    this.isHideRightIcon = false,
    this.isBookMarked,
    this.appBarRowMargin
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: appBarRowMargin ?? EdgeInsets.zero,
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
                    iconSize: Size(28,28),
                    imageColor: appColors.textNormalColor,
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
                    isShowTitle!
                        ? iconApps.iconImage(imageUrl: iconApps.locationIcon,
                        iconSize: Size(20,20),
                        imageColor: appColors.appBarTextColor)
                        : Padding(
                          padding: const EdgeInsets.only(bottom: 30,right: 20),
                          child: BookmarkButton(
                      isFavorite: isBookMarked,
                      iconDisabledColor: appColors.appBgColorLeanWhite.withOpacity(0.40),
                      valueChanged: (_isFavorite) {
                          print('Is Favorite : $_isFavorite');
                      },
                    ),
                        )
                    ,
                    SizedBox(width: isShowTitle! ? 5 : 0,),
                    isShowTitle!
                        ? Center(
                        child:
                        Text(title, style: appStyles.commonAppBarTextTextStyle()
                        )
                    )
                        : Container(),
                  ]
              ),
            ),
          ],
        ),
      );
  }
}