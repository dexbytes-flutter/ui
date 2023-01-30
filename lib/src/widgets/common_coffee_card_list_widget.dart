import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/bloc/main_app_bloc/main_app_bloc.dart';
import 'package:base_flutter_app/src/model/coffee_card_model.dart';
import 'package:base_flutter_app/src/values/app_dimens.dart';
import 'package:base_flutter_app/src/widgets/coffee_deatail_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../all_file_import/app_values_files_link.dart';
import '../image_res/iconApp.dart';

class CommonCoffeeCardList extends StatelessWidget {
  const CommonCoffeeCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: appDimens.heightFullScreen()/2.75,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 15,),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: coffeeCardList.length,
        itemBuilder: (context, int index) {
          return GestureDetector(
            onTap: (){
              Navigator.push(
                MainAppBloc.getDashboardContext,
                SlideRightRoute(
                    widget: CoffeeDetailCard(
                      imageUrl: coffeeCardList[index].imageUrl,
                      title: coffeeCardList[index].title,
                      subTitle: coffeeCardList[index].subTitle,
                    )
                ),
              );
            },
            child: Container(
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
                        imageUrl: coffeeCardList[index].imageUrl,
                        height: 115,
                        width: 130,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, top: 5),
                    child: Text(
                      coffeeCardList[index].title,
                      style: TextStyle(
                          color: appColors.textColor.withOpacity(0.80),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, top: 5),
                    child: Text(
                      coffeeCardList[index].subTitle,
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12.5,
                          fontWeight: FontWeight.w400),
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
                                      text: "\$",
                                      style: TextStyle(
                                          color: Color(0xFFCB7642),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15),
                                    ),
                                    TextSpan(
                                        text: coffeeCardList[index].price,
                                        style: TextStyle(
                                            color: appColors.textColor.withOpacity(0.75),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15))
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
            ),
          );
        },
      ),
    );
  }
}
