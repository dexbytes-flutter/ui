import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/explore_card_data_model.dart';
import 'package:base_flutter_app/src/model/home_screen_verticle_title_list.dart';
import 'package:base_flutter_app/src/widgets/search_screen_image.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);
    // Title text
    Widget titleText(){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal:20,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Text(appString.trans(context, appString.nearByDestinationTitleText,),
                softWrap: true,textAlign: TextAlign.left,
                style: appStyles.commonTitleStyle(fontSize: 38,),
              ),
            ),
            iconApps.iconImage(
                imageUrl: iconApps.searchIcon,
                imageColor: appColors.buttonBgColor,
                iconSize: Size(25, 25))
          ],
        ),
      );
    }

    //Bottom card view
    bottomCardView(){
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: appDimens.widthFullScreen(),
              // height: appDimens.heightFullScreen() / 4,
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                padding: EdgeInsets.only(left: 20),
                itemCount: exploreCardDataList.length,
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.only(right: 15),
                      child: SearchScreenCommonImage(
                        placeTitle: exploreCardDataList[index].placeName,
                        placeSubTitle: exploreCardDataList[index].placeSubTitle,
                        imageUrl: exploreCardDataList[index].imageUrl,
                        imageWidth: appDimens.widthFullScreen()/1.25 ,
                        isBookmarked: exploreCardDataList[index].isBookmarked,
                        isStaticCalenderIcon: false,
                        bookingStatus: "",
                        placeFlag: exploreCardDataList[index].flagUrl,
                        recommendationType: exploreCardDataList[index].recommendationType,
                      ));
                },
              ),
            ),
          ],
        ),
      );
    }

    return ContainerFirst(
        appBarHeight: 85,
        isOverLayStatusBar: false,
        isSingleChildScrollViewNeed: false,
        contextCurrentView: context,
        appBar: titleText(),
        containChild: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: appDimens.heightFullScreen(),
              width: appDimens.heightFullScreen(),
              color: appColors.appBgColorJungleGreen,
              child: Text(""),
            ),
            Positioned(
                bottom: appDimens.heightFullScreen()/3.6,
                // bottom: 245,
                child:  bottomCardView()
            )
          ],
        )
    );
  }
}
