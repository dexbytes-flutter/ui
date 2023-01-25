import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/bloc/main_app_bloc/main_app_bloc.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/coffee_model.dart';
import 'package:base_flutter_app/src/values/app_string.dart';
import 'package:base_flutter_app/src/widgets/appbar/home_appbar.dart';
import 'package:base_flutter_app/src/widgets/basic_view_container/container_first.dart';
import 'package:base_flutter_app/src/widgets/coffee_deatail_card.dart';
import 'package:base_flutter_app/src/widgets/common_text_field_with_error.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../all_file_import/app_utils_files_link.dart';
import '../model/coffee_card_model.dart';

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
  // Search field
  Widget searchTextfield() {
    return Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      width: MediaQuery.of(context).size.width,
      child: CommonTextFieldWithError(
        controllerT: searchTextFieldController,
        borderRadius: 12,
        inputHeight: 50,
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
        inputFieldPrefixIcon: Container(
          margin: EdgeInsets.all(15),
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

  // Coffee name list view
  Widget coffeNameWidget() {
    return Container(
      height: appDimens.heightFullScreen()/15,
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(
            left: 20,
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
              child: selectedCoffeeNameIndex == index
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "${coffeeNameList[index].title}",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFCB7642)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color(0xFFCB7642)),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "${coffeeNameList[index].title}",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade400),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.transparent),
                        ),
                      ],
                    ),
            );
          }),
    );
  }

  // Coffee list card view
  Widget coffeeCardListView() {
    return Container(
      height: appDimens.heightFullScreen()/2.22,

      child: GestureDetector(
        onTap: () {
          Navigator.push(
              MainAppBloc.getDashboardContext,
            SlideRightRoute(widget: CoffeeDetailCard()),
          );
        },
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: coffeeCardList.length,
          itemBuilder: (context, int index) {
            return Container(
              height: appDimens.heightFullScreen()/15,
              width: appDimens.widthFullScreen()/2.40,
              margin: EdgeInsets.only(left: 20,),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                /*boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.30),
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: Offset(0, 2),
                    ),
                  ]*/
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: CachedNetworkImage(
                        imageUrl: coffeeCardList[index].topIconUrl,
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 12),
                    child: Text(
                      coffeeCardList[index].title,
                      style: TextStyle(
                          color: appColors.textColor.withOpacity(0.80),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      coffeeCardList[index].subTitle,
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12.5,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: "\$",
                            style: TextStyle(
                                color: Color(0xFFCB7642),
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                          TextSpan(
                              text: coffeeCardList[index].price,
                              style: TextStyle(
                                  color: appColors.textColor.withOpacity(0.75),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15))
                        ])),
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFCB7642),
                              borderRadius: BorderRadius.circular(2)),
                          child: iconApps.iconImage(
                              imageUrl: iconApps.plusIcon,
                              iconSize: Size(20, 20)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // Special for you widget
  Widget specialForYouWiew() {
    return Container(
      height: 120,
      width: 320,
      margin: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        /*boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.30),
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(0, 2),
                  ),
                ]*/
      ),
      child: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: CachedNetworkImage(
                    // imageUrl: coffeeCardList[index].topIconUrl,
                    imageUrl:
                        "https://i.pinimg.com/236x/be/5e/0d/be5e0d63c8543a5d3ce502bf8fc9180c.jpg",
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "5 Coffee Beans You \n Must Try!",
                  style: TextStyle(
                      fontSize: 16,
                      color: appColors.textColor.withOpacity(0.80),
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);

    return ContainerFirst(
      contextCurrentView: context,
      appBackgroundColor: appColors.appBgColor1.withOpacity(0.15),
      isSingleChildScrollViewNeed: true,
      isFixedDeviceHeight: true,
      statusBarColor: appColors.appBgColor1.withOpacity(0.15),
      appBarHeight: 56,
      appBar: HomeAppBar(),
      containChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top title text
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30),
            child: Text(
              "Find the best \ncoffee for you",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          searchTextfield(),
          SizedBox(
            height: 25,
          ),
          coffeNameWidget(),
          SizedBox(
            height: 15,
          ),
          coffeeCardListView(),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Special for you",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: appColors.textColor.withOpacity(0.80)),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          specialForYouWiew(),
          Container(
            height: 50,
          ),
          Container(
            height: 50,
          ),
        ],
      ),
    );
  }
}
