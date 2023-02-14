import 'package:base_flutter_app/src/all_file_import/app_providers_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/helper/local_constant.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/profile_list_tile_model.dart';
import 'package:base_flutter_app/src/pages/sign_in_screen.dart';
import 'package:base_flutter_app/src/widgets/alerts/exit_conformation_alert.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_left_icon_title.dart';
import 'package:base_flutter_app/src/pages/payment_methods_card.dart';
import 'package:base_flutter_app/src/widgets/profile_list_tile.dart';
import 'package:base_flutter_app/src/pages/myorder_screen.dart';
import 'package:base_flutter_app/src/pages/profile_tile_notification_screen.dart';
import 'package:base_flutter_app/src/widgets/write_to_us.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../all_file_import/app_widget_files_link.dart';
import '../widgets/appbar/common_app_bar.dart';
import '../widgets/appbar/common_app_bar_new.dart';
import 'about_screen.dart';
import 'edit_profile_bottom_sheet.dart';
import 'faq_screen.dart';

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
              widget: MyOrderScreen()),
        );
      }else if(index == 1){
        Navigator.push(
          MainAppBloc.getDashboardContext,
          SlideRightRoute(
              widget: PaymentMethodScreen()),
        );
      }else if(index == 2){
        Navigator.push(
          MainAppBloc.getDashboardContext,
          SlideRightRoute(
              widget: ProfileTileNotificationScreen()),
        );
      }else if(index == 3){
        Navigator.push(
          MainAppBloc.getDashboardContext,
          SlideRightRoute(
              widget: FaqScreen()
          ),
        );

      }else if(index == 4){
        ExitConformationAlert(
            context: context,
            msg: appString.trans(context, appString.logoutConfirmation),
            callback: (contextTemp) async {
              sharedPreferencesFile.clearAll();
              sharedPreferencesFile.saveBool(isUserLoggedInC, false);
              Navigator.pushAndRemoveUntil(MainAppBloc.getDashboardContext, MaterialPageRoute(builder: (BuildContext context){
                return SignInScreen();
              }), (route) => false);
              Fluttertoast.showToast(msg: appString.trans(context, appString.loggedOutSuccessfully),
                backgroundColor: appColors.editTextErrorColor,
                textColor: appColors.textNormalColor,
              );
            }, noCallback: (contextTemp){
          Navigator.pop(contextTemp);
        });
      }
    }

    // Top profile detail view
    Widget profileDetailCard(){
      return Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(left: 20,right: 20,top: 15),
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
                    Text(appString.trans(context, appString.nameTitleText),
                    style: appStyles.commonCardTitleTextStyle(
                      fontSize: 12.5
                    ),
                    ),
                    SizedBox(height: 5,),
                    Text("Kate",
                      // appColors.textNormalColor1
                    style: appStyles.commonCardTitleTextStyle(
                      texColor:  appColors.textNormalColor1
                    ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => EditProfileBottomSheetScreen(),
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))
                        ));
                  },
                  child: iconApps.iconImage(imageUrl: iconApps.editIcon,
                      iconSize: Size(20,20),
                      imageColor: appColors.iconColor3
                  ),
                )
              ],
            ),
            SizedBox(height: 10,),
            Text(appString.trans(context, appString.phoneNumberTitleText),
            style: appStyles.commonCardTitleTextStyle(
                fontSize: 12.5
            ),
            ),
            SizedBox(height: 5,),
            Text("+375 (44) 768-15-93",
            style: appStyles.commonCardTitleTextStyle(
                texColor:  appColors.textNormalColor1
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
        statusBarColor: appColors.appThemeColor1,
        isSingleChildScrollViewNeed: true,
        isFixedDeviceHeight: true,
        appBarHeight: 56,
        appBar: CommonAppBarNew(
          isHideRightICon: true,
          appBarColor: appColors.appThemeColor1,
          title: appString.trans(context, appString.profileAppBarText),
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
