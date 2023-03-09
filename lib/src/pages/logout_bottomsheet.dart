import 'package:base_flutter_app/src/all_file_import/app_providers_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/helper/local_constant.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/pages/login_screen.dart';
import 'package:base_flutter_app/src/widgets/bottom_sheet_dynamic_height_card.dart';
import 'package:flutter/material.dart';

class LogOutBottomSheetScreen extends StatefulWidget {
  const LogOutBottomSheetScreen({Key? key,}) : super(key: key);
  @override
  _LogOutBottomSheetScreenState createState() => _LogOutBottomSheetScreenState();
}

class _LogOutBottomSheetScreenState extends State<LogOutBottomSheetScreen> {

  TextEditingController inputController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    MainAppBloc mainAppBloc = MainAppBloc();

    _topTextView() {
      return Container(
        color: Colors.transparent,
        margin: EdgeInsets.only(left: 22,right: 22,),
        child:Row(
          children: [
            iconApps.iconImage(
              imageUrl: iconApps.bookmarkIcon,
              imageColor:Colors.red.shade600,
              iconSize: Size(22, 22),
            ),
            SizedBox(width: 12,),
            Text(appString.trans(context, appString.logout),
              style: appStyles.logOutBottomSheetHeadingTextStyle(),
            ),
          ],
        ),
      );
    }


    logoutConfirmationOptionButtons() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20,top: 20),
            width: 160,
            child: CommonButton(
              buttonName: appString.trans(context, appString.noButtonText),
              buttonHeight: 50,
              buttonBorderRadius: 18,
              isBottomMarginRequired: false,
              textStyle: appStyles.buttonNameStyle(fontSize: 15,),
              backCallback: () {
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(width: 15,),
          Container(
            margin: EdgeInsets.only(right: 20,top: 25),
            width: 160,
            child: CommonButton(
              buttonName: appString.trans(context, appString.yesButtonText),
              buttonHeight: 50,
              buttonBorderRadius: 18,
              isBottomMarginRequired: false,
              textStyle: appStyles.buttonNameStyle(
                fontSize: 15,
              ),
              backCallback: () {
                sharedPreferencesFile.clearAll();
                sharedPreferencesFile.saveBool(isUserLoggedInC, false);
                Navigator.push(
                  context,
                  SlideRightRoute(widget: SignInScreen()),
                );
              },
            ),
          ),
        ],
      );
    }

      return BottomSheetDynamicHeightCardView(
        cardBackgroundColor: appColors.appBgColorJungleGreen,
        bottomSheetHeight: appDimens.heightFullScreen()/3.85,
        topLineShow: true,
        bottomSheetBorderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
        sheetTitle: appString.trans(context, appString.logoutConfirmationText),
        sheetTitleStyle: appStyles.logOutBottomSheetSubHeadingTextStyle(
          fontSize: 20
        ),
        child: logoutConfirmationOptionButtons()
      );
    }
}