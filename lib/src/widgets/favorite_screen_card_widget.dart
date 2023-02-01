
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../all_file_import/app_values_files_link.dart';

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

    return Container(
      height: appDimens.heightFullScreen() / 5,
      width: appDimens.widthFullScreen() / 1.12,
      margin: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 0.8,color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: CachedNetworkImage(
                    // imageUrl: coffeeCardList[index].imageUrl,
                    imageUrl: widget.imageUrl,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(top: 10),
                child: Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 16,
                      color: appColors.textColor.withOpacity(0.80),
                      fontWeight: FontWeight.w500),
                ),
              ),
             Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  widget.subTitle,
                  style: TextStyle(
                      fontSize: 12.5,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "\$",
                            style: TextStyle(
                                color: Color(0xFFCB7642),
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                          TextSpan(
                              text: widget.price,
                              style: TextStyle(
                                  color: appColors.textColor.withOpacity(0.75),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15))
                        ])),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
