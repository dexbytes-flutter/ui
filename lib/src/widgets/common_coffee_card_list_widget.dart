import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../all_file_import/app_values_files_link.dart';
import '../image_res/iconApp.dart';

class CommonCoffeeCardList extends StatelessWidget {
  final String imageUrl;
  final String coffeeListTitle;
  final String coffeeListSubTitle;
  final String price;
  const CommonCoffeeCardList({
    Key? key,
    this.imageUrl = "https://images.pexels.com/photos/2396220/pexels-photo-2396220.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    this.coffeeListTitle = "Cappuccino",
    this.coffeeListSubTitle = "With Oat Milk",
    this.price = "4.00"
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);

    return Container(
      width: 130,
      margin: EdgeInsets.only(left:8,right: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 0.8,color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                height: 115,
                width: 130,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 5),
            child: Text(
              coffeeListTitle,
              style: appStyles.commonCardTitleTextStyle(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 5),
            child: Text(
              coffeeListSubTitle,
              style: appStyles.commonCardSubTitleTextStyle(),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12,right: 12,top: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: appString.trans(context, appString.rupeeSignText),
                              style: appStyles.commonCardTitleTextStyle(
                              texColor: appColors.textNormalColor1
                              )
                            ),
                            TextSpan(
                                text: price,
                                style: appStyles.commonCardTitleTextStyle(
                                    texColor: appColors.textNormalColor1
                                ))
                          ])),
                    ],
                  ) ,
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFCB7642),
                            borderRadius: BorderRadius.circular(2)),
                        child: iconApps.iconImage(
                            imageUrl: iconApps.plusIcon,
                            iconSize: Size(20, 20)),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
