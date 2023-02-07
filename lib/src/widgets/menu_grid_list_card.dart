import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/coffee_card_model.dart';
import 'package:base_flutter_app/src/values/app_dimens.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../values/app_color.dart';
import 'like_button_icon.dart';

class MenuGridListCard extends StatelessWidget {
  final bool isFav;
  final String imageUrl;
  final String menuGridItemTitle;
  final String menuGridItemSubtitle;
  final String price;
  const MenuGridListCard({
    Key? key,
    this.isFav = false,
    this.imageUrl = "https://emilylaurae.com/wp-content/uploads/2022/10/Caramel-macchiato-4.jpg",
    this.menuGridItemTitle = "Caramel",
    this.menuGridItemSubtitle = "Macchiato",
    this.price = "4.00"
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);

    return Stack(
      children: [
        Container(
          width: 160,
          margin: EdgeInsets.only(right:10,),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 0.8,color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        height: 130,
                        width: 130,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 7.9,
                    bottom: 7.9,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: appColors.appButtonBgColor
                      ),
                      child: FavoriteButton(
                        isFavorite: isFav,
                        iconDisabledColor: appColors.white,
                        valueChanged: (_isFavorite) {
                          print('Is Favorite : $_isFavorite');
                        },
                      ),/*iconApps.iconImage(imageUrl: iconApps.favoriteIcon,
                iconSize: Size(22,22),
                imageColor: appColors.black.withOpacity(0.60)
              ),*/
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 5),
                child: Text(
                  menuGridItemTitle,
                  style: TextStyle(
                      color: appColors.textColor.withOpacity(0.80),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 5),
                child: Text(
                 menuGridItemSubtitle,
                  style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 12.5,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12,right: 12,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("₹",
                          style: TextStyle(
                              color: appColors.textNormalColor1,
                              fontWeight: FontWeight.w500,
                              fontSize: 15)
                      ),
                      Text(price,
                        style: TextStyle(
                            color: appColors.textNormalColor1,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 15,
          child: Container(
            padding: EdgeInsets.all(10).copyWith(left: 20,right: 20),
            decoration: BoxDecoration(
                color: Color(0xFFCB7642),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                )
            ),
            child: iconApps.iconImage(
                imageUrl: iconApps.plusIcon,
                iconSize: Size(20, 20)),
          ),
        )
      ],
    );
  }
}
