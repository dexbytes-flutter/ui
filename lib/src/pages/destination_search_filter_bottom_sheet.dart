import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/filter_choice_chip_model.dart';
import 'package:base_flutter_app/src/pages/search_screen.dart';
import 'package:base_flutter_app/src/widgets/bottom_sheet_dynamic_height_card.dart';
import 'package:base_flutter_app/src/widgets/common_choice_chip_widget.dart';
import 'package:base_flutter_app/src/widgets/drop_down_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../all_file_import/app_providers_files_link.dart';
import '../all_file_import/app_utils_files_link.dart';
import '../widgets/drop_down_widget2.dart';

class DestinationSearchFilterBottomSheet extends StatefulWidget {
  const DestinationSearchFilterBottomSheet({Key? key}) : super(key: key);

  @override
  State<DestinationSearchFilterBottomSheet> createState() => _DestinationSearchFilterBottomSheetState();
}

class _DestinationSearchFilterBottomSheetState extends State<DestinationSearchFilterBottomSheet> {

  final List <String> searchResultViewOptionList = [
    "Vertical Card",
    "Horizontal Card"
  ];
  int selectedIndex = 0;
  bool isVerticalViewSearchResult = false;

  String selectedCountry = ""; // to display the selected country
  // Country list
  List<Map<String,dynamic>> countries = [
    {"id" : 1, "name" : "India"},
    {"id" : 2, "name" : "UAE"},
    {"id" : 3, "name" : "Indonesia"}
  ];
  List<Map<String,dynamic>> countryList = []; // to store the country list as a drop down list


  String selectedCity = ""; // to display the selected city on the basis of county
  List<Map<String,dynamic>> cityList = []; // to store the sorted city list according to country as a drop down list
  List<Map<String, dynamic>> cityNameList = []; // on selection of country, all cities will be added here dynamically

