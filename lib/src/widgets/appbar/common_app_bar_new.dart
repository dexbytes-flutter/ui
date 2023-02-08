import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:flutter/material.dart';

class CommonAppBarNew extends StatelessWidget {
  final bool isHideLeftIcon;
  final bool isHideRightICon;
  final bool isShowTitle;
  final String title;
  const CommonAppBarNew({
    Key? key,
    this.isHideLeftIcon = false,
    this.isHideRightICon = false,
    this.isShowTitle = false,
    this.title = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Stack(
          children: [
            isHideLeftIcon ? Container() :
            Positioned(
              left: 15,
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: iconApps.iconImage(imageUrl: iconApps.backArrowIcon,
                    iconSize: Size(20,20),
                  ),
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Text(title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),)
                ]
            ),
            isHideRightICon? Container() :
            Positioned(
              right: 15,
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: iconApps.iconImage(imageUrl: iconApps.rightArrow1,
                  iconSize: Size(20,20),
                ),
              ),
            ),
          ],
        )
    );
  }
}
