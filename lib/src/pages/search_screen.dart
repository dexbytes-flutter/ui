import 'package:base_flutter_app/src/all_file_import/app_providers_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/filter_choice_chip_model.dart';
import 'package:base_flutter_app/src/model/home_screen_verticle_title_list.dart';
import 'package:base_flutter_app/src/model/recent_search_model.dart';
import 'package:base_flutter_app/src/pages/destination_search_filter_bottom_sheet.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar.dart';
import 'package:base_flutter_app/src/widgets/appbar/home_screen_app_bar.dart';
import 'package:base_flutter_app/src/widgets/common_choice_chip_widget.dart';
import 'package:base_flutter_app/src/widgets/common_vertical_list.dart';
import 'package:base_flutter_app/src/widgets/home_page_common_image.dart';
import 'package:base_flutter_app/src/widgets/recent_search_list.dart';
import 'package:base_flutter_app/src/widgets/search_screen_image.dart';
import 'package:flutter/material.dart';

import '../all_file_import/app_values_files_link.dart';
import '../widgets/title_text.dart';

class SearchScreen extends StatefulWidget {
  final bool? isFilterApplied;
  final bool? isVerticalViewSearchResult;
  const SearchScreen({
    Key? key,
    this.isFilterApplied,
    this.isVerticalViewSearchResult
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Map<String, TextEditingController> controllers = {
    'search': new TextEditingController(),
  };

  Map<String, FocusNode> focusNodes = {
    'search': new FocusNode(),
  };

  Map<String, String> errorMessages = {
    'search': "",
  };

  int selectedIndex = 0;

  int? _selectedIndex;


  @override
  Widget build(BuildContext context) {

    // Top search field
    Widget topSearchField() {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20,),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 250,
              child: CommonTextFieldWithError(
                decoration: InputDecoration(
                  hintText: appString.trans(
                      context, appString.searchTextFieldHintText),
                  hintStyle: appStyles.textFieldHintTextTextStyle(),
                  contentPadding: EdgeInsets.all(10).copyWith(top: 18),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: appColors.appBgColor1.withOpacity(0.30),
                        width: 1.5),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: appColors.appBgColor1.withOpacity(0.30),
                        width: 1.5),
                  ),
                ),
                focusNode: focusNodes["search"],
                isShowBottomErrorMsg: true,
                errorMessages: errorMessages['search']?.toString() ?? '',
                controllerT: controllers['search'],
                inputHeight: 50,
                errorMsgHeight: 22,
                autoFocus: false,
                errorLeftRightMargin: 0,
                maxCharLength: 25,
                capitalization: CapitalizationText.none,
                cursorColor: appColors.appBgColor1,
                textInputAction: TextInputAction.done,
                borderStyle: BorderStyle.none,
                inputKeyboardType: InputKeyboardTypeWithError.email,
                errorStyle: appStyles.errorStyle(fontSize: 10),
                errorMessageStyle: appStyles.errorStyle(fontSize: 9),
                textStyle: appStyles.textFieldTextTextStyle(),
                onTextChange: (value) {},
                onEndEditing: (value) {},
              ),
            ),
            GestureDetector(
              onTap: (){

              },
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: appColors.buttonBgColor),
                child: iconApps.iconImage(
                    imageUrl: iconApps.searchIcon,
                    imageColor: appColors.black,
                    iconSize: Size(20, 20)),
              ),
            )
          ],
        ),
      );
    }

    // Recent search list
    Widget recentSearchTexts(){
      return Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Wrap(
          spacing: 10.0,
          runSpacing: -5,
          children: <Widget>[
            ChoiceChipWidget(
                reportList: chipList,
                isAvatar: false,
            ),
          ],
        ),
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

    // Search result title text with filter button
    Widget titleWithFilterOption(){
      return Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.isFilterApplied!
                ? Row(
              children: [
                Text(appString.trans(context, appString.foundText),
                  style: appStyles.commonSubTitleTextStyle(fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
                SizedBox(width: 3,),
                Text("90+",
                  style: appStyles.commonSubTitleTextStyle(fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
                SizedBox(width: 3,),
                Text(appString.trans(context, appString.destinationText),
                  style: appStyles.commonSubTitleTextStyle(fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ],
            )
                : Text(appString.trans(context, appString.topRecentSearchText),
              style: appStyles.commonSubTitleTextStyle(fontWeight: FontWeight.w500,
                  fontSize: 15),
            ),
            GestureDetector(
              onTap: (){
                showModalBottomSheet(
                    context: context,
                    builder: (context) => DestinationSearchFilterBottomSheet(),
                    isScrollControlled: true,
                    backgroundColor: appColors.appTransColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                        )
                    ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(8).copyWith(left: 15,right: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: widget.isFilterApplied!
                      ? appColors.appBgColor1.withOpacity(0.20)
                      : appColors.appTransColor,
                      width: widget.isFilterApplied!? 1.5 : 0),
                    color: widget.isFilterApplied!
                        ? appColors.appBgColor2
                        : appColors.buttonBgColor,
                ),
                child: iconApps.iconImage(
                    imageUrl: iconApps.filterIcon,
                    imageColor: widget.isFilterApplied!
                        ? appColors.buttonBgColor
                        : appColors.black,
                    iconSize: Size(20, 20)),
              ),
            )
          ],
        ),
      );
    }

    // Center view
    Widget centerView() {
      return widget.isFilterApplied!
          ? Container(
        width: appDimens.widthFullScreen(),
        height: appDimens.heightFullScreen()/1.58,
        margin: EdgeInsets.only(top: 10,left: 20),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: searchScreenImageList.length,
          itemBuilder: (context,index){
            return Container(
                margin: EdgeInsets.only(right: 15),
                child: HomepageCommonImage(
                  imageUrl: searchScreenImageList[index].imageUrl,
                  title: searchScreenImageList[index].title,
                  subTitle: searchScreenImageList[index].subTitle,
                  countryTitle: searchScreenImageList[index].countryTitle,
                  isHorizontalViewCard: true,
                  isBookmarked: searchScreenImageList[index].isBookmarked ?? true,
                )
            );
          },
        ),
      )
          : Container(
        color: appColors.appBgColorJungleGreen,
        margin: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: appDimens.widthFullScreen(),
              height: appDimens.heightFullScreen() / 3.8,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: searchScreenImageList.length,
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.only(right: 15),
                      child: SearchScreenCommonImage(
                        imageUrl: searchScreenImageList[index].imageUrl,
                        title: searchScreenImageList[index].title,
                        subTitle: searchScreenImageList[index].subTitle,
                        countryTitle: searchScreenImageList[index].countryTitle,
                        imageWidth: appDimens.widthFullScreen()/1.25 ,
                        isBookmarked: searchScreenImageList[index].isBookmarked,
                        isStaticCalenderIcon: false,
                        bookingStatus: "",
                        recommendationStatus: "",
                      ));
                },
              ),
            ),
          ],
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
          itemCount: searchScreenImageList.length,
          itemBuilder: (context, index) {
            return Container(
              height: appDimens.heightFullScreen()/3.8,
                margin: EdgeInsets.only(bottom: 15),
                child: SearchScreenCommonImage(
                  imageUrl: searchScreenImageList[index].imageUrl,
                  title: searchScreenImageList[index].title,
                  subTitle: searchScreenImageList[index].subTitle,
                  countryTitle: searchScreenImageList[index].countryTitle,
                  imageHeight: appDimens.heightFullScreen()/3.8,
                  imageWidth: appDimens.widthFullScreen()/1.10,
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
          leftIconMargin: EdgeInsets.only(left: 20),
          isHideRightIcon: true,
        ),
        containChild: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            topSearchField(),
            titleWithFilterOption(),
            SizedBox(height: 20,),
            widget.isFilterApplied!?
            Container() : recentSearchTexts(),
            SizedBox(height: widget.isFilterApplied!? 0 : 20,),
            widget.isFilterApplied!?
            Container() : Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: TitleText(
                text: appString.trans(context, appString.recommendedForYouTex),
                style: appStyles.commonTitleStyle(fontSize: 15,texColor: appColors.textColor,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            SizedBox(height: widget.isFilterApplied!?0 : 20,),
            widget.isVerticalViewSearchResult!
                ? verticalFilterView()
                : centerView(),
          ],
        ));
  }
}
