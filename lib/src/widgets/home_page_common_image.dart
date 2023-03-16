import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/bookmark_button_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomepageCommonImage extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? subTitle;
  final String? countryTitle;
  late final int? selectedIndex;
  final bool? isHorizontalViewCard;
  final bool isBookmarked;
  final Function? onButtonClickCallback;
  HomepageCommonImage({
    Key? key,
    this.imageUrl,
    this.title,
    this.subTitle,
    this.countryTitle,
    this.selectedIndex,
    this.isHorizontalViewCard,
    this.isBookmarked = false,
    this.onButtonClickCallback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget ratingView(){
      return Container(
        padding: EdgeInsets.all(10).copyWith(left: 20,right: 20),
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
            Text("4.9",
            style: appStyles.commonSubTitleTextStyle(texColor: appColors.buttonBgColor,fontWeight: FontWeight.w500,fontSize: 15),)
          ],
        ),
      );
    }
    Widget placeTitleView(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              selectedIndex == 1? Container(
                decoration: BoxDecoration(
                    border: Border.all(color: appColors.white),
                    borderRadius: BorderRadius.circular(8)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
                    fit: BoxFit.cover,
                    height: 20,
                    width: 20,
                  ),
                ),
              ) : Container(),
              SizedBox(width: selectedIndex == 1 ? 10 : 0,),
              Text(title!,
                style: appStyles.commonTitleStyle(fontSize: selectedIndex == 0 ? 32 : 20),
              ),
          ],),
          SizedBox(height: selectedIndex == 1? 8 : selectedIndex == 0? 10:15,),
          selectedIndex == 2
              ? Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: appColors.white),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CachedNetworkImage(
                    imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Flag_of_Venezuela_%281930%E2%80%932006%29.svg/220px-Flag_of_Venezuela_%281930%E2%80%932006%29.svg.png",
                    fit: BoxFit.cover,
                    height: 15,
                    width: 15,
                  ),
                ),
              ),
              SizedBox(width: 5,),
              Text(countryTitle!,
              style: appStyles.commonSubTitleTextStyle(fontSize: 14,),
              ),
            ],
          )
              : Container(),
          SizedBox(height: selectedIndex == 2? 15 : 0,),
          Row(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  selectedIndex == 0 || isHorizontalViewCard!
                      ? Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: appColors.white),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
                        fit: BoxFit.cover,
                        height: 20,
                        width: 20,
                      ),
                    ),
                  )
                      : iconApps.iconImage(
                      imageUrl: iconApps.islandIcon,
                      iconSize: Size(20, 20),
                      imageColor: appColors.white
                  ),
                  SizedBox(width: selectedIndex != 0 || isHorizontalViewCard!? 10 : 5,),
                  Text(subTitle!,
                  style: appStyles.commonSubTitleTextStyle(fontSize: 14,texColor: appColors.white),
                  ),
                  SizedBox(width: 2,),
                  Text( selectedIndex != 0
                      ? isHorizontalViewCard! ? "" : appString.trans(context, appString.destinationText)
                      : "",
                    style: appStyles.commonSubTitleTextStyle(fontSize: 13),
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
          // height: 50,
          // width: 100,
          padding: EdgeInsets.only(left: 20,right: 20).copyWith(top: 2,bottom: 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: appColors.buttonBgColor.withOpacity(0.50)
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
                    iconSize: Size(20, 25)
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
                  width: appDimens.widthFullScreen()/1.42,
                  height: appDimens.heightFullScreen()/1.5,
                ),
              ),
            ),
            Positioned(
              left: 25,
                top: 25,
                child: selectedIndex == 0 || isHorizontalViewCard!? ratingView():Container()
            ),
            Positioned(
              top: 25,
                right: 25,
                child: selectedIndex == 0 || isHorizontalViewCard!
                    ? BookmarkButton(
                  isFavorite: isBookmarked,
                  iconDisabledColor: appColors.appBgColorLeanWhite.withOpacity(0.40),
                  valueChanged: (_isFavorite) {
                    print('Is Favorite : $_isFavorite');
                  },
                )
                /*iconApps.iconImage(
                imageUrl: isHorizontalViewCard!? iconApps.bookmarkIcon : iconApps.bookmarkIconFilled,
                iconSize: Size(25, 35),
                  imageColor: isHorizontalViewCard! ? appColors.buttonBgColor.withOpacity(0.50): appColors.buttonBgColor.withOpacity(0.70)
              )*/: Container()
            ),
            Positioned(
              bottom: selectedIndex != 1 || isHorizontalViewCard!? 225 : 185,
                left: 25,
                child: Text(
                  selectedIndex == 1 ||isHorizontalViewCard!
                      ? appString.trans(context, appString.topRecommendedImageText)
                      : appString.trans(context, appString.recommendedImageText),
                  style: appStyles.commonSubTitleTextStyle(fontSize: 13),
                )
            ),
            Positioned(
              bottom: selectedIndex == 0 || isHorizontalViewCard!? 115 : 125,
                left: selectedIndex == 0 ? 24 : 25,
                child: placeTitleView()
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
