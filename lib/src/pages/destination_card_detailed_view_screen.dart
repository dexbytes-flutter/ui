import 'package:base_flutter_app/src/all_file_import/app_providers_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/filter_choice_chip_model.dart';
import 'package:base_flutter_app/src/model/gallery_list_view_model.dart';
import 'package:base_flutter_app/src/pages/all_gallery_images_screen.dart';
import 'package:base_flutter_app/src/pages/create_booking_screen.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar.dart';
import 'package:base_flutter_app/src/widgets/comment_list_view.dart';
import 'package:base_flutter_app/src/widgets/common_choice_chip_widget.dart';
import 'package:base_flutter_app/src/widgets/full_view_image_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:readmore/readmore.dart';

import '../all_file_import/app_utils_files_link.dart';
import '../model/detail_card_vertical_list_image_model.dart';
import '../widgets/image_list_with_item_count_on_stack.dart';
import 'all_review_view.dart';

class DestinationDetailedCardView extends StatefulWidget {
  late String detailImageUrl;
  DestinationDetailedCardView({
    Key? key,
    this.detailImageUrl = "",
  }) : super(key: key);

  @override
  State<DestinationDetailedCardView> createState() => _DestinationDetailedCardViewState();
}

class _DestinationDetailedCardViewState extends State<DestinationDetailedCardView> {

