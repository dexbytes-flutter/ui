import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:flutter/material.dart';

class ProfileTileView extends StatelessWidget {
  final String title;
  final listCallBack;
  final int index;
  const ProfileTileView({
    Key? key,
    required this.title,
    this.listCallBack,
    this.index = 0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        this.listCallBack?.call(index);
      },
      child: Container(
        // margin: EdgeInsets.all(20),
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            // color: appColors.red
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(title,
                  style: appStyles.commonTitleStyle(fontWeight: FontWeight.w500,
                  texColor: appColors.textColor, fontSize: 14),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: iconApps.iconImage(
                      imageUrl: iconApps.rightAngleArrowIcon,
                      iconSize: Size(20, 20),
                      imageColor: appColors.textColor
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5,left: 20,right: 20),
              child: SizedBox(
                child:Divider(
                  color: appColors.appBgColor1.withOpacity(0.15),
                  height: 20,
                  thickness: 1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
