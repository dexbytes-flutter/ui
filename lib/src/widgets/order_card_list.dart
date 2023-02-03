import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/order_card_model.dart';
import 'counter_button_widget.dart';

class OrderCardList extends StatelessWidget {
  const OrderCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);

    return  ListView.builder(
      physics: ClampingScrollPhysics(),
      itemCount: orderCardList.length,
      shrinkWrap: true,
      itemBuilder: (context,index){
        return Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: 25, right: 25,bottom: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border.all(width: 0.8,color: Colors.grey.shade200),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20)
                    ),
                    child: CachedNetworkImage(
                      imageUrl: orderCardList[index].imageUrl,
                      height: 100,
                      width: 80,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(orderCardList[index].title,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600,
                              color: appColors.textColor.withOpacity(0.80)
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text(orderCardList[index].subTitle,
                            softWrap: true,
                            maxLines: 1,
                            style: TextStyle( fontSize: 12.5,color: Colors.grey.shade500,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 8,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("\$",
                                style: TextStyle(
                                  fontSize: 14,fontWeight: FontWeight.w500,
                                  color: appColors.textColorBlack,
                                ),
                              ),
                              Text(orderCardList[index].price,
                                style: TextStyle(
                                  fontSize: 14,fontWeight: FontWeight.w500,
                                  color: appColors.textColorBlack,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 45,right: 10,
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 77),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xFFCB7642)
                ),
                child: iconApps.iconImage(
                    imageUrl: iconApps.closeIcon,
                    iconSize: Size(10, 10),
                    imageColor: Colors.white
                ),
              ),
            ),
            Positioned(
              left: 115,
              bottom: 32,
              child: CounterButton(),
            )
          ],
        );
    }
    );
  }
}
