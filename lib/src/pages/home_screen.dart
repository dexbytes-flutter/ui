import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/home_screen_verticle_title_list.dart';
import 'package:base_flutter_app/src/widgets/appbar/home_screen_app_bar.dart';
import 'package:base_flutter_app/src/widgets/common_vertical_list.dart';
import 'package:base_flutter_app/src/widgets/home_page_common_image.dart';
import 'package:flutter/material.dart';

import '../all_file_import/app_providers_files_link.dart';
import 'destination_card_detailed_view_screen.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  String imageUrl = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);

    // Title text and search icon
    Widget titleText() {
      return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              appString.trans(context, appString.recommendationText),
              style: appStyles.commonTitleStyle(
                  fontSize: 18, texColor: appColors.buttonBgColor),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  MainAppBloc.getDashboardContext,
                  SlideRightRoute(
                      widget: SearchScreen(
                        isVerticalImageCardView: false,
                    isVerticalViewSearchResult: false,
                  )),
                );
              },
              child: iconApps.iconImage(
                  imageUrl: iconApps.searchIcon,
                  imageColor: appColors.buttonBgColor,
                  iconSize: Size(22, 22)),
            )
          ],
        ),
      );
    }

    // Vertical title list
    Widget verticalTitleList() {
      return Container(
        width: 58,
        // color: Colors.yellow,
        child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: ClampingScrollPhysics(),
          itemCount: homeVerticalList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: RotatedBox(
                quarterTurns: -1,
                child: CommonVerticalList(
                  listTitle: homeVerticalList[index].listTitle,
                  index: index,
                  selectedIndex: selectedIndex,
                  isHorizontalList: false,
                ),
              ),
            );
          },
        ),
      );
    }

    // Center image list
    Widget listView() {
      List<VerticalTitleSublistList> verticalTitleSubTitleList =
          homeVerticalList[selectedIndex].verticalTitleSubTitleList;
      return Container(
        width: appDimens.widthFullScreen() / 1.195,
        height: appDimens.heightFullScreen() / 1.52,
        margin: EdgeInsets.only(top: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: verticalTitleSubTitleList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  imageUrl = verticalTitleSubTitleList[selectedIndex].imageUrl;
                });
                Navigator.push(
                  MainAppBloc.getDashboardContext,
                  SlideRightRoute(
                      widget: DestinationDetailedCardView(
                          detailImageUrl: imageUrl)),
                );
              },
              child: Container(
                  margin: EdgeInsets.only(right: 15),
                  child: HomepageCommonImage(
                    imageUrl: verticalTitleSubTitleList[index].imageUrl,
                    selectedIndex: homeVerticalList[selectedIndex].id,
                    placeTitle: verticalTitleSubTitleList[index].placeName,
                    placeSubTitle: verticalTitleSubTitleList[index].placeSubTitle,
                    isHorizontalViewCard: false,
                    isBookmarked: verticalTitleSubTitleList[index].isBookmarked,
                    rating: verticalTitleSubTitleList[index].rating,
                    recommendationType: verticalTitleSubTitleList[index].recommendationType,
                    numberOfDestination: verticalTitleSubTitleList[index].numberOfDestination,
                    destinationText: verticalTitleSubTitleList[index].destinationText,
                    placeFlag: verticalTitleSubTitleList[index].flagUrl,
                    isVerticalCardListView: false,
                    onButtonClickCallback: (){
                      setState(() {
                        imageUrl = verticalTitleSubTitleList[selectedIndex].imageUrl;
                      });
                      Navigator.push(
                        MainAppBloc.getDashboardContext,
                        SlideRightRoute(
                            widget: DestinationDetailedCardView(
                                detailImageUrl: imageUrl)),
                      );
                    },
                  )),
            );
          },
        ),
      );
    }

    //Center view
    Widget homeCenterView() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [verticalTitleList(), listView()],
      );
    }

    return ContainerFirst(
        appBarHeight: 56,
        isOverLayStatusBar: false,
        isSingleChildScrollViewNeed: false,
        contextCurrentView: context,
        appBar: HomeScreenAppBar(
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          isHideBackIcon: false,
        ),
        containChild: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            titleText(),
            Padding(
              padding: const EdgeInsets.only(
                top: 5,
                left: 20,
              ),
              child: SizedBox(
                child: Divider(
                  color: appColors.appBgColor1.withOpacity(0.15),
                  height: 20,
                  thickness: 2,
                ),
              ),
            ),
            homeCenterView()
          ],
        ));
  }
}
