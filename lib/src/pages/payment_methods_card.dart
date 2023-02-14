import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar_new.dart';
import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {

    return ContainerFirst(
      contextCurrentView: context,
      appBarHeight: 56,
      statusBarColor: appColors.appThemeColor1,
      appBar: CommonAppBarNew(
        isHideRightICon: true,
        appBarColor: appColors.appThemeColor1,
        title: appString.trans(context, appString.paymentMethodAppBarTitle),
      ),
      containChild: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(20).copyWith(left: 40,right: 40),
            margin: EdgeInsets.only(left: 20,top: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Apple Pay"),
                SizedBox(height: 10,),
                Row(
                  children: [
                    iconApps.iconImage(
                        imageUrl: iconApps.appleIcon,
                      iconSize: Size(20, 20)
                    ),
                    SizedBox(width: 5,),
                    Text(appString.trans(context, appString.payText))
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20).copyWith(left: 40,right: 40),
            margin: EdgeInsets.only(right: 20,top: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(appString.trans(context, appString.cardText)),
                Row(
                  children: [
                    iconApps.iconImage(
                        imageUrl: iconApps.visaIcon,
                      iconSize: Size(30, 30)
                    ),
                    SizedBox(width: 5,),
                    Text("-- 4596")
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
