import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:flutter/material.dart';

class CustomPaymentCardView extends StatelessWidget {
  final String balanceAmount;
  final String nameOnCard;
  final String ccvNumber;
  final int cardNumber;
  final String cardTypeLogo;

  const CustomPaymentCardView(
      {Key? key,
        required this.balanceAmount,
        required this.nameOnCard,
        required this.ccvNumber,
        required this.cardNumber,
        required this.cardTypeLogo
       })
      : super(key: key);
  @override
  Widget build(BuildContext context) {

    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);

    return Container(
      height: appDimens.heightFullScreen()/4.35,
      width: appDimens.widthFullScreen(),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: appColors.appBgColor2
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(appString.trans(context, appString.balancePaymentCardText),
          style: appStyles.commonSubTitleTextStyle(fontSize: 14,texColor: appColors.buttonBgColor,
            fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Text("\$ $balanceAmount",
              style: appStyles.commonTitleStyle(fontSize: 24,fontWeight: FontWeight.w500,
              ),),
              iconApps.iconImage(
                  imageUrl: cardTypeLogo,
                iconSize: Size(35, 35)
              )
          ],),
          SizedBox(height: 30,),
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

    /*Container(
        width: appDimens.widthFullScreen(),
        margin: EdgeInsets.only(bottom: 18,left: 10,right: 10),
        decoration: BoxDecoration(
          color: appColors.grey,
          borderRadius: BorderRadius.circular(23),
        ),
        child: Stack(
          children: [
            Positioned(
                top: 1,
                right: 0,
                child:ClipRRect(
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(23)),
                  child:iconApps.iconImage(
                      imageUrl: iconApps.cardTopIcon,
                      iconSize: Size(appDimens.widthFullScreen()/9.8, appDimens.heightFullScreen()/9.8)
                  ),
                )),
            Positioned(
                bottom: 1,
                right: 1,
                child:ClipRRect(
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(23)),
                  child:iconApps.iconImage(
                      imageUrl: iconApps.cardBottomIcon,
                      iconSize: Size(appDimens.widthFullScreen()/15, appDimens.heightFullScreen()/9)
                  ),
                )),
            Positioned(
                bottom: 25,
                right: 1,
                child:Container(
                  height: 45,width: 75,
                  padding: EdgeInsets.all(5.5).copyWith(left: 0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft:Radius.circular(30) ),
                      color: Color(0xFF0562F0)
                  ),
                  child: iconApps.iconImage(imageUrl: iconApps.masterCardImage,),
                )
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 18.0,top: 20),
                  child: Text(cardHolderName!,
                    textAlign: TextAlign.center,
                    style: appStyles.onBoardingTitleStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      texColor:Colors.white,
                    ),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 18.0,top: 20),
                  child: Text("●●●● ●●●● ●●●● 5318",
                    textAlign: TextAlign.center,
                    style: appStyles.onBoardingTitleStyle(
                      fontSize: 16.5,
                      letterSpacing: 1.3,
                      fontWeight: FontWeight.w600,
                      texColor:Colors.white,
                    ),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 18.0,top: 35),
                  child: Text("Balance",
                    textAlign: TextAlign.center,
                    style: appStyles.onBoardingTitleStyle(
                      fontSize: 14,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w400,
                      texColor:Colors.white,
                    ),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 18.0,top: 5),
                  child: Text("\₹15,236.00",
                    textAlign: TextAlign.center,
                    style: appStyles.commonSubTitleTextStyle(),),
                ),

              ],
            ),
          ],
        )
    );*/
  }
}
