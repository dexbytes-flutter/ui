import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/model/bookmark_list_model.dart';
import 'package:base_flutter_app/src/model/home_screen_verticle_title_list.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar.dart';
import 'package:base_flutter_app/src/widgets/home_page_common_image.dart';
import 'package:flutter/material.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {

  @override
  Widget build(BuildContext context) {

    // Title text
    Widget titleText(){
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(appString.trans(context, appString.yourBookmarkTitleText,),
              style: appStyles.commonTitleStyle(fontSize: 25,texColor: appColors.buttonBgColor),
            ),
          ),
        ],
      );
    }

    // Center image list view
    Widget listView() {
      return Container(
        width: appDimens.widthFullScreen(),
        height: appDimens.heightFullScreen() / 1.35,
        margin: EdgeInsets.only(top: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: bookmarkList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {

                });
                /*Navigator.push(
                  MainAppBloc.getDashboardContext,
                  SlideRightRoute(
                      widget: DestinationDetailedCardView(
                          detailImageUrl: imageUrl)),
                );*/
              },
              child: Container(
                  margin: EdgeInsets.only(left: 20,),
                  child: HomepageCommonImage(
                    imageUrl: bookmarkList[index].imageUrl,
                    placeTitle: bookmarkList[index].placeTitle,
                    subTitle: bookmarkList[index].placeSubTitle,
                    // countryTitle: bookmarkList[index].placeTitle,
                    isHorizontalViewCard: false,
                    rating: bookmarkList[index].rating,
                    isBookmarked: bookmarkList[index].isBookMarked,
                    placeFlag: bookmarkList[index].flagImageUrl,
                    imageHeight: appDimens.heightFullScreen() / 1.10,
                    imageWidth: appDimens.widthFullScreen()/1.25,
                    numberOfDestination: 1,
                    destinationText: "",
                    placeSubTitle: bookmarkList[index].placeSubTitle,
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
                    }, recommendationType: '',
                  )),
            );
          },
        ),
      );
    }

    return ContainerFirst(
        appBar: titleText(),
        appBarHeight: 56,
        isOverLayStatusBar: false,
        isSingleChildScrollViewNeed: false,
        contextCurrentView: context,
        containChild: Column(
          children: [
            Container(
              height: 2,
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Divider(
                color: appColors.appBgColor1.withOpacity(0.15),
                height: 20,
                thickness: 2,
              ),
            ),
            SizedBox(height: 15,),
            listView()
          ],
        )
    );
  }
}
