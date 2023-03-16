import 'package:base_flutter_app/src/all_file_import/app_providers_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/model/profile_list_tile_model.dart';
import 'package:base_flutter_app/src/pages/logout_bottomsheet.dart';
import 'package:base_flutter_app/src/pages/registration_screen.dart';
import 'package:base_flutter_app/src/widgets/appbar/home_screen_app_bar.dart';
import 'package:base_flutter_app/src/widgets/profile_tile_view.dart';
import 'package:flutter/material.dart';

import 'book_list_tile_screen.dart';
import 'home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {

    // On profile tile click navigation function
    void redirectTo(index,context) {
      MainAppBloc mainAppBloc = MainAppBloc();
      if(index == 0){
        Navigator.of(context).pop;
      }else if(index == 1){
        /*Navigator.push(
          MainAppBloc.getDashboardContext,
          SlideRightRoute(
              widget: PaymentMethodScreen()),
        );*/
        Navigator.push(
          MainAppBloc.getDashboardContext,
          SlideRightRoute(
              widget: BookListTileScreen()),
        );
      }else if(index == 2){
        /*Navigator.push(
          MainAppBloc.getDashboardContext,
          SlideRightRoute(
              widget: ProfileTileNotificationScreen()),
        );*/
      }else if(index == 3){
        /*Navigator.push(
          MainAppBloc.getDashboardContext,
          SlideRightRoute(
              widget: FaqScreen()
          ),
        );*/

      }else if(index == 5){
        showModalBottomSheet(
            context: MainAppBloc.getDashboardContext,
            builder: (context) => LogOutBottomSheetScreen(),
            isScrollControlled: true,
            backgroundColor: appColors.appBgColorJungleGreen,
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                )
            ));
      }else if(index == 4){

       /* ExitConformationAlert(
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
        });*/
      }
    }

    // Profile list tiles view
    profileListTileView(){
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: ListView.builder(
            itemCount: profileTileList.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context,index){
              return ProfileTileView(
                    title: profileTileList[index].title,
                    index: index,
                    listCallBack: (index){
                      redirectTo(index, context);
                },
              );
            }
        ),
      );
    }

    return ContainerFirst(
        appBarHeight: 56,
        isOverLayStatusBar: false,
        isSingleChildScrollViewNeed: false,
        contextCurrentView: context,
        appBar: HomeScreenAppBar(
          margin: EdgeInsets.only(left: 20,right: 20,top: 2),
          isHideBackIcon: true,
        ),
        containChild: Column(
          children: [
            SizedBox(height: 20,),
            profileListTileView()
          ],
        )
    );
  }
  void redirectTo(value) {
    if(value == "Profile Details"){

      Navigator.push(
        MainAppBloc.getDashboardContext,
        SlideRightRoute(
            widget: HomeScreen()),
      );

    } else if(value == "Settings"){

      /*Navigator.push(
        MainAppBloc.getDashboardContext,
        SlideRightRoute(
            widget: SettingScreen()),
      );*/
    }else if(value == "Orders"){

     /* Navigator.push(
        MainAppBloc.getDashboardContext,
        SlideRightRoute(
            widget: MyOrderScreen()),
      );*/
    }else if(value == "Coupons"){

      /*Navigator.push(
        MainAppBloc.getDashboardContext,
        SlideRightRoute(
            widget: CouponsScreen()),
      );*/
    }else if(value == "FAQs"){

     /* Navigator.push(
        MainAppBloc.getDashboardContext,
        SlideRightRoute(
            widget: FaqScreen()),
      );*/
    }else if(value == "About Us"){

      /*Navigator.push(
        MainAppBloc.getDashboardContext,
        SlideRightRoute(
            widget: AboutUs()),
      );*/
    }else if(value == "Address"){

      // Navigator.push(
      //   MainAppBloc.getDashboardContext,
      //   SlideRightRoute(
      //       widget: ShippingAddressScreen(appBarTitle: "Addresses",)),
      // );
    }

  }
}
