import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar/common_app_bar.dart';

class BookingCancellationScreen extends StatefulWidget {
  const BookingCancellationScreen({Key? key}) : super(key: key);

  @override
  State<BookingCancellationScreen> createState() => _BookingCancellationScreenState();
}

class _BookingCancellationScreenState extends State<BookingCancellationScreen> {
  @override
  Widget build(BuildContext context) {

    // Screen title
    Widget screenTitle(){
      return Padding(
        padding: const EdgeInsets.only(top: 30,left: 20,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(appString.trans(context, appString.bookingCancellationText),
                textAlign: TextAlign.left,
                style: appStyles.commonTitleStyle(fontSize: 38)),
            SizedBox(height: 15,),
            Text(appString.trans(context, appString.bookingCancellationSubTitleText),
                style: appStyles.commonSubTitleTextStyle(fontSize: 15)),
            SizedBox(height: 50,),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2.5,color: appColors.appBgColor1
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CachedNetworkImage(
                    imageUrl: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQQ9j9GWnKtl9xJjLvEPREdCFlkLjl2XKmMdQKOAnnyLmCO_Moo",
                    fit: BoxFit.cover,
                    height: 130,
                    width: 130,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Center(
              child: Text("Borobudur \nTemple",
                textAlign: TextAlign.center,
                style: appStyles.commonTitleStyle(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: appColors.white),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: CachedNetworkImage(
                          imageUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
                          fit: BoxFit.cover,
                          height: 12,
                          width: 12,
                        ),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Text("Indonesia",
                      style: appStyles.commonSubTitleTextStyle(fontSize: 11,fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Container(
                  height: 30,
                  margin: EdgeInsets.only(left: 10,right: 10),
                  child: VerticalDivider(
                    width: 0,
                    thickness: 1,
                    endIndent: 4,
                    indent: 5,
                    color: Colors.grey.shade600,
                  ),
                ),
                iconApps.iconImage(
                    imageUrl: iconApps.calendarIcon,
                    imageColor: appColors.white,
                    iconSize: Size(12, 15)
                ),
                SizedBox(width: 5,),
                Text("July 21 2023",
                style: appStyles.commonSubTitleTextStyle(fontSize: 11,fontWeight: FontWeight.w600),
                )
              ],
            ),
            SizedBox(height: 38,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: appColors.appBgColor2
                  ),
                  child: Center(
                    child: Text(
                      appString.trans(context, appString.closeButtonText),
                      style: appStyles.commonTitleStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Container(
                  width: 160,
                  child: CommonButton(
                    buttonName: appString.trans(context, appString.cancelBookingButtonText),
                    buttonHeight: 50,
                    buttonBorderRadius: 18,
                    isBottomMarginRequired: false,
                    textStyle: appStyles.buttonNameStyle(),
                    backCallback: () {
                      /*if (_validateFields(isButtonClicked: true)) {
                        // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                        //   return OtpVerificationScreen(
                        //     isSignUpScreen: this.isSignUpScreen,
                        //   );
                        // }), (route) => false);
                      }*/
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return ContainerFirst(
        appBarHeight: 56,
        isOverLayStatusBar: true,
        statusBarColor: Colors.white,
        isSingleChildScrollViewNeed: false,
        contextCurrentView: context,
        appBar: CommonAppBar(
          leftIconMargin: EdgeInsets.only(top: 22, left: 20),
          isHideRightIcon: true,
        ),
        containChild: Column(
          children: [
            screenTitle()
          ],
        )
    );
  }
}
