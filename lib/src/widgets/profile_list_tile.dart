import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/app_utility/animation/slide_left_route.dart';
import 'package:base_flutter_app/src/bloc/main_app_bloc/main_app_bloc.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/pages/sign_in_screen.dart';
import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  final String profileListTileIcon;
  final String profileListTileTitle;
  final int index;
  final listCallBack;
  const ProfileListTile({
    Key? key,
    this.profileListTileIcon = "assets/images/order_icon.svg",
    this.profileListTileTitle = "My order",
    this.index = 0,
    this.listCallBack
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return GestureDetector(
          onTap: (){
            this.listCallBack?.call(index);
          },
      child: Container(
          margin: EdgeInsets.only(left: 20,right: 20,top: 15),
          padding: EdgeInsets.all(20),
          decoration: index == 4 ? BoxDecoration(): BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: appColors.containerBgColor
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  iconApps.iconImage(
                    imageUrl: profileListTileIcon,
                    iconSize: Size(20,20),
                    imageColor: index == 4 ? appColors.textColorRed : appColors.iconColor3
                  ),
                  SizedBox(width: 10,),
                  Text(profileListTileTitle,
                  style: TextStyle( color: index == 4 ? appColors.textColorRed: appColors.textNormalColor1,
                    fontSize: 15, fontWeight: FontWeight.w500,),
                  )
                ],
              ),
              index == 4 ? Container() :
              iconApps.iconImage(imageUrl: iconApps.rightArrow1,
                  iconSize: Size(20,20),
                  imageColor: appColors.iconColor2
              ),
            ],
          ),
        ),
    );
  }
}
