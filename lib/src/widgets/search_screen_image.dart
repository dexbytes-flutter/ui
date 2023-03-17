import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/bookmark_button_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SearchScreenCommonImage extends StatelessWidget {
  final String? imageUrl;
  final String? placeTitle;
  final String? countryTitle;
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
  final bool? isCityAndDestinationListView;
  final bool? isStaticCalenderIcon;
  final String? bookingStatus;
  SearchScreenCommonImage({
    Key? key,
    this.imageUrl,
    this.placeTitle,
    this.countryTitle,
    this.selectedIndex,
    this.isHorizontalViewCard,
    this.isBookmarked,
    this.onButtonClickCallback,
    this.rating, this.placeFlag,
    this.imageHeight,
    this.imageWidth,
    this.recommendationType,
    this.numberOfDestination,
    this.destinationText,
    this.placeSubTitle,
    this.isCityAndDestinationListView,
    this.isStaticCalenderIcon,
    this.bookingStatus,
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
          Text(recommendationType!,
            style: appStyles.commonTitleStyle(fontSize: 11, fontWeight: FontWeight.w400,
                texColor: appColors.textColor
            ),
          ),
          SizedBox(height: 5,),
          Text(placeTitle!,
            style: appStyles.commonTitleStyle(fontSize: 20),
          ),
          SizedBox(height: 8 ),
          Row(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  isStaticCalenderIcon!
                      ? iconApps.iconImage(
                      imageUrl: iconApps.calendarIcon,
                      imageColor: appColors.buttonBgColor,
                      iconSize: Size(12, 15)
                      )
                      : Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: appColors.white),
                        borderRadius: BorderRadius.circular(3)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: CachedNetworkImage(
                        imageUrl: placeFlag ?? "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
                        fit: BoxFit.cover,
                        height: 10,
                        width: 10,
                      ),
                    ),
                  ),
                  SizedBox(width:  5,),
                  Text(placeSubTitle!,
                    style: appStyles.commonSubTitleTextStyle(fontSize: placeFlag! != ""? 11 : 14,
                        texColor: isStaticCalenderIcon!? appColors.textColor : appColors.white
                    ),
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
          // padding: EdgeInsets.only(left: 12,right: 12),

          child: InkWell(
            onTap: (){
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: appColors.buttonBgColor.withOpacity(0.40)
                ),
                padding: EdgeInsets.all(8).copyWith(left: 18,right: 18),
                child: iconApps.iconImage(
                    imageUrl: iconApps.rightArrow,
                    imageColor: appColors.buttonBgColor,
                    iconSize: Size(20, 18)
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
            child: isStaticCalenderIcon!
                ? Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: bookingStatus! == "Cancelled" ?
                    appColors.red.withOpacity(0.15) : bookingStatus! == "" ? appColors.appTransColor : appColors.green.withOpacity(0.15)
                  ),
                  child: Text(bookingStatus!,
                    style: appStyles.commonTitleStyle(
                      fontSize: 11,fontWeight: FontWeight.w400,
                      texColor: bookingStatus! == "Cancelled" ? appColors.red : appColors.green
                    ),
                  ),
                )
                : BookmarkButton(
              isFavorite: isBookmarked,
              iconDisabledColor: appColors.appBgColorLeanWhite.withOpacity(0.40),
              valueChanged: (_isFavorite) {
                print('Is Favorite : $_isFavorite');
              },
            )/*iconApps.iconImage(
                imageUrl: iconApps.bookmarkIcon,
                iconSize: Size(25, 25),
                imageColor: appColors.appBgColorLeanWhite.withOpacity(0.40)
            )*/
        ),
        Positioned(
            bottom: 18,
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