import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar.dart';
import 'package:flutter/material.dart';

import 'appbar/appbar_with_left_icon_title.dart';

class PaymentMethodsCard extends StatefulWidget {
  const PaymentMethodsCard({Key? key}) : super(key: key);

  @override
  State<PaymentMethodsCard> createState() => _PaymentMethodsCardState();
}

class _PaymentMethodsCardState extends State<PaymentMethodsCard> {
  @override
  Widget build(BuildContext context) {

    return ContainerFirst(
      contextCurrentView: context,
      appBarHeight: 48,
      appBar: CommonAppBarWithLeftIconTitle(
        title:"Payment Method",
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
                    Text("Pay")
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
                Text("Card"),
                Row(
                  children: [
                    iconApps.iconImage(
                        imageUrl: iconApps.visaIcon,
                      iconSize: Size(30, 30)
                    ),
                    SizedBox(width: 5,),
                    Text("--4596")
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
