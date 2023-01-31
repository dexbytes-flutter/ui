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
      physics: NeverScrollableScrollPhysics(),
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
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20)
                        ),
                        child: CachedNetworkImage(
                          imageUrl: orderCardList[index].imageUrl,
                          height: 135,
                          width: 100,
                          fit: BoxFit.fill,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(orderCardList[index].title,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(orderCardList[index].subTitle,
                              style: TextStyle( fontSize: 12.5,color: Colors.grey.shade500,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8,left: 10),
                                child: Text("\$",
                                  style: TextStyle(
                                    fontSize: 14,fontWeight: FontWeight.w500,
                                    color: Color(0xFFCB7642),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8,left: 5),
                                child: Text(orderCardList[index].price,
                                  style: TextStyle(
                                    fontSize: 14,fontWeight: FontWeight.w500,
                                    color: appColors.appThemeColor1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,top: 15),
                            child: CounterButton(),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 45,right: 10,
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 79),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xFFCB7642)
                ),
                child: iconApps.iconImage(
                    imageUrl: iconApps.closeIcon,
                    iconSize: Size(15, 15),
                    imageColor: Colors.white
                ),
              ),
            )
          ],
        );
    }
    );
  }
}
