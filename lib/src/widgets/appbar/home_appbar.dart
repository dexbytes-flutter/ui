import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  final callbackFunction;
  final profileCallBack;
  HomeAppBar({
    Key? key,
    this.callbackFunction,
    this.profileCallBack
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: appColors.appBgColor1.withOpacity(0.15),
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              this.callbackFunction?.call();
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.brown.withOpacity(0.30)
              ),
              child: iconApps.iconImage(imageUrl: iconApps.dashboardIcon,
                iconSize: Size(20,20),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              this.profileCallBack?.call();
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child:  CachedNetworkImage(
                imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-zsO-WB5sqXt2_4XGhgNqeecBwQ2dm2dTFcV4NBR0hBIK9nlKRuIz8HUwEo-eEteJBm4&usqp=CAU",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
