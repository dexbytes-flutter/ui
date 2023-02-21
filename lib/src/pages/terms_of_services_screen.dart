import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar.dart';
import 'package:flutter/material.dart';

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
        margin: EdgeInsets.only(top: 50,left: 20),
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
                style: appStyles.commonTitleStyle(fontSize: 20),
                ),
                SizedBox(height: 5,),
                Text(appString.trans(context, appString.lastUpdatedText),
                style: appStyles.commonSubTitleTextStyle(),
                )
              ],
            )
          ],
        ),
      );
    }
    
    // Terms and conditions list
    Widget termsAndConditionsList(){
      return ListView.builder(
        itemCount: 2,
          itemBuilder: (context,index){
          return Row(
            children: [
              Text(""),
              Text("")
            ],
          );
          }
      );
    }
    return ContainerFirst(
        appBarHeight: -1,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            topView(),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: SizedBox(
                child:Divider(
                  color: appColors.appBgColor1.withOpacity(0.30),
                  height: 60,
                ),
              ),
            ),
          ],
        )
    );
  }
}
