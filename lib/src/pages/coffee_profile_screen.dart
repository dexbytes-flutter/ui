import 'package:base_flutter_app/src/all_file_import/app_providers_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/profile_list_tile_model.dart';
import 'package:base_flutter_app/src/pages/sign_in_screen.dart';
import 'package:base_flutter_app/src/widgets/payment_methods_card.dart';
import 'package:base_flutter_app/src/widgets/profile_list_tile.dart';
import 'package:base_flutter_app/src/widgets/profile_my_orders_tile.dart';
import 'package:base_flutter_app/src/widgets/profile_tile_notification.dart';
import 'package:base_flutter_app/src/widgets/write_to_us.dart';
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

    void redirectTo(index,context) {
      MainAppBloc mainAppBloc = MainAppBloc();
      if(index == 0){
        Navigator.push(
          MainAppBloc.getDashboardContext,
          SlideRightRoute(
              widget: MyOrdersProfileTile()),
        );
      }else if(index == 1){
        Navigator.push(
          MainAppBloc.getDashboardContext,
          SlideRightRoute(
              widget: PaymentMethodsCard()),
        );
      }else if(index == 2){
        Navigator.push(
          MainAppBloc.getDashboardContext,
          SlideRightRoute(
              widget: ProfileTileNotification()),
        );
      }else if(index == 3){
        Navigator.push(
          MainAppBloc.getDashboardContext,
          SlideRightRoute(
              widget: WriteToUs()
          ),
        );

      }else if(index == 4){
        Navigator.push(
          MainAppBloc.getDashboardContext,
          SlideRightRoute(
              widget: SignInScreen()),
        );
      }/*else if(index == "LogOut"){
        ExitConformationAlert(
            context: context,
            msg: appString.trans(context, appString.logoutConfirmation),
            callback: (contextTemp) async {
              mainAppBloc.add(LogOutEvent(context: context));
              await sharedPreferencesFile.clearAll();
              await sharedPreferencesFile.saveBool(isUserLoggedInC, false);
              Navigator.pushAndRemoveUntil(MainAppBloc.getDashboardContext, MaterialPageRoute(builder: (BuildContext context){
                return SignInScreen();
              }), (route) => false);
            }, noCallback: (contextTemp){
          Navigator.pop(contextTemp);
        });
      }*/
    }

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
              listCallBack: (index){
                redirectTo(index,context);
              },
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
