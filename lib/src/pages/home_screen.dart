import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/bloc/main_app_bloc/main_app_bloc.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/coffee_model.dart';
import 'package:base_flutter_app/src/model/special_for_you_model.dart';
import 'package:base_flutter_app/src/pages/menu_screen.dart';
import 'package:base_flutter_app/src/values/app_string.dart';
import 'package:base_flutter_app/src/widgets/appbar/home_appbar.dart';
import 'package:base_flutter_app/src/widgets/basic_view_container/container_first.dart';
import 'package:base_flutter_app/src/widgets/item_deatail_card.dart';
import 'package:base_flutter_app/src/widgets/coffee_name_horizontal_list.dart';
import 'package:base_flutter_app/src/widgets/common_coffee_card_list_widget.dart';
import 'package:base_flutter_app/src/widgets/common_text_field_with_error.dart';
import 'package:base_flutter_app/src/widgets/special_for_you_common_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../all_file_import/app_utils_files_link.dart';
import '../model/coffee_card_model.dart';
import 'coffee_profile_screen.dart';

class HomeScreen extends StatefulWidget {
  final int selectedCoffeeNameIndex;
  const HomeScreen({Key? key, this.selectedCoffeeNameIndex = 0})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedCoffeeNameIndex = 0;
  TextEditingController searchTextFieldController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchTextFieldController.dispose();
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
        borderRadius: 12,
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
        hintStyle: appStyles.textFieldHintTextStyle(),
        textStyle: appStyles.textFieldTextStyle(),
        inputFieldPrefixIcon: Container(
          margin: EdgeInsets.all(15),
          child: iconApps.iconImage(
              imageUrl: iconApps.searchIcon,
              iconSize: Size(20, 20),
              imageColor: Colors.grey.shade200),
        ),
        contentPadding: EdgeInsets.only(left: 15, right: 15),
        onTextChange: (value) {
          FocusScope.of(context).unfocus();
        },
        onEndEditing: (value) {
          FocusScope.of(context).unfocus();
        },
      ),
    );
  }

  // Coffee name list view
  Widget coffeeNameWidget() {
    return Container(
      height: 45,
      margin: EdgeInsets.only(left: 8),
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(
          ),
          scrollDirection: Axis.horizontal,
          itemCount: coffeeNameList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () {
                  setState(() {
                    this.selectedCoffeeNameIndex = index;
                  });
                },
                child: CoffeeNameHorizontalList(
                  selectedCoffeeNameIndex: selectedCoffeeNameIndex,
                  coffeeListTitle: coffeeNameList[index].title,
                  index: index,
                ),
            );
          })
    );
  }

  //Coffee card list
  Widget coffeeCardListView(){
    return Container(
        height: 230,
        child: ListView.builder(
          padding: EdgeInsets.only(left: 15,),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: coffeeCardList.length,
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: (){
                Navigator.push(
                  MainAppBloc.getDashboardContext!,
                  SlideRightRoute(
                      widget: ItemDetailCard(
                        imageUrl: coffeeCardList[index].imageUrl,
                        title: coffeeCardList[index].title,
                        subTitle: coffeeCardList[index].subTitle,
                        price: coffeeCardList[index].price,
                        description: coffeeCardList[index].description,
                      )
                  ),
                );
              },
              child: CommonCoffeeCardList(
                imageUrl: coffeeCardList[index].imageUrl,
                coffeeListTitle: coffeeCardList[index].title,
                coffeeListSubTitle: coffeeCardList[index].subTitle,
                price: coffeeCardList[index].price,
              ),
            );
          },
        )
    );
  }

  //Special for you card list
  Widget specialForYouView(){
    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: ClampingScrollPhysics(),
        itemCount: specialForYouDataList.length,
        itemBuilder: (contex,index){
          return SpecialForYouCard(
            imageUrl: specialForYouDataList[index].imageUrl,
            title: specialForYouDataList[index].title,
            subTitle: specialForYouDataList[index].subTitle,
            price: specialForYouDataList[index].price,
          );
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);

    return ContainerFirst(
      contextCurrentView: context,
      isSingleChildScrollViewNeed: true,
      isFixedDeviceHeight: true,
      appBarHeight: 56,
      appBar: HomeAppBar(
        callbackFunction: (){
          Navigator.push(
            MainAppBloc.getDashboardContext,
            SlideRightRoute(
                widget: MenuScreen()
            ),
          );
        },
        profileCallBack: (){
          Navigator.push(
            MainAppBloc.getDashboardContext,
            SlideRightRoute(
                widget: ProfileScreen()
            ),
          );
        },
      ),
      containChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top title text
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 15),
            child: Text(
              appString.trans(context, appString.findBestCoffeeText),
              style: appStyles.homeMenuTopTitleTextStyle(),
            ),
          ),
          SizedBox(height: 20,),
          searchTextField(),
          SizedBox(height: 20,),
          coffeeNameWidget(),
          SizedBox(height: 10,),
          coffeeCardListView(),// Coffee list card view
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              appString.trans(context, appString.specialForYouTitle),
              style: appStyles.titleTextStyle1(),
            ),
          ),
          SizedBox(height: 15,),
          specialForYouView(),// Special for you widget
          SizedBox(height: 15,),
          SizedBox(height: 15,),
          SizedBox(height: 15,),
          SizedBox(height: 15,),
          SizedBox(height: 15,),
          SizedBox(height: 15,),
        ],
      ),
    );
  }
}
