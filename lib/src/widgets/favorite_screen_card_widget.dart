
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../all_file_import/app_values_files_link.dart';
import '../image_res/iconApp.dart';

class FavoriteScreenCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subTitle;
  final String price;
  const FavoriteScreenCard({
    Key? key,
    this.imageUrl = "https://i.pinimg.com/236x/be/5e/0d/be5e0d63c8543a5d3ce502bf8fc9180c.jpg",
    this.title = "5 Coffee Beans You \n Must Try!",
    this.price = "",
    this.subTitle = ""
  }) : super(key: key);

  @override
  State<FavoriteScreenCard> createState() => _FavoriteScreenCardState();
}

class _FavoriteScreenCardState extends State<FavoriteScreenCard> {
  @override
  Widget build(BuildContext context) {
    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20,right: 20,top: 6,bottom: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 0.8,color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: CachedNetworkImage(
                  // imageUrl: coffeeCardList[index].imageUrl,
                  imageUrl: widget.imageUrl,
                  height: 85,
                  width: 90,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                          fontSize: 16,
                          color: appColors.textColor.withOpacity(0.80),
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      widget.subTitle,
                      style: TextStyle(
                          fontSize: 12.5,
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8,),
                    Text(
                       "₹450",
                      style: appStyles.favCardPriceTitleStyle()
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 6,
          child: Container(
            margin: EdgeInsets.only(right: 20),
            padding: EdgeInsets.all(8).copyWith(left: 15,right: 15),
            decoration: BoxDecoration(
                color: Color(0xFFCB7642),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)
                )
            ),
            child: iconApps.iconImage(
                imageUrl: iconApps.plusIcon,
                iconSize: Size(20, 20)),
          ),
        ),
      ],
    );
  }
}
