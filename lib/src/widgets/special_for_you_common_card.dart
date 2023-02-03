import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../all_file_import/app_values_files_link.dart';
import '../image_res/iconApp.dart';

class SpecialForYouCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subTitle;
  final String price;
  const SpecialForYouCard({
    Key? key,
    this.imageUrl = "https://i.pinimg.com/236x/be/5e/0d/be5e0d63c8543a5d3ce502bf8fc9180c.jpg",
    this.title = "5 Coffee Beans You \n Must Try!",
    this.price = "",
    this.subTitle = ""
  }) : super(key: key);

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
                   imageUrl:  "https://i.pinimg.com/236x/be/5e/0d/be5e0d63c8543a5d3ce502bf8fc9180c.jpg",
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:  EdgeInsets.only(top: 10),
                child: Text( "5 Coffee Beans You \n Must Try!",
                  style: TextStyle(
                      fontSize: 15,
                      color: appColors.textColor.withOpacity(0.80),
                      fontWeight: FontWeight.w500),
                ),
              ),
                Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                 this.subTitle,
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
                    padding: EdgeInsets.only(bottom: 18),
                    child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "\$",
                            style: TextStyle(
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                          TextSpan(
                             text: " 4.20",
                              style: TextStyle(
                                  color: appColors.textColor.withOpacity(0.75),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15))
                        ])),
                  ),
                 Container(
                    margin: EdgeInsets.only(left: 118, bottom: 18),
                    decoration: BoxDecoration(
                        color: Color(0xFFCB7642),
                        borderRadius: BorderRadius.circular(2)),
                    child: iconApps.iconImage(
                        imageUrl: iconApps.plusIcon,
                        iconSize: Size(20, 20)),
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
