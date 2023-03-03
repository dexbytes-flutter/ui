import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/filter_choice_chip_model.dart';
import 'package:base_flutter_app/src/pages/search_screen.dart';
import 'package:base_flutter_app/src/widgets/bottom_sheet_dynamic_height_card.dart';
import 'package:base_flutter_app/src/widgets/common_choice_chip_widget.dart';
import 'package:base_flutter_app/src/widgets/drop_down_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../all_file_import/app_providers_files_link.dart';
import '../all_file_import/app_utils_files_link.dart';

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

  List<dynamic> countryNameList = [];
  List<dynamic> cityNameList = [];
  List<dynamic> city = [];

  String? countryId;
  String? cityId;

  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String address = "";
  SfRangeValues _values = SfRangeValues(150, 400);

  RangeValues values = const RangeValues(150, 400);
  RangeLabels labels = const RangeLabels("100", "1000");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.countryNameList.add({"id":1,"name" : "India", });
    this.countryNameList.add({"id":2,"name" : "UAE", });

    this.cityNameList = [
      {"ID": 1, "Name" : "Delhi", "ParentId" : 1},
      {"ID": 2, "Name" : "Indore", "ParentId" : 1},
      {"ID": 1, "Name" : "Abu Dhabi", "ParentId" : 2},
      {"ID": 2, "Name" : "Dubai", "ParentId" : 2},
    ];
  }
  final items = ["Entertainment","Educational",];
  DropdownMenuItem<String> buildMenuItem(String item)  {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return DropdownMenuItem(
        value:item,
        child: Text(
          item,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: !isDarkMode?  Colors.black:Colors.white,
          ),
        )
    );}

  @override
  Widget build(BuildContext context) {

    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);
    
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
                          color: selectedIndex == index ? appColors.appContainerBgColor.withOpacity(0.12) : appColors.appTransColor,
                          border: Border.all(color:  selectedIndex == index
                              ? appColors.appTransColor
                              : appColors.appContainerBgColor.withOpacity(0.12),
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
    Widget locationDropDownView(){
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
                        paddingLeft: 0,
                        paddingRight: 0,
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

        /*Column(
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
        ),*/
      );
    }

    Widget category = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DropDownPicker(
            hint: appString.trans(context, appString.countryDropDownHintText) ,
            itemList: items.map(buildMenuItem).toList(),
          ),
          DropDownPicker(
            hint: appString.trans(context, appString.cityDropDownHintText) ,
            itemList: items.map(buildMenuItem).toList(),
          )
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
                      divisions: 10,
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
            locationDropDownView(),
            // category,
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
      topLineShow: false,
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
