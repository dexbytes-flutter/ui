import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomPaymentCardView extends StatelessWidget {
  final String balanceAmount;
  final String nameOnCard;
  final String ccvNumber;
  final int cardNumber;
  final String cardTypeLogo;
  final bool paymentCardSelect;
  final int selectedIndex;
  final int index;
  final Color? logoColor;

  const CustomPaymentCardView(
      {Key? key,
        required this.balanceAmount,
        required this.nameOnCard,
        required this.ccvNumber,
        required this.cardNumber,
        required this.cardTypeLogo,
        required this.paymentCardSelect,
        required this.selectedIndex,
        required this.index,
        this.logoColor
      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {

    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);

    return Container(
      height: appDimens.heightFullScreen()/5.25,
      width: appDimens.widthFullScreen(),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: appColors.appBgColor2,
          border: Border.all(color: index == selectedIndex ? paymentCardSelect == false ? appColors.appTransColor : appColors.buttonBgColor : appColors.appTransColor,
             )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(appString.trans(context, appString.balancePaymentCardText),
            style: appStyles.commonSubTitleTextStyle(fontSize: 11,texColor: appColors.buttonBgColor,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 2,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("\$ $balanceAmount",
                style: appStyles.commonTitleStyle(fontSize: 20,fontWeight: FontWeight.w500,
                ),),
              CachedNetworkImage(
                imageUrl: cardTypeLogo,
                height: 30,
                width: 30,
                color: logoColor != null? appColors.white : null,
              )
            ],),
          SizedBox(height: 45,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(nameOnCard,style: appStyles.commonSubTitleTextStyle(
                  fontSize: 11, fontWeight: FontWeight.w500
              ),
              ),
              Text(appString.trans(context, appString.cvvText),style: appStyles.commonSubTitleTextStyle(
                  fontSize: 11, fontWeight: FontWeight.w500
              ))
            ],
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("•••• •••• •••• $cardNumber",
                textAlign: TextAlign.center,
                style: appStyles.commonSubTitleTextStyle(
                    fontWeight: FontWeight.w600,fontSize: 14
                ),),
              Text(ccvNumber,style: appStyles.commonSubTitleTextStyle(
                  fontWeight: FontWeight.w600,fontSize: 14
              ))
            ],
          )
        ],
      ),
    );
  }
}
