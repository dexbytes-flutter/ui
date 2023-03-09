import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeScreenAppBar extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool? isHideBackIcon;

  const HomeScreenAppBar({
    Key? key, this.padding,
    this.margin, this.isHideBackIcon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: padding??EdgeInsets.zero,
      margin: margin??EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(isHideBackIcon! ? 25: 10),
                decoration: BoxDecoration(
                  color: appColors.appBgColorLeanWhite,
                  borderRadius: BorderRadius.circular(isHideBackIcon! ? 25 : 15)
                ),
                child: iconApps.iconImage(
                    imageUrl: iconApps.appBarProfileIcon,
                    imageColor: appColors.appBgColor6,
                    iconSize: Size(isHideBackIcon! ? 30 : 20, isHideBackIcon! ? 30 : 20)
                ),
              ),
              SizedBox(width: 15,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(isHideBackIcon! ? "Evelyn" : appString.trans(context, appString.welcomeText),
                    style: appStyles.commonSubTitleTextStyle(fontSize: isHideBackIcon! ? 20 : 10,
                        texColor: isHideBackIcon! ? appColors.textNormalColor : appColors.textColor,
                      fontWeight: isHideBackIcon! ? FontWeight.w600 : FontWeight.w400
                    ),
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      isHideBackIcon!?Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: appColors.white),
                            borderRadius: BorderRadius.circular(3)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: CachedNetworkImage(
                            imageUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
                            fit: BoxFit.cover,
                            height: 10,
                            width: 10,
                          ),
                        ),
                      ):Container(),
                      SizedBox(width: isHideBackIcon!? 5 : 0,),
                      Text(isHideBackIcon! ? "Jakarta Indonesia" : "Evelyn",
                      style: appStyles.commonTitleStyle(fontSize: isHideBackIcon! ? 10 : 15,
                      texColor: isHideBackIcon! ? appColors.textColor : appColors.textNormalColor
                      ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          isHideBackIcon!
              ? Container()
              : iconApps.iconImage(
              imageUrl: iconApps.dashboardIcon,
              imageColor: appColors.appBgColor1.withOpacity(0.30),
              iconSize: Size(25, 25)
          )
        ],
      ),
    );
  }
}