  String imageUrl = "";
  int itemCount = 4;
  int lastVisibleIndex = 0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    // Right images list
    rightImagesList(){
      return Container(
        // height: 100,
        width: 55,
        child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: itemCount,
              itemBuilder: (contex,index){
                lastVisibleIndex = index + 1;
                return Container(
                  margin: EdgeInsets.only(top: 10),
                  child: ImageListWithItemCountOnStack(
                    imageUrl: detailScreenRightVerticalImageList[index].imageUrl,
                    imageHeight: 55,
                    imageWidth: 55,
                    widgetList: detailScreenRightVerticalImageList.length,
                    totalCount: itemCount,
                    showTotalCount: true,
                    lastVisibleIndex: lastVisibleIndex,
                    selectedIndex: selectedIndex,
                    currentIndex: index,
                    onTapCallBack: (){
                      setState(() {
                        selectedIndex = index;
                        widget.detailImageUrl = detailScreenRightVerticalImageList[index].imageUrl;
                      });
                    },
                  ),
                );
              },
        ),
      );
    }

    // Background image in stack
    backgroundImageStackView(){
      return Stack(
        alignment: Alignment.bottomLeft,
        children: [
          ShaderMask(
            shaderCallback: (bound) => LinearGradient(
              colors: [
                appColors.black,
                appColors.appTransColor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(bound),
            blendMode: BlendMode.dstIn,
            child: ClipRRect(
              child: CachedNetworkImage(
                // imageUrl: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQQ9j9GWnKtl9xJjLvEPREdCFlkLjl2XKmMdQKOAnnyLmCO_Moo",
                imageUrl: widget.detailImageUrl!,
                fit: BoxFit.cover,
                height: appDimens.heightFullScreen()/1.45,
                width: appDimens.widthFullScreen(),
              ),
            ),
          ),
          Positioned(
            left: 20,
              bottom: 140,
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
          Positioned(
            left: 20,
            bottom: 45,
            child: Text("Borobudur \nTemple",
              softWrap: true,
              textAlign: TextAlign.left,
              style: appStyles.commonTitleStyle(
                  fontSize: 35,fontWeight: FontWeight.w900
              ),),
          ),
          Positioned(
            left: 20,
            bottom: 15,
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
            right: 20,
              bottom: 15,
              child: rightImagesList()
          )
        ],
      );
    }

    // Rating choice chip
    ratingView(){
      int defaultItemIndex = ratingChoiceChipDataList.indexOf("All");
      print(defaultItemIndex);
      return Wrap(
        spacing: 10.0,
        runSpacing: -5,
        children: <Widget>[
          ChoiceChipWidget(
            choiceChipWidgetPadding: EdgeInsets.all(5).copyWith(top: 0,bottom: 0),
            reportList: ratingChoiceChipDataList,
            isAvatar: true,
            choiceChipRadius: 15,
            selectedIndex: defaultItemIndex,
          ),
          
        ],
      );

      /*Container(
        height: 40,
        child: ListView.builder(
          itemCount: recentSearchTextList.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index){
            return RecentSearchListView(
              recentSearchText: recentSearchTextList[index].recentSearchText,
              margin: EdgeInsets.only(left: 20),
            );
          },
        ),
      );*/
    }

    //Gallery list view
    galleryListView(){
      return Container(
        height: 80,
        child: ListView.builder(
          itemCount: 6,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                setState(() {
                  imageUrl = galleryImageList[index].imageUrl;
                });
                Navigator.push(
                  context,
                  BottomUpTransition(
                      widget: FullPhotoView(
                          galleryZoomImageUrl: imageUrl,
                      )
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: galleryImageList[index].imageUrl,
                    fit: BoxFit.cover,
                    height: 80,
                    width: 80,
                  ),
                ),
              ),
            );
          },
        ),
      );
    }

    //Bottom detail view
    bottomDetailView(){
      return Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 56),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(appString.trans(context, appString.aboutPlaceTitleText),
              softWrap: true,
              textAlign: TextAlign.left,
              style: appStyles.commonTitleStyle(
                  fontSize: 15,fontWeight: FontWeight.w500,
              ),),
            SizedBox(height: 15,),
            ReadMoreText(
              "The Borobudur Temple Compounds is one of the greatest Buddhist monuments in the world, and was built in the 8th and 9th centuries AD during the reign of the Syailendra Dynasty. The monument is located in the Kedu Valley, in the southern part of Central Java, at the centre of the island of Java, Indonesia.",
              trimLines: 3,
              preDataTextStyle: appStyles.commonSubTitleTextStyle(fontSize: 14),
              style: appStyles.commonSubTitleTextStyle(fontSize: 14),
              colorClickableText: appColors.buttonBgColor,
              trimMode: TrimMode.Line,
              trimCollapsedText: appString.trans(context, appString.readMoreText),
              trimExpandedText: appString.trans(context, appString.showLessText),
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(appString.trans(context, appString.ratingAndReview),
                  softWrap: true,
                  textAlign: TextAlign.left,
                  style: appStyles.commonTitleStyle(
                    fontSize: 15,fontWeight: FontWeight.w500,
                  ),),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, SlideRightRoute(
                      widget: AllReviewScreen(),
                    )
                    );
                  },
                  child: Text(appString.trans(context, appString.viewAllText),
                    softWrap: true,
                    textAlign: TextAlign.left,
                    style: appStyles.commonTitleStyle(
                      fontSize: 15,fontWeight: FontWeight.w500,
                    ),),
                ),
              ],
            ),
            SizedBox(height: 15,),
            ratingView(),
            SizedBox(height: 15,),
            CommentsListView(),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(appString.trans(context, appString.galleryTitleText),
                  softWrap: true,
                  textAlign: TextAlign.left,
                  style: appStyles.commonTitleStyle(
                    fontSize: 15,fontWeight: FontWeight.w500,
                  ),),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, SlideRightRoute(
                      widget: AllGalleryImagesScreen(),
                    )
                    );
                  },
                  child: Text(appString.trans(context, appString.viewAllText),
                    softWrap: true,
                    textAlign: TextAlign.left,
                    style: appStyles.commonTitleStyle(
                      fontSize: 15,fontWeight: FontWeight.w500,
                    ),),
                ),
              ],
            ),
            SizedBox(height: 15,),
            galleryListView(),
            SizedBox(height: 15,),
          ],
        ),
      );
    }

    return ContainerFirst(
        appBarHeight: 85,
        isOverLayStatusBar: true,
        isOverLayAppBar: true,
        isSingleChildScrollViewNeed: true,
        isFixedDeviceHeight: false,
        contextCurrentView: context,
        appBar: CommonAppBar(
          appBarRowMargin: EdgeInsets.only(top: 50,left: 20,right: 20),
          isHideRightIcon: false,
        ),
        containChild: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            backgroundImageStackView(),
            SizedBox(height: 20,),
            bottomDetailView(),
            SizedBox(height: 50,)
          ],
        ),
      bottomMenuView: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          color: appColors.appBgColorJungleGreen,
          padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10,top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("\$", style: appStyles.commonTitleStyle(fontSize: 22,fontWeight: FontWeight.w400),),
                  SizedBox(width: 5,),
                  Text("120", style: appStyles.commonTitleStyle(fontSize: 30,fontWeight: FontWeight.w500),),
                  Text(appString.trans(context, appString.perDayText),
                  style: appStyles.commonSubTitleTextStyle(fontSize: 10),
                  ),
                ],
              ),
              Container(
                height: 55,
                width: 150,
                child: CommonButton(
                  buttonName: appString.trans(context, appString.bookNowButtonText),
                  buttonHeight: 50,
                  buttonBorderRadius: 22,
                  isBottomMarginRequired: false,
                  textStyle: appStyles.buttonNameStyle(),
                  backCallback: () {
                    Navigator.push(MainAppBloc.getDashboardContext,
                    SlideRightRoute(
                      widget: CreateBookingScreen()
                    )
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
