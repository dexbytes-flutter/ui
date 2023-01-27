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

    Widget orderCardListView(){
      return OrderCardList();
    }

    Widget chargesCard(){
      return Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Delivery Charges",
                style: TextStyle(
                  color: Colors.grey.shade500,fontSize: 13,fontWeight: FontWeight.w400
                ),),
                SizedBox(width: 30,),
                Text("\$10.00",
                style: TextStyle(
                  color: Colors.grey.shade500,fontSize: 13,fontWeight: FontWeight.w400
                ),)
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Text("Subtotal",
              style: TextStyle(
                color: Colors.grey.shade500,fontSize: 13,fontWeight: FontWeight.w400
              ),
              ),
                SizedBox(width: 30,),
                Text("\$26.35",
                style: TextStyle(
                  color: Colors.grey.shade500,fontSize: 13,fontWeight: FontWeight.w400
                ),)
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Text("Total",
              style: TextStyle(
                color: Colors.black, fontSize: 14,fontWeight: FontWeight.w400
              ),
              ),
                SizedBox(width: 30,),
                Text("\$36.35",
                    style: TextStyle(
                        color: Colors.black, fontSize: 14,fontWeight: FontWeight.w400
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
        appBackgroundColor: Colors.white,
        // appBackgroundColor: appColors.appBgColor1.withOpacity(0.15),
        isSingleChildScrollViewNeed: true,
        isFixedDeviceHeight: true,
        statusBarColor: appColors.appBgColor1.withOpacity(0.15),
        appBarHeight: 56,
        appBar: CommonAppBar(
          isHideLeftIcon: true,
          isHideRightICon: true,
          isShowTitle: true,
          title: "Bag",
        ),
        containChild: Column(
          children: [
            orderCardListView(),
            SizedBox(
              height: 15,
            ),
            chargesCard(),
            SizedBox(height: 20,),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                child: CommonButton(
                  buttonColor: appColors.appButtonColor,
                  buttonName: "Checkout",
                  buttonHeight: 50,
                  buttonBorderRadius: 12,
                  isBottomMarginRequired: false,
                  textStyle: TextStyle(fontSize:14, fontWeight: FontWeight.w700,color: Colors.grey.shade200 ),
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
            )
          ],
        ),
    );
  }
}
