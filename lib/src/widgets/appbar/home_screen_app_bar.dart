import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:flutter/material.dart';

class HomeScreenAppBar extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const HomeScreenAppBar({
    Key? key, this.padding, this.margin,}) : super(key: key);

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
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: appColors.appBgColorLeanWhite,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: iconApps.iconImage(
                    imageUrl: iconApps.appBarProfileIcon,
                    imageColor: appColors.appBgColor6,
                    iconSize: Size(20, 20)
                ),
              ),
              SizedBox(width: 15,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(appString.trans(context, appString.welcomeText),
                    style: appStyles.commonSubTitleTextStyle(fontSize: 10),
                  ),
                  Text("Evelyn",
                  style: appStyles.commonTitleStyle(fontSize: 15),
                  )
                ],
              )
            ],
          ),
          iconApps.iconImage(
              imageUrl: iconApps.dashboardIcon,
              imageColor: appColors.appBgColor1.withOpacity(0.30),
              iconSize: Size(25, 25)
          )
        ],
      ),
    );
  }
}
