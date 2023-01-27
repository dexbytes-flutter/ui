import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/order_card_model.dart';

class OrderCardList extends StatelessWidget {
  const OrderCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: orderCardList.length,
      shrinkWrap: true,
      itemBuilder: (context,index){
        return Container(
          margin: EdgeInsets.only(top: 20,left: 20, right: 20),
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
                              fontSize: 18, fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(orderCardList[index].subTitle,
                          style: TextStyle( fontSize: 13,color: Colors.grey.shade500,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40,left: 10),
                            child: Text("\$",
                              style: TextStyle(
                                fontSize: 14,fontWeight: FontWeight.w500,
                                color: Color(0xFFCB7642),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40,left: 10),
                            child: Text(orderCardList[index].price,
                              style: TextStyle(
                                fontSize: 14,fontWeight: FontWeight.w500,
                                color: appColors.appThemeColor1,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:77,top: 60),
                    child: Container(
                      padding: EdgeInsets.all(10),
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
              )
            ],
          ),
        );
    }
    );
  }
}
