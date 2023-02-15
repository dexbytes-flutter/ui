import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/my_orders_card_model.dart';
import 'package:flutter/material.dart';

class ActualOrder extends StatefulWidget {
  final int selectedIndex;
  final int listIndex;
  const ActualOrder({
    Key? key,
    this.selectedIndex = 0,
    this.listIndex = 0
  }) : super(key: key);

  @override
  State<ActualOrder> createState() => _ActualOrderState();
}

class _ActualOrderState extends State<ActualOrder> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    Widget repeatButton(){
      return CommonButton(
        buttonColor: appColors.appButtonColor,
        buttonName: "Repeat order",
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
      );
    }

      return widget.selectedIndex == 1
          ? Container(
        margin: EdgeInsets.only(left: 20,right: 20, bottom: 20),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Order No.${pastOrderList[widget.listIndex].orderNumber}",
                  style: TextStyle(
                      fontSize: 15,fontWeight: FontWeight.w500, color: appColors.textNormalColor1
                  ),
                ),
                Text(pastOrderList[widget.listIndex].orderStatus,
                    style: TextStyle(
                      fontSize: 13,fontWeight: FontWeight.w500,
                      color: appColors.textNormalColor7,
                    )
                )
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("${pastOrderList[widget.listIndex].numberOfItems} items",
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,
                    color: appColors.textColorBlue,
                    // decoration: TextDecoration.underline,
                    // decorationStyle: TextDecorationStyle.dashed,
                  ),
                ),
                Text("${pastOrderList[widget.listIndex].orderTrackId} BYN",
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,
                      color: appColors.textNormalColor1.withOpacity(0.65)),
                )
              ],
            ),
            SizedBox(
              child:Divider(
                color: Colors.grey.withOpacity(0.20),
                height: 36,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                iconApps.iconImage(
                    imageUrl: pastOrderList[widget.listIndex].locationIcon,
                    iconSize: Size(20, 20),
                    imageColor: Colors.grey.shade300
                ),
                SizedBox(width: 10,),
                Text(pastOrderList[widget.listIndex].address,
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,
                      color: appColors.textNormalColor1.withOpacity(0.65)),
                )
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                iconApps.iconImage(
                    imageUrl: pastOrderList[widget.listIndex].calendarIcon,
                    iconSize: Size(18, 20),
                    imageColor: Colors.grey.shade300
                ),
                SizedBox(width: 10,),
                Text(pastOrderList[widget.listIndex].orderDate,
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,
                      color: appColors.textNormalColor1.withOpacity(0.65)),
                )

              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                iconApps.iconImage(
                    imageUrl: pastOrderList[widget.listIndex].clockIcon,
                    iconSize: Size(20, 20),
                    imageColor: Colors.grey.shade300
                ),
                SizedBox(width: 10,),
                Text(pastOrderList[widget.listIndex].orderTime,
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,
                      color: appColors.textNormalColor1.withOpacity(0.65)),
                )
              ],
            ),
            SizedBox(height: 20),
           repeatButton(),
            SizedBox(height: 5),
          ],
        ),
      )
          :
          Container(
        margin: EdgeInsets.only(left: 20,right: 20, bottom: 20),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Order No.${actualOrderList[widget.listIndex].orderNumber}",
                  style: TextStyle(
                      fontSize: 15,fontWeight: FontWeight.w500, color: appColors.textNormalColor1
                  ),
                ),
                Text(actualOrderList[widget.listIndex].orderStatus,
                    style: TextStyle(
                      fontSize: 13,fontWeight: FontWeight.w500,
                      color: appColors.textColorBlue,
                    )
                )
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("${actualOrderList[widget.listIndex].numberOfItems} items",
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,
                    color: appColors.textColorBlue,
                    // decoration: TextDecoration.underline,
                    // decorationStyle: TextDecorationStyle.dashed,
                  ),
                ),
                Text("${actualOrderList[widget.listIndex].orderTrackId} BYN",
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,
                      color: appColors.textNormalColor1.withOpacity(0.65)),
                )
              ],
            ),
            SizedBox(
              child:Divider(
                color: Colors.grey.withOpacity(0.20),
                height: 36,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                iconApps.iconImage(
                    imageUrl: actualOrderList[widget.listIndex].locationIcon,
                    iconSize: Size(20, 20),
                    imageColor: Colors.grey.shade300
                ),
                SizedBox(width: 10,),
                Text(actualOrderList[widget.listIndex].address,
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,
                      color: appColors.textNormalColor1.withOpacity(0.65)),
                )
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                iconApps.iconImage(
                    imageUrl: actualOrderList[widget.listIndex].calendarIcon,
                    iconSize: Size(18, 20),
                    imageColor: Colors.grey.shade300
                ),
                SizedBox(width: 10,),
                Text(actualOrderList[widget.listIndex].orderDate,
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,
                      color: appColors.textNormalColor1.withOpacity(0.65)),
                )

              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                iconApps.iconImage(
                    imageUrl:  actualOrderList[widget.listIndex].clockIcon,
                    iconSize: Size(20, 20),
                    imageColor: Colors.grey.shade300
                ),
                SizedBox(width: 10,),
                Text(actualOrderList[widget.listIndex].orderTime,
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,
                      color: appColors.textNormalColor1.withOpacity(0.65)),
                )
              ],
            ),
            SizedBox(height: 10,),
          ],
        ),
      );
    }
}
