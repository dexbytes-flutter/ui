import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/bottom_sheet_dynamic_height_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

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
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10).copyWith(left: 12,right: 12),
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: selectedIndex == index ? appColors.appBgColor1.withOpacity(0.15) : appColors.appTransColor,
                          border: Border.all(color:  selectedIndex == index
                              ? appColors.appTransColor
                              : appColors.appBgColor1.withOpacity(0.15),
                              width: selectedIndex == index
                                  ? 0
                                  :1.5)
                      ),
                      child: Text(searchResultViewOptionList[index],
                        style: appStyles.commonSubTitleTextStyle(
                            fontSize: 11.5, texColor: selectedIndex == index
                            ? appColors.buttonBgColor
                            :appColors.textColor
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
          child:
          Builder(
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
                            return "Please select country";
                          }
                          return null;
                        },
                        borderColor: appColors.appTransColor,
                        borderFocusColor: appColors.appTransColor,
                        hintColor: appColors.textColor,
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

    /*priceRangeSlider(){
      return Container(
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$${values.start.ceil()} - \$${values.end.ceil()}",
                        style:appStyles.commonSubTitleTextStyle(
                          fontSize: 15 ,
                          fontWeight: FontWeight.w600,
                          texColor:appColors.textNormalColor5,
                        )
                    )
                  ],
                ),
                const SizedBox(height: 45,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal:14),
                  child: SliderTheme(
                    data: SliderThemeData(
                      activeTickMarkColor: appColors.textNormalColor5,
                      activeTrackColor: appColors.textNormalColor5,
                      inactiveTickMarkColor: Colors.transparent,
                      thumbColor: appColors.textNormalColor5,
                      overlayShape: SliderComponentShape.noOverlay,
                      trackHeight: 4.5,
                      rangeThumbShape: const RoundRangeSliderThumbShape(enabledThumbRadius: 15),
                    ),
                    child: RangeSlider(
                      onChanged: (value){
                        setState(() {
                          values = value;
                          labels =  RangeLabels(values.start.toString(),values.end.toString());
                        });
                      },
                      values: values,
                      min: 10,
                      max: 200,
                      // labels:labels,
                      divisions: 10,

                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }*/

    // Price value slider
    Widget priceValueSlider(){
      return SfRangeSlider(
        min: 100,
        max: 1000.0,
        activeColor: appColors.buttonBgColor,
        inactiveColor: appColors.textColor,
        thumbShape: SfThumbShape(
        ),
        numberFormat: NumberFormat("\$"),
        values: _values,
        showTicks: false,
        showLabels: true,
        enableTooltip: true,
        onChanged: (SfRangeValues values){
          setState(() {
            _values = values;
          });
        },
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
            SizedBox(height: 35,),
            Text(appString.trans(context, appString.priceTitleText),
              style: appStyles.commonSubTitleTextStyle(fontSize: 15),
            ),
            SizedBox(height: 10,),
            priceValueSlider(),
            SizedBox(height: 35,),
            Text(appString.trans(context, appString.ratingTitleText),
              style: appStyles.commonSubTitleTextStyle(fontSize: 15),
            ),
            SizedBox(height: 35,),
            Text(appString.trans(context, appString.rangeTitleText),
              style: appStyles.commonSubTitleTextStyle(fontSize: 15),
            ),
            SizedBox(height: 35,),
            CommonButton(
              buttonName: appString.trans(context, appString.applyFilterButtonText),
              buttonHeight: 50,
              buttonBorderRadius: 18,
              isBottomMarginRequired: false,
              textStyle: appStyles.buttonNameStyle(),
              backCallback: (){
                Navigator.of(context).pop();
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
      bottomSheetMargin: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            filterScreenView()
          ],
        ),
      ),
    );
  }
}
