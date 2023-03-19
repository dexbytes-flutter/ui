import 'package:base_flutter_app/src/all_file_import/app_providers_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/payment_card_list_view.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar.dart';
import 'package:base_flutter_app/src/widgets/common_payment_card_widget.dart';
import 'package:flutter/material.dart';

import 'booking_success_screen.dart';

class SelectPaymentScreen extends StatefulWidget {
  const SelectPaymentScreen({Key? key}) : super(key: key);

  @override
  State<SelectPaymentScreen> createState() => _SelectPaymentScreenState();
}

class _SelectPaymentScreenState extends State<SelectPaymentScreen> {

  bool isCardSelected = false;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    // Screen title text
    screenTitleText(){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Text(appString.trans(context, appString.selectPaymentTitleText),
                softWrap: true,
                textAlign: TextAlign.left,
                style: appStyles.commonTitleStyle(fontSize: 45)),
          ),
          GestureDetector(
            onTap: (){

            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: iconApps.iconImage(
                  imageUrl: "assets/images/add_card_icon.svg",
                  iconSize: Size(25, 25),
                  imageColor: appColors.buttonBgColor
              ),
            ),
          )
        ],
      );
    }

    // Payment cards view
    paymentCardView(){
      return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: paymentCardDetailList.length,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              setState(() {
                selectedIndex = index;
                isCardSelected = true;
              });
            },
            child: Container(
                margin: EdgeInsets.only(bottom: 20),
                child: CustomPaymentCardView(
                  balanceAmount: paymentCardDetailList[index].balanceAmount,
                  nameOnCard: paymentCardDetailList[index].nameOnCard,
                  ccvNumber: paymentCardDetailList[index].ccvNumber,
                  cardNumber: paymentCardDetailList[index].cardNumber,
                  cardTypeLogo: paymentCardDetailList[index].cardTypeLogo,
                  paymentCardSelect: isCardSelected,
                  selectedIndex: selectedIndex,
                  logoColor: paymentCardDetailList[index].logoColor,
                  index: index,
                )
            ),
          );
        },
      );
    }

    // Total text
    totalAmountView(){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            appString.trans(context, appString.totalText),
            style: appStyles.commonSubTitleTextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "\$ 360.0",
            style: appStyles.commonSubTitleTextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600, texColor: appColors.white
            ),
          ),
        ],
      );
    }

    return ContainerFirst(
      appBarHeight: 56,
      isOverLayStatusBar: false,
      isOverLayAppBar: false,
      isSingleChildScrollViewNeed: true,
      isFixedDeviceHeight: false,
      contextCurrentView: context,
      appBar: CommonAppBar(
        isHideRightIcon: true,
      ),
      containChild: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            screenTitleText(),
            paymentCardView(),
            SizedBox(height: 20,),
          ],
        ),
      ),
      bottomMenuView: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: appDimens.heightFullScreen()/6.5,
            width: appDimens.widthFullScreen(),
            color: appColors.appBgColorJungleGreen,
            padding: const EdgeInsets.only(bottom: 20,left: 20,right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                totalAmountView(),
                SizedBox(height: 20,),
                CommonButton(
                  buttonName: appString.trans(context, appString.confirmBookingButtonText),
                  buttonHeight: 50,
                  buttonBorderRadius: 18,
                  isBottomMarginRequired: false,
                  textStyle: appStyles.buttonNameStyle(),
                  backCallback: () {
                    if(isCardSelected){
                      Navigator.push(
                        context,
                        SlideRightRoute(widget: BookingSuccessfulScreen()),
                      );
                    }
                  },
                ),
              ],
            ),
          )
      ),
    );
  }
}