  RangeValues values = const RangeValues(150, 400);
  RangeLabels labels = const RangeLabels("100", "1000");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countryList = countries;
    cityNameList = [
      {"id": 1, "name" : "Delhi", "ParentId" : 1},
      {"id": 2, "name" : "Indore", "ParentId" : 1},
      {"id": 3, "name" : "Abu Dhabi", "ParentId" : 2},
      {"id": 4, "name" : "Dubai", "ParentId" : 2},
      {"id": 5, "name" : "Jakarta", "ParentId" : 3},
      {"id": 6, "name" : "Medan", "ParentId" : 3},
    ];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);

    DropdownMenuItem<String> buildMenuItem(Map map)
    => DropdownMenuItem(
        value: map["id"].toString(),
        child: Text(
          map["name"],
          style: appStyles.commonSubTitleTextStyle(fontSize: 11,fontWeight: FontWeight.w500),
        )
    );
    
    // Filter search result view option card
    Widget filterSearchResultViewOption(){
      return Builder(
        builder: (context) {
          return Container(
            height: 38,
            child: ListView.builder(
                itemCount: searchResultViewOptionList.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        this.selectedIndex = index;
                        if(selectedIndex ==1){
                          isVerticalViewSearchResult = true;
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10).copyWith(left: 15,right: 15),
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: selectedIndex == index ? appColors.appBgColor2 : appColors.appTransColor,
                          border: Border.all(color:  selectedIndex == index
                              ? appColors.appTransColor
                              : appColors.appBgColor2,
                              width: selectedIndex == index
                                  ? 0
                                  :1.5)
                      ),
                      child: Center(
                        child: Text(searchResultViewOptionList[index],
                          style: appStyles.commonTitleStyle(
                              fontSize: 11.5, texColor: selectedIndex == index
                              ? appColors.buttonBgColor
                              :appColors.textColor,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ),
                  );
                }
            ),
          );
        },
        
      );
    }
    // Location drop down
    /*Widget locationDropDownView(){
      return Container(
          child: Builder(
            builder: (BuildContext context) {
              return Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 38,
                    width: 135,
                    padding: EdgeInsets.only(left: 5,right: 5),
                    decoration: BoxDecoration(
                      color: appColors.grey.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: FormHelper.dropDownWidget(
                        context,
                        "Country",
                        this.countryId,
                        this.countryNameList,
                            (onChangedVal){
                          setState(() {
                            this.countryId = onChangedVal;
                            this.city = cityNameList.where(
                                    (cityItem) => cityItem["ParentId"].toString() == onChangedVal.toString()
                            ).toList();
                            this.cityId = null;
                          });
                        },
                            (onValidateVal){
                          if(onValidateVal == null){
                            // return "Please select country";
                          }
                          return null;
                        },
                        borderColor: appColors.appTransColor,
                        borderFocusColor: appColors.appTransColor,
                        hintColor: appColors.white,
                        textColor: appColors.textColor,
                        hintFontSize: 11.5,
                        borderRadius: 10,
                        borderWidth: 0,
                        paddingLeft: 15,
                        paddingRight: 15,
                        paddingTop: 5,
                        paddingBottom: 5
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 38,
                    width: 135,
                    padding: EdgeInsets.only(left: 5,right: 5),
                    decoration: BoxDecoration(
                        color: appColors.grey.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child:  FormHelper.dropDownWidget(
                        context,
                        "City",
                        this.cityId,
                        this.city,
                            (onChangedVal){
                          setState(() {
                            this.cityId = onChangedVal;
                          });
                        },
                            (onValidateVal){
                          return null;
                        },
                        borderColor: appColors.appTransColor,
                        borderFocusColor: appColors.appTransColor,
                        hintColor: appColors.textColor,
                        textColor: appColors.textColor,
                        hintFontSize: 11.5,
                        borderRadius: 10,
                        optionValue: "ID",
                        optionLabel: "Name",
                        paddingLeft: 0,
                        paddingRight: 0,
                        paddingTop: 5,
                        paddingBottom: 5
                    ),
                  )
                ],
              );
            },

          )

        *//*Column(
            children: [
              FormHelper.dropDownWidget(
                  context,
                  "Country",
                  this.countryId,
                  this.countryNameList,
                  (onChangedVal){
                    this.countryId = onChangedVal;
                    this.city = cityNameList.where(
                            (cityItem) => cityItem["ParentId"].toString() == onChangedVal.toString()
                    ).toList();
                    this.cityId = null;
                    },
                  (onValidateVal){
                    if(onValidateVal == null){
                      return "Please select country";
                    }
                    return null;
                  },
                borderColor: appColors.buttonBgColor,
                borderFocusColor: appColors.appThemeColor,
                borderRadius: 10,
                paddingLeft: 0,
                paddingRight: 60
              ),
              FormHelper.dropDownWidget(
                  context,
                  "City",
                  this.cityId,
                  this.city,
                  (onChangedVal){
                    this.cityId = onChangedVal;
                  },
                  (onValidateVal){
                  return null;
                  },
                borderColor: appColors.buttonBgColor,
                borderFocusColor: appColors.appThemeColor,
                borderRadius: 10,
                optionValue: "ID",
                optionLabel: "Name",
              )
            ]
        ),*//*
      );
    }*/
    // locationDropDownView()
    Widget category = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 35,
            margin: EdgeInsets.only(right: 10),
            child: CustomDropDownWidget(
              dropDownContainerDecorationColor: appColors.appBgColor2.withOpacity(0.45),
              dropDownContainerDecorationBorderColor: appColors.appTransColor,
                dropDownContainerDecorationBorderRadius: 12,
              dropDownHintText: Text(appString.trans(context, appString.countryDropDownHintText),
              style: appStyles.commonSubTitleTextStyle(fontSize: 11,fontWeight: FontWeight.w500),
              ),
              iconStyleData: IconStyleData(
                icon: Icon(Icons.keyboard_arrow_down),
                iconDisabledColor: appColors.grey,
                iconEnabledColor: appColors.white,
              ),
              dropdownStyleData: DropdownStyleData(
                  elevation: 0,
                  offset: Offset(0, -2),
                  decoration: BoxDecoration(
                      color: appColors.appBgColorJungleGreen,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      )
                  )
              ),
              selectedCountry: selectedCountry,
              itemList: countryList.map(buildMenuItem).toList(),
              onValueChangeCallBack: (value){
                setState(() {
                  selectedCountry = value!;
                  print(selectedCountry);
                  cityList = cityNameList.where(
                          (cityItem) => cityItem["ParentId"].toString() == value.toString()).toList();
                  selectedCity = "";
                });
              },
            ),
          ),
          Container(
            height: 35,
            child: CustomDropDownWidget(
              dropDownContainerDecorationColor: appColors.appBgColor2.withOpacity(0.45),
              dropDownContainerDecorationBorderColor: appColors.appTransColor,
              dropDownContainerDecorationBorderRadius: 12,
                iconStyleData: IconStyleData(
                  icon: Icon(Icons.keyboard_arrow_down),
                  iconDisabledColor: appColors.grey,
                  iconEnabledColor: appColors.white,
                ),
              dropdownStyleData: DropdownStyleData(
                  elevation: 0,
                  offset: Offset(0, -2),
                  decoration: BoxDecoration(
                      color: appColors.appBgColorJungleGreen,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      )
                  )
              ),
              dropDownHintText: Text(appString.trans(context, appString.cityDropDownHintText),
                style: appStyles.commonSubTitleTextStyle(fontSize: 11,fontWeight: FontWeight.w500),
              ),
              selectedCountry: selectedCity,
              itemList: cityList.map(buildMenuItem).toList(),
              onValueChangeCallBack: (value){
                setState(() {
                  selectedCity = value!;
                });
              },
            ),
          ),
        ],
      ),
    );

    // Price range slider
    priceRangeSlider(){
      return Container(
        child: Builder(
          builder: (context) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: SliderTheme(
                    data: SliderThemeData(
                      activeTrackColor: appColors.buttonBgColor,
                      inactiveTrackColor: appColors.textColor.withOpacity(0.40),
                      thumbColor: appColors.buttonBgColor,
                      activeTickMarkColor: appColors.appTransColor,
                      inactiveTickMarkColor: appColors.appBgColor1,
                      overlayShape: SliderComponentShape.noOverlay,
                      trackHeight: 3,
                      trackShape: RoundedRectSliderTrackShape(),
                      rangeThumbShape: const RoundRangeSliderThumbShape(enabledThumbRadius: 8),
                    ),
                    child: RangeSlider(
                      onChanged: (value){
                        setState(() {
                          values = value;
                          labels =  RangeLabels(
                            "\$${values.start.round()}".toString(),
                            "\$${values.end.round()}".toString(),
                          );
                        });
                      },
                      values: values,
                      min: 100,
                      max: 1000,
                      labels: labels,
                      divisions: 5,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$100",
                        style:appStyles.commonSubTitleTextStyle(
                          fontSize: 11.5 ,
                          fontWeight: FontWeight.w500,
                          texColor:appColors.textColor.withOpacity(0.30),
                        )
                    ),
                    Text("\$1000",
                        style:appStyles.commonSubTitleTextStyle(
                          fontSize: 11.5 ,
                          fontWeight: FontWeight.w500,
                          texColor:appColors.textColor.withOpacity(0.30),
                        )
                    )
                  ],
                ),
              ],
            );
          }
        ),
      );
    }

    // Rating choice chip
    Widget ratingView(){
      return Wrap(
        spacing: 10.0,
        runSpacing: -5,
        children: <Widget>[
          ChoiceChipWidget(
            reportList: ratingChoiceChipDataList,
            isAvatar: true,
          ),
        ],
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

    // Range choice chip
    Widget rangeView(){
      return Wrap(
        spacing: 10.0,
        runSpacing: -5,
        children: <Widget>[
          ChoiceChipWidget(
            reportList: rangeChoiceChipDataList,
            isAvatar: false,
          ),
        ],
      );
    }

    Widget filterScreenView(){
      return Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(appString.trans(context, appString.viewTitleText),
              style: appStyles.commonSubTitleTextStyle(fontSize: 15),
            ),
            SizedBox(height: 10,),
            filterSearchResultViewOption(),
            SizedBox(height: 25,),
            Text(appString.trans(context, appString.locationTitleText),
              style: appStyles.commonSubTitleTextStyle(fontSize: 15),
            ),
            SizedBox(height: 10,),
            // locationDropDownView(),
            category,
            SizedBox(height: 25,),
            Text(appString.trans(context, appString.priceTitleText),
              style: appStyles.commonSubTitleTextStyle(fontSize: 15),
            ),
            SizedBox(height: 10,),
            priceRangeSlider(),
            SizedBox(height: 25,),
            Text(appString.trans(context, appString.ratingTitleText),
              style: appStyles.commonSubTitleTextStyle(fontSize: 15),
            ),
            SizedBox(height: 10,),
            ratingView(),
            SizedBox(height: 25,),
            Text(appString.trans(context, appString.rangeTitleText),
              style: appStyles.commonSubTitleTextStyle(fontSize: 15),
            ),
            SizedBox(height: 10,),
            rangeView(),
            SizedBox(height: 25,),
            CommonButton(
              buttonName: appString.trans(context, appString.applyFilterButtonText),
              buttonHeight: 50,
              buttonBorderRadius: 18,
              isBottomMarginRequired: false,
              textStyle: appStyles.buttonNameStyle(),
              backCallback: (){
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  SlideRightRoute(widget: SearchScreen(
                    isFilterApplied: true,
                    isVerticalViewSearchResult: isVerticalViewSearchResult,
                  )
                  ),
                );
              },
            ),
            SizedBox(height: 20,)
          ],
        ),
      );
    }

    return BottomSheetDynamicHeightCardView(
      cardBackgroundColor: appColors.appBgColorJungleGreen,
      topLineShow: true,
      sheetTitlePadding: EdgeInsets.only(left: 20.0,right: 20,top: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          filterScreenView()
        ],
      ),
    );
  }
}
