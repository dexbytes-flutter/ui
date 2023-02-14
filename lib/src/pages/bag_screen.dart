import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar_new.dart';
import 'package:base_flutter_app/src/widgets/order_card_list.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {

    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);

    Widget chargesCard(){
      return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(appString.trans(context, appString.deliveryChargesText),
                style: appStyles.commonCardTitleTextStyle(texColor: appColors.textNormalColor1),),
                SizedBox(width: 30,),
                Text("₹10.00",
                style: appStyles.commonCardTitleTextStyle(texColor: appColors.textNormalColor1),)
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(appString.trans(context, appString.subtotalText),
              style: appStyles.commonCardTitleTextStyle(texColor: appColors.textNormalColor1),
              ),
                SizedBox(width: 30,),
                Text("₹26.35",
                style: appStyles.commonCardTitleTextStyle(texColor: appColors.textNormalColor1),)
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(appString.trans(context, appString.totalText),
              style: appStyles.commonCardTitleTextStyle(texColor: appColors.textNormalColor1),
              ),
                SizedBox(width: 30,),
                Text("₹36.35",
                    style: appStyles.commonCardTitleTextStyle(texColor: appColors.textNormalColor1)
                )
              ],
            )
          ],
        ),
      );
    }

    return ContainerFirst(
        contextCurrentView: context,
        isSingleChildScrollViewNeed: true,
        isFixedDeviceHeight: true,
        appBarHeight: 56,
        statusBarColor: appColors.appThemeColor1,
        appBar: CommonAppBarNew(
          appBarColor: appColors.appThemeColor1,
          isHideLeftIcon: true,
          isHideRightICon: true,
          title: appString.trans(context, appString.bagAppBarTitle),
        ),
        containChild: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            OrderCardList(),
            SizedBox(height: 10,),
            chargesCard(),
            SizedBox(height: 25,),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,bottom: 40),
                child: CommonButton(
                  buttonColor: appColors.appButtonColor,
                  buttonName: appString.trans(context, appString.checkoutButtonTitle),
                  buttonHeight: 50,
                  buttonBorderRadius: 12,
                  isBottomMarginRequired: false,
                  textStyle: appStyles.commonButtonTitleTextTextStyle(),
                  backCallback: (){
                    /*if(_validateFields(isButtonClicked: true)){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                  return OtpVerificationScreen(
                    isSignInScreen: this.isSignInScreen,
                  );
                }), (route) => false);
              }*/
                  },
                ),
              ),
            ),
            SizedBox(height: 30,),
          ],
        ),
    );
  }
}
