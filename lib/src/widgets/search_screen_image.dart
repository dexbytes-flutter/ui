import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SearchScreenCommonImage extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? subTitle;
  final String? countryTitle;
  late final int? selectedIndex;
  final double? imageHeight;
  final double? imageWidth;
  SearchScreenCommonImage({
    Key? key,
    this.imageUrl,
    this.title,
    this.subTitle,
    this.countryTitle,
    this.selectedIndex,
    this.imageHeight,
    this.imageWidth
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget ratingView(){
      return Container(
        padding: EdgeInsets.all(5).copyWith(left: 10,right: 10),
        decoration: BoxDecoration(
            color: appColors.buttonBgColor.withOpacity(0.20),
            borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          children: [
            iconApps.iconImage(
                imageUrl: iconApps.starIcon,
                iconSize: Size(10, 10)
            ),
            SizedBox(width: 5,),
            Text("4.9",
              style: appStyles.commonSubTitleTextStyle(texColor: appColors.buttonBgColor,fontWeight: FontWeight.w500,fontSize: 10),)
          ],
        ),
      );
    }

    Widget placeTitleView(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title!,
            style: appStyles.commonTitleStyle(fontSize: 20),
          ),
          SizedBox(height: 8 ),
          Row(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: appColors.white),
                        borderRadius: BorderRadius.circular(3)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: CachedNetworkImage(
                        imageUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
                        fit: BoxFit.cover,
                        height: 10,
                        width: 10,
                      ),
                    ),
                  ),
                  SizedBox(width:  5,),
                  Text(subTitle!,
                    style: appStyles.commonSubTitleTextStyle(fontSize: 14,texColor: appColors.white),
                  ),
                ],
              )
            ],
          )
        ],
      );
    }

    bottomButton(){
      return Container(
          padding: EdgeInsets.only(left: 12,right: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: appColors.buttonBgColor.withOpacity(0.40)
          ),
          child: InkWell(
            onTap: (){
            },
            child: Container(
                padding: EdgeInsets.all(12),
                child: iconApps.iconImage(
                    imageUrl: iconApps.rightArrow,
                    imageColor: appColors.buttonBgColor,
                    iconSize: Size(15, 20)
                )
            ),
          )
      );
    }

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          child: ShaderMask(
            shaderCallback: (bound) => LinearGradient(
              colors: [
                appColors.appTransColor.withOpacity(0.40),
                appColors.appBgColorJungleGreen.withOpacity(0.75)
              ],
              begin: Alignment.center,
              end: Alignment.bottomCenter,
            ).createShader(bound),
            blendMode: BlendMode.darken,
            child: CachedNetworkImage(
              imageUrl: imageUrl!,
              fit:BoxFit.cover,
              height: imageHeight ?? appDimens.heightFullScreen(),
              width: imageWidth ?? appDimens.widthFullScreen(),
              // width: appDimens.widthFullScreen()/1.25,
              // height: appDimens.heightFullScreen()/3.8,
            ),
          ),
        ),
        Positioned(
            left: 20,
            top: 20,
            child: ratingView()
        ),
        Positioned(
            top: 20,
            right: 20,
            child: iconApps.iconImage(
                imageUrl: iconApps.bookmarkIcon,
                iconSize: Size(25, 25),
                imageColor: appColors.appBgColorLeanWhite.withOpacity(0.40)
            )
        ),
        Positioned(
            bottom: 30,
            left: 20,
            child: placeTitleView()
        ),
        Positioned(
            right: 20,
            bottom: 20,
            child: bottomButton()
        )
      ],
    );
  }
}