import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/app_utility/animation/slide_left_route.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/menu_category_list_model.dart';
import 'package:base_flutter_app/src/values/app_dimens.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar.dart';
import 'package:base_flutter_app/src/widgets/basic_view_container/container_first.dart';
import 'package:base_flutter_app/src/widgets/category_list_view.dart';
import 'package:base_flutter_app/src/widgets/item_deatail_card.dart';
import 'package:base_flutter_app/src/widgets/common_text_field_with_error.dart';
import 'package:base_flutter_app/src/widgets/menu_grid_list_card.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar/common_app_bar_new.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  TextEditingController searchTextFieldController = TextEditingController();
  int selectedCategoryIndex = 0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);

    // category list view
    Widget category() {
      return Container(
          height: 45,
          child: /*ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 0),
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) {
                return ChoiceChip(
                  padding: const EdgeInsets.only(top: 0,bottom: 0,left: 0,right: 0),
                  labelPadding:const EdgeInsets.only(top: 0,bottom: 0,left: 0,right: 0),
                  elevation: 0,
                  pressElevation: 0,
                  label: Container(
                    width: appDimens.widthFullScreen()/2.25,
                    alignment: Alignment.center,
                    child: Text("Full Day",style: TextStyle(color: selectedIndex == index?appColors.appButtonBgColor:appColors.imageBgColor),),
                  ),
                  shape:  RoundedRectangleBorder(
                    borderRadius:  index == 0
                        ? const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                        :const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                  ),
                  backgroundColor:Colors.transparent,
                  selectedColor: appColors.appButtonBgColor,
                  selected: selectedIndex == index,
                  onSelected: (selected) {
                    setState(() {
                      selectedIndex =  index;
                    });
                  },

                );
              })*/

          ListView.builder(
            physics: ClampingScrollPhysics(),
            padding: EdgeInsets.only(
              left: 20,
            ),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: categoryDataList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    this.selectedCategoryIndex = index;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 15),
                  width: appDimens.widthFullScreen() / 2.4,
                  child: CategoryListView(
                    index: index,
                    selectedCategoryIndex: selectedCategoryIndex,
                    imageUrl: categoryDataList[index].listIcon,
                    categoryListTitle: categoryDataList[index].listTitle,
                  ),
                ),
              );
            },
          )
      );
    }

    // Search text field
    Widget searchTextField() {
      return Container(
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        width: MediaQuery.of(context).size.width,
        child: CommonTextFieldWithError(
          controllerT: searchTextFieldController,
          borderRadius: 20,
          inputHeight: 45,
          errorMsgHeight: 22,
          autoFocus: false,
          errorLeftRightMargin: 0,
          maxCharLength: 16,
          capitalization: CapitalizationText.sentences,
          cursorColor: Colors.grey,
          enabledBorderColor: Colors.brown.shade400.withOpacity(0.7),
          focusedBorderColor: Colors.brown.shade400.withOpacity(0.7),
          backgroundColor: Colors.brown.shade400.withOpacity(0.7),
          textInputAction: TextInputAction.done,
          borderStyle: BorderStyle.none,
          inputKeyboardType: InputKeyboardTypeWithError.text,
          hintText: appString.trans(context, appString.searchTextFieldHintText1),
          hintStyle: appStyles.textFieldHintTextStyle(),
          textStyle: appStyles.textFieldTextStyle(),
          inputFieldSuffixIcon: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: appColors.appButtonBgColor
            ),
            child: iconApps.iconImage(
                imageUrl: iconApps.searchIcon,
                iconSize: Size(20, 20),
                imageColor: Colors.grey.shade200),
          ),
          contentPadding: EdgeInsets.only(left: 15, right: 15),
          onTextChange: (value) {},
          onEndEditing: (value) {},
        ),
      );
    }

    //Grid view card
    Widget gridView(){
      List<MenuGridCardModel> gridItemList = categoryDataList[selectedCategoryIndex].gridItemList;
      return Container(
        child: GridView.builder(
          padding: EdgeInsets.only(left: 15,bottom: 30,),
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: gridItemList.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  SlideRightRoute(
                      widget: ItemDetailCard(
                        imageUrl: gridItemList[index].imageUrl,
                        title: gridItemList[index].title,
                        subTitle: gridItemList[index].subTitle,
                        description: gridItemList[index].description,
                        price: gridItemList[index].price,
                        isFav: gridItemList[index].isLiked,
                      )
                  ),
                );
              },
              child: MenuGridListCard(
                imageUrl: gridItemList[index].imageUrl,
                menuGridItemTitle: gridItemList[index].title,
                menuGridItemSubtitle: gridItemList[index].subTitle,
                price: gridItemList[index].price,
                isFav: gridItemList[index].isLiked,
              ),
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 15.0,
              mainAxisExtent: 230
          ),

        ),
      );
    }

    return ContainerFirst(
      contextCurrentView: context,
      isSingleChildScrollViewNeed: true,
      isFixedDeviceHeight: true,
      statusBarColor: appColors.appThemeColor1,
      appBarHeight: 56,
      appBar: CommonAppBarNew(
        isShowTitle: true,
        isHideRightICon: true,
        appBarColor: appColors.appThemeColor1,
        title: appString.trans(context, appString.menuText),
      ),
      appBackgroundColor: Colors.white,
      containChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          searchTextField(),
          SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              appString.trans(context, appString.categoryTitleText),
              style: appStyles.titleTextStyle1(),
            ),
          ),
          SizedBox(height: 15,),
          category(),
          SizedBox(height: 15,),
          gridView()
        ],
      ),

    );
  }
}
