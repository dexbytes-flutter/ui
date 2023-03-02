import 'package:base_flutter_app/src/all_file_import/app_providers_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/home_screen_verticle_title_list.dart';
import 'package:base_flutter_app/src/model/recent_search_model.dart';
import 'package:base_flutter_app/src/pages/destination_filter_screen.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar.dart';
import 'package:base_flutter_app/src/widgets/appbar/home_screen_app_bar.dart';
import 'package:base_flutter_app/src/widgets/common_vertical_list.dart';
import 'package:base_flutter_app/src/widgets/home_page_common_image.dart';
import 'package:base_flutter_app/src/widgets/recent_search_list.dart';
import 'package:base_flutter_app/src/widgets/search_screen_image.dart';
import 'package:flutter/material.dart';

import '../all_file_import/app_values_files_link.dart';
import '../widgets/title_text.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

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
                Navigator.push(
                  MainAppBloc.getDashboardContext,
                  SlideRightRoute(widget: DestinationFilterScreen()),
                );
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
      return Container(
        padding: EdgeInsets.only(left: 20),
        child: Wrap(
          runSpacing: 8.0,
          spacing: 10.0,
          children: [
            Container(
              padding:
              EdgeInsets.all(10).copyWith(left: 15, right: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: appColors.appBgColor2),
              child: Text("Indonesia",
                style: appStyles.commonSubTitleTextStyle(fontSize: 13,texColor: appColors.white),
              ),
            ),
            Container(
              padding:
              EdgeInsets.all(10).copyWith(left: 15, right: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: appColors.appBgColor2),
              child: Text(
                  "Blausee",
                  style: appStyles.commonSubTitleTextStyle(fontSize: 13,texColor: appColors.white)
              ),
            ),
            Container(
              padding:
              EdgeInsets.all(10).copyWith(left: 15, right: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: appColors.appBgColor2),
              child: Text(
                  "National Park",
                  style: appStyles.commonSubTitleTextStyle(fontSize: 13,texColor: appColors.white)
              ),
            ),
            Container(
              padding:
              EdgeInsets.all(10).copyWith(left: 15, right: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: appColors.appBgColor2),
              child: Text("Komodo Island",
                  style: appStyles.commonSubTitleTextStyle(fontSize: 13,texColor: appColors.white)
              ),
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


    // Center stack view
    Widget centerView() {
      return Container(
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
                        countryTitle:
                            searchScreenImageList[index].countryTitle,
                      ));
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),

          ],
        ),
      );
    }


    return ContainerFirst(
        appBarHeight: 56,
        isOverLayStatusBar: false,
        isSingleChildScrollViewNeed: false,
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
            // Top recent search title text
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: TitleText(
                  text: appString.trans(context, appString.topRecentSearchText),
                style: appStyles.commonTitleStyle(fontSize: 15,texColor: appColors.textColor,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            SizedBox(height: 20,),
            recentSearchTexts(),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: TitleText(
                text: appString.trans(context, appString.recommendedForYouTex),
                style: appStyles.commonTitleStyle(fontSize: 15,texColor: appColors.textColor,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            SizedBox(height: 20,),
            centerView(),
          ],
        ));
  }
}
