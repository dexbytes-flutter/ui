import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CommentsUI extends StatelessWidget {
  final String imageUrl, name, daysAgo, review, uploadImageUrl1,uploadImageUrl2;
  final double rating;
  final void Function()? onTap, onPressed;
  final bool? isLess;
  final bool? isImageVisible;

  const CommentsUI({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.rating,
    this.onTap,
    this.isLess = false,
    required this.daysAgo,
    this.isImageVisible = false,
    required this.uploadImageUrl1,
    required this.uploadImageUrl2,
    required this.review,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    height: 45,
                    width: 45,
                  ),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                    style: appStyles.commonTitleStyle(fontWeight: FontWeight.w600,
                    fontSize: 15
                    ),
                    ),
                    Text(daysAgo,
                        style: appStyles.commonSubTitleTextStyle(fontWeight: FontWeight.w500,
                            fontSize: 13
                        )
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(8).copyWith(left: 15,right: 15),
              margin: EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                  color: appColors.buttonBgColor.withOpacity(0.20),
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                children: [
                  iconApps.iconImage(
                      imageUrl: iconApps.starIcon,
                      iconSize: Size(14, 14)
                  ),
                  SizedBox(width: 5,),
                  Text("$rating",
                    style: appStyles.commonSubTitleTextStyle(texColor: appColors.buttonBgColor,fontWeight: FontWeight.w500,fontSize: 15),)
                ],
              ),
            )
            /*  Container(
              height: 40.0,
              width: 40.0,
              margin: const EdgeInsets.only(right: 10.0),
              */ /*decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
              shape: BoxShape.circle
          ),*/ /*
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(imageUrl:imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Amanda Samantha"),
                Text("2 days ago"),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8).copyWith(left: 15,right: 15),
                      decoration: BoxDecoration(
                          color: appColors.buttonBgColor.withOpacity(0.20),
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Row(
                        children: [
                          iconApps.iconImage(
                              imageUrl: iconApps.starIcon,
                              iconSize: Size(14, 14)
                          ),
                          SizedBox(width: 5,),
                          Text("4.5",
                            style: appStyles.commonSubTitleTextStyle(texColor: appColors.buttonBgColor,fontWeight: FontWeight.w500,fontSize: 15),)
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),*/
          ],
        ),
        SizedBox(height: 12,),
        uploadImageUrl1 != ""
            ? Row(
              children: [
                ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: uploadImageUrl1,
                        fit: BoxFit.cover,
                        height: 50,
                        width: 50,
                      ),
                ),
                SizedBox(width: 10,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: uploadImageUrl2,
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
                  ),
                ),
              ],
            )
            : Container(),
        SizedBox(height: uploadImageUrl1 != "" ? 12 : 0,),
        Text(review,
            style: appStyles.commonSubTitleTextStyle(fontWeight: FontWeight.w500,
                fontSize: 14
            )
        )
      ],
    );
  }
}
