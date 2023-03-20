import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/home_screen_verticle_title_list.dart';
import 'package:base_flutter_app/src/widgets/common_vertical_list.dart';
import 'package:base_flutter_app/src/widgets/home_page_common_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/city_and_destination_horizontal_model.dart';
import '../widgets/appbar/common_app_bar.dart';

class CityDetailScreen extends StatefulWidget {
  const CityDetailScreen({Key? key}) : super(key: key);

  @override
  State<CityDetailScreen> createState() => _CityDetailScreenState();
}

class _CityDetailScreenState extends State<CityDetailScreen> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    // Background Image widget
    Widget backgroundImage() {
      return Stack(
        alignment: Alignment.center,
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
            child: CachedNetworkImage(
              height: appDimens.heightFullScreen() / 2.10,
              width: appDimens.widthFullScreen(),
              imageUrl:
              "https://www.plataran.com/wp-content/uploads/2020/04/plataran-bimonthly-may-june-2019-lr-15_0ztqu.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 140,
            child: Text(appString.trans(context, appString.topRecommendedCityTitleText),
                style: appStyles.commonSubTitleTextStyle(fontSize: 11, fontWeight: FontWeight.w900)
            ),
          ),
          Positioned(
          bottom: 100,
            child: Text("Bali",
                style: appStyles.commonTitleStyle(fontSize: 30, fontWeight: FontWeight.w900)
            ),
          ),
          Positioned(
            bottom: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                      SizedBox(width: 5,),
                      Text("Indonesia",
                        style: appStyles.commonSubTitleTextStyle(fontSize: 11,fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Container(
                    height: 30,
                    margin: EdgeInsets.only(left: 10,right: 10),
                    child: VerticalDivider(
                      width: 0,
                      thickness: 1,
                      endIndent: 4,
                      indent: 5,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  iconApps.iconImage(
                      imageUrl: iconApps.islandIcon,
                      iconSize: Size(15, 15),
                      imageColor: appColors.white
                  ),
                  SizedBox(width: 5,),
                  Text("July 21 2023",
                    style: appStyles.commonSubTitleTextStyle(fontSize: 11,fontWeight: FontWeight.w600),
                  )
                ],
              )
          ),
          Positioned(
            bottom: 30,
              child: Text(appString.trans(context, appString.exploreBeautyDestinationText),
                softWrap: true, textAlign: TextAlign.center,
                style: appStyles.commonSubTitleTextStyle(fontSize: 11)
              )
          ),
        ],
      );
    }

    // horizontal list view
    Widget verticalTitleList() {
      return Container(
        height: 20,
        // color: Colors.yellow,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          physics: ClampingScrollPhysics(),
          itemCount: cityAndDestinationHorizontalList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: CommonVerticalList(
                commonListMargin: EdgeInsets.only(left: 20),
                listTitle: cityAndDestinationHorizontalList[index].listViewTitle,
                index: cityAndDestinationHorizontalList[index].listTitleId,
                selectedIndex: selectedIndex,
                isHorizontalList: cityAndDestinationHorizontalList[index].isCityAndDestinationList,
              ),
            );
          },
        ),
      );
    }

    // City and Destination image list
    Widget listView() {
      List<CityAndDestinationCardViewModel> cityAndDestinationSubList =
          cityAndDestinationHorizontalList[selectedIndex].cityAndDestinationSubList;
      return Container(
        width: appDimens.widthFullScreen(),
        height: appDimens.heightFullScreen() / 2.28,
        margin: EdgeInsets.only(top: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: cityAndDestinationSubList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  // imageUrl = verticalTitleSubTitleList[selectedIndex].imageUrl;
                });
               /* Navigator.push(
                  MainAppBloc.getDashboardContext,
                  SlideRightRoute(
                      widget: DestinationDetailedCardView(
                          detailImageUrl: imageUrl)),
                );*/
              },
              child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: HomepageCommonImage(
                    imageUrl: cityAndDestinationSubList[index].imageUrl,
                    selectedIndex: cityAndDestinationHorizontalList[selectedIndex].listTitleId,
                    placeTitle: cityAndDestinationSubList[index].placeName,
                    placeSubTitle: cityAndDestinationSubList[index].placeSubTitle,
                    isHorizontalViewCard: false,
                    isVerticalCardListView: false,
                    isBookmarked: cityAndDestinationSubList[selectedIndex].isBookmarked,
                    rating: cityAndDestinationSubList[index].rating,
                    recommendationType: cityAndDestinationSubList[index].recommendationType,
                    numberOfDestination: cityAndDestinationSubList[index].numberOfDestination,
                    destinationText: cityAndDestinationSubList[index].destinationText,
                    placeFlag: cityAndDestinationSubList[index].flagUrl,
                    isCityScreen: false,
                    imageWidth: appDimens.widthFullScreen()/1.75,
                    isCityDetail: true,
                    onButtonClickCallback: (){
                      setState(() {
                        // imageUrl = verticalTitleSubTitleList[selectedIndex].imageUrl;
                      });
                      /*Navigator.push(
                        MainAppBloc.getDashboardContext,
                        SlideRightRoute(
                            widget: DestinationDetailedCardView(
                                detailImageUrl: imageUrl)),
                      );*/
                    },
                  )),
            );
          },
        ),
      );
    }

    return ContainerFirst(
        appBarHeight: 85,
        isOverLayStatusBar: true,
        isOverLayAppBar: true,
        isSingleChildScrollViewNeed: false,
        isFixedDeviceHeight: false,
        contextCurrentView: context,
        appBar: CommonAppBar(
          appBarRowMargin: EdgeInsets.only(top: 50,left: 20,right: 20),
          isHideRightIcon: true,
        ),
        containChild: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            backgroundImage(),
            verticalTitleList(),
            SizedBox(height: 10,),
            listView()
          ],
        )
    );
  }
}
