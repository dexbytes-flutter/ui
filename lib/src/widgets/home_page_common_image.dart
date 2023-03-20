import 'dart:ui';

import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/bookmark_button_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomepageCommonImage extends StatelessWidget {
  final String? imageUrl;
  final String? placeTitle;
  late final int? selectedIndex;
  final bool? isHorizontalViewCard;
  final bool? isBookmarked;
  final Function? onButtonClickCallback;
  final double? rating;
  final String? placeFlag;
  final double? imageHeight;
  final double? imageWidth;
  final String? recommendationType;
  final int? numberOfDestination;
  final String? destinationText;
  final String? placeSubTitle;
  final bool? isCityScreen;
  final bool? isVerticalCardListView;
  final bool? isCityDetail;
  final int? destinationId;
  HomepageCommonImage({
    Key? key,
    this.imageUrl,
    this.placeTitle,
    this.selectedIndex,
    this.isHorizontalViewCard,
    this.isBookmarked,
    this.onButtonClickCallback,
    this.rating,
    this.imageHeight,
    this.imageWidth,
    this.recommendationType,
    this.numberOfDestination,
    this.destinationText,
    this.placeSubTitle,
    required this.placeFlag,
    this.isCityScreen,
    this.isVerticalCardListView,
    this.isCityDetail,
    this.destinationId
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget ratingView(){
      return rating != null
          ? Container(
        padding: isCityDetail! ? EdgeInsets.all(8).copyWith(left: 14,right: 14) : EdgeInsets.all(10).copyWith(left: 20,right: 20),
        decoration: BoxDecoration(
          color: appColors.buttonBgColor.withOpacity(0.20),
          borderRadius: BorderRadius.circular(isCityDetail! ? 10: 12)
        ),
        child: Row(
          children: [
            iconApps.iconImage(
                imageUrl: iconApps.starIcon,
                iconSize: Size(14, 14)
            ),
            SizedBox(width: 5,),
            Text("${rating!}",
            style: appStyles.commonSubTitleTextStyle(texColor: isCityDetail! ? appColors.white : appColors.buttonBgColor,
                fontWeight: FontWeight.w500,fontSize: isCityDetail! ? 12:15),)
          ],
        ),
      )
          : Container();
    }

    Widget placeTitleView(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              placeSubTitle == ""? Container(
                decoration: BoxDecoration(
                    border: Border.all(color: appColors.white),
                    borderRadius: BorderRadius.circular(8)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: placeFlag!,
                    fit: BoxFit.cover,
                    height: 20,
                    width: 20,
                  ),
                ),
              ) : Container(),
              SizedBox(width: placeSubTitle == "" ? 10 : 0,),
              Text(placeTitle!,
                style: appStyles.commonTitleStyle(fontSize: selectedIndex == 0 ? 25 : selectedIndex == 2 ? 25 : isCityDetail!? 25 :20,
                    fontWeight: FontWeight.w900
                ),
              ),
            ],
          ),
          SizedBox(height: placeSubTitle != "" ? 8:0),
          Row(
            children: [
              placeFlag != "" && placeSubTitle != ""
                  ? Container(
                decoration: BoxDecoration(
                    border: Border.all(color: appColors.white),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CachedNetworkImage(
                    imageUrl: placeFlag!,
                    fit: BoxFit.cover,
                    height: 15,
                    width: 15,
                  ),
                ),
              )
                  : Container(),
              SizedBox(width: placeFlag != ""? 5 : 0,),
              Text(placeSubTitle!,
                style: appStyles.commonSubTitleTextStyle(fontSize: 11,),
              ),
            ],
          ),
          SizedBox(height: selectedIndex == 2? 15 : 0,),
        ],
      );
    }

    bottomButton(){
      return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
              // height: 30,
              // width: 100,
              padding: EdgeInsets.only(left: 15,right: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: appColors.buttonBgColor.withOpacity(0.30)
              ),
              child: InkWell(
                onTap: (){
                  onButtonClickCallback?.call();
                },
                child: Container(
                    padding: EdgeInsets.all(12),
                    child: iconApps.iconImage(
                        imageUrl: iconApps.rightArrow,
                        imageColor: appColors.buttonBgColor,
                        iconSize: Size(20,20)
                    )
                ),
              )
          ),
        ),
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
                  width: imageWidth ?? appDimens.widthFullScreen()/1.42,
                  height: imageHeight ?? appDimens.heightFullScreen()/1.5,
                ),
              ),
            ),
            Positioned(
                left: 25,
                top: 25,
                child: rating != null ? ratingView() : Container()
            ),
            Positioned(
                top: 25,
                right: 25,
                child: isBookmarked!
                    ? BookmarkButton(
                  iconSize: isCityDetail! ? 25 : 35,
                  isFavorite: isBookmarked,
                  iconDisabledColor: appColors.appBgColorLeanWhite.withOpacity(0.40),
                  valueChanged: (_isFavorite) {
                    print('Is Favorite : $_isFavorite');
                  },
                )
                    : Container()

            ),
            Positioned(
                // bottom: placeSubTitle != "" ? isCityDetail! ? selectedIndex == 3 ? 145 : 180 : 180 : 160,
                bottom: destinationText == "" ? selectedIndex == 1? 150 : 192 : placeSubTitle != "" && destinationText != ""? 185 : 158,
                left: 25,
                child: Text(recommendationType!,
                  style: appStyles.commonSubTitleTextStyle(fontSize: 11),
                )
            ),
            Positioned(
                bottom: placeSubTitle != "" ? destinationText != "" ? 125 : isVerticalCardListView! ? 118 : 90 : 110,
                left: selectedIndex == 0 ? 24 : 25,
                child: placeTitleView()
            ),
            Positioned(
              bottom: placeSubTitle != "" && destinationText != ""? 90 : 90,
              left: selectedIndex == 0 ? 24 : 25,
                child: placeSubTitle == "" || destinationText != ""
                    ? Row(
                  children: [
                    iconApps.iconImage(
                        imageUrl: iconApps.islandIcon,
                        iconSize: Size(20, 20),
                        imageColor: appColors.white
                    ),
                    SizedBox(width: placeSubTitle == "" || destinationText != "" || isHorizontalViewCard!? 10 : 5,),
                    Text(placeSubTitle == "" || destinationText != "" ? "${numberOfDestination!}+ " : "",
                        style: appStyles.commonSubTitleTextStyle(fontSize: 11,texColor: appColors.white)
                    ),
                    Text( placeSubTitle == "" || destinationText != ""
                        ? destinationText! : "",
                      style: appStyles.commonSubTitleTextStyle(fontSize: 11),
                    ),
                  ],
                )
                    : Container(),
            ),
            Positioned(
                right: 25,
                bottom: 25,
                child: bottomButton()
            )
          ],
        );
  }
}
