import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/app_utility/animation/slide_left_route.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/menu_category_list_model.dart';
import 'package:base_flutter_app/src/values/app_dimens.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar.dart';
import 'package:base_flutter_app/src/widgets/basic_view_container/container_first.dart';
import 'package:base_flutter_app/src/widgets/category_list_view.dart';
import 'package:base_flutter_app/src/widgets/coffee_deatail_card.dart';
import 'package:base_flutter_app/src/widgets/common_text_field_with_error.dart';
import 'package:base_flutter_app/src/widgets/menu_grid_list_card.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  TextEditingController searchTextFieldController = TextEditingController();
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);

    // category list view
    Widget category() {
      return Container(
          height: 45,
          child: ListView.builder(
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
                child: CategoryListView(
                  index: index,
                  selectedCategoryIndex: selectedCategoryIndex,
                  imageUrl: categoryDataList[index].listIcon,
                  categoryListTitle: categoryDataList[index].listTitle,
                ),
              );
            },
          )
      );
    }

    // Search text field
    Widget searchTextField() {
      return Container(
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
          hintText: appString.trans(context, appString.searchTextFieldHintText),
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade200,
          ),
          textStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
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
        // height: appDimens.heightFullScreen(),
        child: GridView.builder(
          padding: EdgeInsets.only(left: 10,bottom: 30),
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
                      )
                  ),
                );
              },
              child: MenuGridListCard(
                imageUrl: gridItemList[index].imageUrl,
                menuGridItemTitle: gridItemList[index].title,
                menuGridItemSubtitle: gridItemList[index].subTitle,
                price: gridItemList[index].price,
                isFav: false,
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
      statusBarColor: Colors.white,
      appBarHeight: 56,
      appBar: CommonAppBar(
        isShowTitle: true,
        title: "Menu",
        isHideRightICon: true,
        isHideLeftIcon: true,
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
              "Categories",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: appColors.textColor.withOpacity(0.80)),
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
