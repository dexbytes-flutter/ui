import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar.dart';
import 'package:base_flutter_app/src/widgets/order_card_list.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
                Text("Delivery Charges",
                style: TextStyle(
                  color: appColors.textNormalColor1,fontSize: 15,fontWeight: FontWeight.w500
                ),),
                SizedBox(width: 30,),
                Text("₹10.00",
                style: TextStyle(
                  color: appColors.textNormalColor1,fontSize: 15,fontWeight: FontWeight.w500
                ),)
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("Subtotal",
              style: TextStyle(
                color: appColors.textNormalColor1,fontSize: 15,fontWeight: FontWeight.w500
              ),
              ),
                SizedBox(width: 30,),
                Text("₹26.35",
                style: TextStyle(
                  color: appColors.textNormalColor1,fontSize: 15,fontWeight: FontWeight.w500
                ),)
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("Total",
              style: TextStyle(
                color: appColors.textNormalColor1, fontSize: 15,fontWeight: FontWeight.w500
              ),
              ),
                SizedBox(width: 30,),
                Text("₹36.35",
                    style: TextStyle(
                        color: Colors.black, fontSize: 15,fontWeight: FontWeight.w500
                    )
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
        appBar: CommonAppBar(
          isHideLeftIcon: true,
          isHideRightICon: true,
          isShowTitle: true,
          title: "Bag",
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
                  buttonName: "Checkout",
                  buttonHeight: 50,
                  buttonBorderRadius: 12,
                  isBottomMarginRequired: false,
                  textStyle: TextStyle(fontSize:16, fontWeight: FontWeight.w700,color: Colors.grey.shade200 ),
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
