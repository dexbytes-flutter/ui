import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/profile_list_tile_model.dart';
import 'package:base_flutter_app/src/widgets/profile_list_tile.dart';
import 'package:flutter/material.dart';

import '../all_file_import/app_widget_files_link.dart';
import '../widgets/appbar/common_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {



  @override
  Widget build(BuildContext context) {

    // Top profile detail view
    Widget profileDetailCard(){
      return Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(left: 20,right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: appColors.containerBgColor
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name",
                    style: TextStyle(
                      color: appColors.textColor, fontSize: 13, fontWeight: FontWeight.w500,
                    ),
                    ),
                    SizedBox(height: 5,),
                    Text("Kate",
                    style: TextStyle(
                        color: appColors.textNormalColor1,fontWeight: FontWeight.w500,
                        fontSize: 15
                    ),
                    )
                  ],
                ),
                iconApps.iconImage(imageUrl: iconApps.editIcon,
                  iconSize: Size(20,20),
                  imageColor: appColors.iconColor2
                )
              ],
            ),
            SizedBox(height: 10,),
            Text("Phone number",
            style: TextStyle(
              color: appColors.textColor, fontSize: 13, fontWeight: FontWeight.w500,
            ),
            ),
            SizedBox(height: 5,),
            Text("+375 (44) 768-15-93",
            style: TextStyle(
              color: appColors.textNormalColor1,fontWeight: FontWeight.w500,
              fontSize: 15
            ),
            )
          ],
        ),
      );
    }

    // Profile list
    Widget profileListTile(){
      return ListView.builder(
          padding: EdgeInsets.only(bottom: 15),
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: profileItemListTile.length,
          itemBuilder: (context,index){
            return ProfileListTile(
              profileListTileIcon: profileItemListTile[index].profileListTileIcon,
              profileListTileTitle: profileItemListTile[index].profileListTileTitle,
              index: index,
            );
          }
      );
    }
    
    return ContainerFirst(
        contextCurrentView: context,
        isSingleChildScrollViewNeed: true,
        isFixedDeviceHeight: true,
        appBarHeight: 56,
        appBar: CommonAppBar(
          isHideLeftIcon: true,
          isHideRightICon: true,
          isShowTitle: true,
          title: "Profile",
        ),
        containChild: Column(
          children: [
            profileDetailCard(),
            profileListTile()
          ],
        ),
    );
  }
}
