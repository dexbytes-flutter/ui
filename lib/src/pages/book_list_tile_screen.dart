import 'package:base_flutter_app/src/all_file_import/app_providers_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/booking_list_model.dart';
import 'package:base_flutter_app/src/model/home_screen_verticle_title_list.dart';
import 'package:base_flutter_app/src/pages/booking_detail_card_view_screen.dart';
import 'package:base_flutter_app/src/pages/search_screen.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar.dart';
import 'package:base_flutter_app/src/widgets/search_screen_image.dart';
import 'package:flutter/material.dart';

class BookListTileScreen extends StatefulWidget {
  const BookListTileScreen({Key? key}) : super(key: key);

  @override
  State<BookListTileScreen> createState() => _BookListTileScreenState();
}

class _BookListTileScreenState extends State<BookListTileScreen> {

  String imageUrl = "";
  bool isBookMarked = false;
  String locationName = "";

  @override
  Widget build(BuildContext context) {

    // Title text and search icon
    Widget titleText(){
      return Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 25),
        child: GestureDetector(
          onTap: (){

          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(appString.trans(context, appString.bookingListText),
                style: appStyles.commonTitleStyle(fontSize: 18,texColor: appColors.buttonBgColor),
              ),
              iconApps.iconImage(
                  imageUrl: iconApps.searchIcon,
                  imageColor: appColors.buttonBgColor,
                  iconSize: Size(22, 22)
              ),
            ],
          ),
        ),
      );
    }

    // Vertical filter view
    Widget verticalFilterView() {
      return  Container(
        height: appDimens.heightFullScreen(),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          // physics: ClampingScrollPhysics(),
          padding: EdgeInsets.only(left: 20,right: 20,bottom: 210),
          itemCount: bookingListPlaceImagesList.length,
          itemBuilder: (context, index) {
            return Container(
                height: appDimens.heightFullScreen()/4,
                margin: EdgeInsets.only(bottom: 15),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      imageUrl = bookingListPlaceImagesList[index].imageUrl;
                      isBookMarked = bookingListPlaceImagesList[index].isBookmarked;
                      locationName = bookingListPlaceImagesList[index].title;
                    });
                    Navigator.push(context, SlideRightRoute(
                      widget: BookingDetailCardViewScreen(
                        isBookMarked: isBookMarked,
                        imageUrl: imageUrl,
                        locationName: locationName,
                      )
                    ));
                  },
                  child: SearchScreenCommonImage(
                    imageUrl: bookingListPlaceImagesList[index].imageUrl,
                    placeTitle: bookingListPlaceImagesList[index].title,
                    placeSubTitle: bookingListPlaceImagesList[index].subTitle,
                    countryTitle: bookingListPlaceImagesList[index].countryTitle,
                    isStaticCalenderIcon: true,
                    isBookmarked: bookingListPlaceImagesList[index].isBookmarked,
                    bookingStatus: bookingListPlaceImagesList[index].bookingStatus,
                    recommendationType: bookingListPlaceImagesList[index].recommendation,
                    imageHeight: appDimens.heightFullScreen()/4,
                    imageWidth: appDimens.widthFullScreen()/1.10,
                    placeFlag: "",

                  ),
                ));
          },
        ),
      );
    }

    return ContainerFirst(
        appBarHeight: 56,
        isOverLayStatusBar: false,
        isSingleChildScrollViewNeed: false,isFixedDeviceHeight: false,
        contextCurrentView: context,
        appBar: CommonAppBar(
          isHideRightIcon: true,
        ),
        containChild: Column(
          children: [
            titleText(),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20,),
              child: SizedBox(
                child: Divider(
                  color: appColors.appBgColor1.withOpacity(0.15),
                  height: 20,
                  thickness: 2,
                ),
              ),
            ),
            SizedBox(height: 15,),
            verticalFilterView()
          ],
        )
    );
  }
}
