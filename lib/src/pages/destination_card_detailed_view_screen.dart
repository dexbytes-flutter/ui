import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class DestinationDetailedCardView extends StatefulWidget {
  const DestinationDetailedCardView({Key? key}) : super(key: key);

  @override
  State<DestinationDetailedCardView> createState() => _DestinationDetailedCardViewState();
}

class _DestinationDetailedCardViewState extends State<DestinationDetailedCardView> {
  @override
  Widget build(BuildContext context) {

    // Background image in stack
    backgroundImageStackView(){
      return Stack(
        alignment: Alignment.bottomLeft,
        children: [
          ShaderMask(
            shaderCallback: (bound) => LinearGradient(
              colors: [
                appColors.white,
                appColors.appTransColor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(bound),
            blendMode: BlendMode.dstIn,
            child: ClipRRect(
              child: CachedNetworkImage(
                imageUrl: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQQ9j9GWnKtl9xJjLvEPREdCFlkLjl2XKmMdQKOAnnyLmCO_Moo",
                // imageUrl: widget.imageUrl!,
                fit: BoxFit.cover,
                height: appDimens.heightFullScreen()/1.65,
                width: appDimens.widthFullScreen(),
              ),
            ),
          ),
          Positioned(
            left: 20,
              bottom: 70,
              child: Container(
                padding: EdgeInsets.all(8).copyWith(left: 18,right: 18),
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
              )
          ),
        ],
      );
    }


    //Bottom detail view
    bottomDetailView(){
      return Container(
        height: appDimens.heightFullScreen(),
        child: Stack(
          children: [
            Positioned(
              left: 20,
              bottom: 240,
              child: Text("Borobudur \nTemple",
                softWrap: true,
                textAlign: TextAlign.left,
                style: appStyles.commonTitleStyle(
                    fontSize: 35,fontWeight: FontWeight.w900
                ),),
            ),
            Positioned(
              left: 20,
            bottom: 210,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: appColors.white),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CachedNetworkImage(
                      imageUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
                      fit: BoxFit.cover,
                      height: 12,
                      width: 12,
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Text("Magelang, Indonesia",
                  style: appStyles.commonSubTitleTextStyle(fontSize: 11),
                )
              ],
            ),
          ),
            Positioned(
              left: 20,
              bottom: 160,
                child:  Text(appString.trans(context, appString.aboutPlaceTitleText),
                  softWrap: true,
                  textAlign: TextAlign.left,
                  style: appStyles.commonTitleStyle(
                      fontSize: 15,fontWeight: FontWeight.w500,
                  ),),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 100,
              child: Container(
                width: appDimens.widthFullScreen(),
                child: ReadMoreText(
                  "The Borobudur Temple Compounds is one of the greatest Buddhist monuments in the world, and was built in the 8th and 9th centuries AD during the reign of the Syailendra Dynasty. The monument is located in the Kedu Valley, in the southern part of Central Java, at the centre of the island of Java, Indonesia.",
                  trimLines: 3,
                  preDataTextStyle: appStyles.commonSubTitleTextStyle(fontSize: 13),
                  style: appStyles.commonSubTitleTextStyle(fontSize: 13),
                  colorClickableText: appColors.buttonBgColor,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: appString.trans(context, appString.readMoreText),
                  trimExpandedText: appString.trans(context, appString.showLessText),
                ),
              ),
            ),
            Positioned(
              left: 20,
              bottom: 65,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(appString.trans(context, appString.ratingAndReview),
                    softWrap: true,
                    textAlign: TextAlign.left,
                    style: appStyles.commonTitleStyle(
                      fontSize: 15,fontWeight: FontWeight.w500,
                    ),),
                  Text(appString.trans(context, appString.viewAllText),
                    softWrap: true,
                    textAlign: TextAlign.left,
                    style: appStyles.commonTitleStyle(
                      fontSize: 15,fontWeight: FontWeight.w500,
                    ),),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return ContainerFirst(
        appBarHeight: 56,
        isOverLayStatusBar: true,
        isOverLayAppBar: true,
        isSingleChildScrollViewNeed: false,
        isFixedDeviceHeight: false,
        contextCurrentView: context,
        appBar: CommonAppBar(
          isHideRightIcon: false,
          isShowTitle: false,
        ),
        containChild: Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            backgroundImageStackView(),
            bottomDetailView()
          ],
        )
    );
  }
}
