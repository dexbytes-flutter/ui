import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar.dart';
import 'package:flutter/material.dart';

import '../model/terms_and _services.dart';
import '../values/app_color.dart';

class TermsOfServicesScreen extends StatefulWidget {
  const TermsOfServicesScreen({Key? key}) : super(key: key);

  @override
  State<TermsOfServicesScreen> createState() => _TermsOfServicesScreenState();
}

class _TermsOfServicesScreenState extends State<TermsOfServicesScreen> {
  @override
  Widget build(BuildContext context) {

    // Top view
    Widget topView(){
      return Container(
        margin: EdgeInsets.only(top: 25,left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                  color: appColors.appBgColor2.withOpacity(0.70),
                  borderRadius: BorderRadius.circular(20)),
              child: iconApps.iconImage(
                  imageUrl: iconApps.termsOfServicesIcon,
                  iconSize: Size(20, 20),
                  imageColor: appColors.buttonBgColor.withOpacity(0.45)),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(appString.trans(context, appString.termsOfServices),
                style: appStyles.commonTitleStyle(fontSize: 20,fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: Text(appString.trans(context, appString.lastUpdatedText),
                  style: appStyles.commonSubTitleTextStyle(fontWeight: FontWeight.w600,
                  texColor: appColors.textColor.withOpacity(0.50)
                  ),
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

    // Terms and conditions list
    Widget termsAndConditionsList(){
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 20,right: 20,bottom: 15),
              physics: ClampingScrollPhysics(),
              itemCount: termsAndServicesList.length,
              itemBuilder: (context,index){
               int serieseIndex = index + 1;
              return Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("$serieseIndex. ${termsAndServicesList[index].title}",
                    style: appStyles.commonTitleStyle(
                      fontSize: 18),
                    ),
                    SizedBox(height: 20,),
                    Text("${termsAndServicesList[index].subTitle}",
                    style: appStyles.commonSubTitleTextStyle(
                      texColor: appColors.textColor.withOpacity(0.45)
                    ),
                    )
                  ],
                ),
              );
              }
          ),
          Container(
            margin: EdgeInsets.only(
              top: 10,
              left: 20,
              right: 20,
            ),
            child: CommonButton(
              buttonName: appString.trans(context, appString.iAcceptButtonText),
              buttonHeight: 50,
              buttonBorderRadius: 18,
              isBottomMarginRequired: false,
              textStyle: appStyles.buttonNameStyle(),
              backCallback: (){
                Navigator.of(context).pop();
                /*if(_validateFields(isButtonClicked: true)){
                  // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                  //   return OtpVerificationScreen(
                  //     isSignUpScreen: this.isSignUpScreen,
                  //   );
                  // }), (route) => false);
                }*/
              },
            ),
          ),
          SizedBox(height: 20,)
        ],
      );
    }

    return ContainerFirst(
        appBarHeight: 56,
        isOverLayStatusBar: true,
        appBackgroundColor: appColors.appBgColorJungleGreen,
        statusBarColor: Colors.white,
        isSingleChildScrollViewNeed: true,
        contextCurrentView: context,
        appBar: CommonAppBar(
          leftIconMargin: EdgeInsets.only(top: 22, left: 20),
          isHideRightIcon: true,
        ),
        containChild: Column(
          children: [
            topView(),
            Padding(
              padding: const EdgeInsets.only(top: 35, left: 20,right: 20),
              child: SizedBox(
                child:Divider(
                  color: appColors.appBgColor1.withOpacity(0.30),
                  height: 20,
                ),
              ),
            ),
            termsAndConditionsList()
          ],
        )
    );
  }
}
