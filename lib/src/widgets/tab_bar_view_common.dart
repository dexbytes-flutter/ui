import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/my_orders_card_model.dart';
import 'package:flutter/material.dart';

class ActualOrder extends StatefulWidget {
  final int selectedIndex;
  const ActualOrder({
    Key? key,
    this.selectedIndex = 0
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

      return Container(
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
                Text(widget.selectedIndex == 1 ? "Order No.${pastOrderList[widget.selectedIndex].orderNumber}" : "Order No.${actualOrderList[widget.selectedIndex].orderNumber}",
                  style: TextStyle(
                      fontSize: 15,fontWeight: FontWeight.w500, color: appColors.textNormalColor1
                  ),
                ),
                Text( widget.selectedIndex == 1 ? pastOrderList[widget.selectedIndex].orderStatus : actualOrderList[widget.selectedIndex].orderStatus,
                    style: TextStyle(
                      fontSize: 13,fontWeight: FontWeight.w500,
                      color: widget.selectedIndex == 1 ? appColors.textNormalColor7: appColors.textColorBlue,
                    )
                )
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.selectedIndex == 1 ? "${pastOrderList[widget.selectedIndex].numberOfItems} items": "${actualOrderList[widget.selectedIndex].numberOfItems} items",
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,
                    color: Colors.grey.shade500,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed,
                  ),
                ),
                Text(widget.selectedIndex == 1 ? "${pastOrderList[widget.selectedIndex].orderTrackId} BYN": "${actualOrderList[widget.selectedIndex].orderTrackId} BYN",
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
                    imageUrl: widget.selectedIndex == 1 ? pastOrderList[widget.selectedIndex].locationIcon: actualOrderList[widget.selectedIndex].locationIcon,
                    iconSize: Size(20, 20),
                    imageColor: Colors.grey.shade300
                ),
                SizedBox(width: 10,),
                Text(widget.selectedIndex == 1 ? pastOrderList[widget.selectedIndex].address: actualOrderList[widget.selectedIndex].address,
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
                    imageUrl:  widget.selectedIndex == 1 ? pastOrderList[widget.selectedIndex].calendarIcon: actualOrderList[widget.selectedIndex].calendarIcon,
                    iconSize: Size(18, 20),
                    imageColor: Colors.grey.shade300
                ),
                SizedBox(width: 10,),
                Text(widget.selectedIndex == 1 ? pastOrderList[widget.selectedIndex].orderDate : actualOrderList[widget.selectedIndex].orderDate,
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
                    imageUrl:  widget.selectedIndex == 1 ? pastOrderList[widget.selectedIndex].clockIcon: actualOrderList[widget.selectedIndex].clockIcon,
                    iconSize: Size(20, 20),
                    imageColor: Colors.grey.shade300
                ),
                SizedBox(width: 10,),
                Text(widget.selectedIndex == 1 ? pastOrderList[widget.selectedIndex].orderTime : actualOrderList[widget.selectedIndex].orderTime,
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,
                      color: appColors.textNormalColor1.withOpacity(0.65)),
                )
              ],
            ),
            SizedBox(height: widget.selectedIndex == 1 ? 20 : 10,),
            widget.selectedIndex == 1 ? repeatButton() : Container(),
            SizedBox(height: widget.selectedIndex == 1 ? 5 : 0,),
          ],
        ),
      );
    }
}
