import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../widgets/appbar/home_screen_app_bar.dart';

class DestinationFilterScreen extends StatefulWidget {
  const DestinationFilterScreen({Key? key}) : super(key: key);

  @override
  State<DestinationFilterScreen> createState() => _DestinationFilterScreenState();
}

class _DestinationFilterScreenState extends State<DestinationFilterScreen> {

  Map<String, TextEditingController> controllers = {
    'search': new TextEditingController(),
  };

  Map<String, FocusNode> focusNodes = {
    'search': new FocusNode(),
  };

  Map<String, String> errorMessages = {
    'search': "",
  };

  final List <String> searchResultViewOptionList = [
    "Vertical Card",
    "Horizontal Card"
  ];

  List<dynamic> countryNameList = [];
  List<dynamic> cityNameList = [];
  List<dynamic> city = [];

  String? countryId;
  String? cityId;

  int selectedIndex = 0;
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String address = "";
  SfRangeValues _values = SfRangeValues(40.0, 80.0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.countryNameList.add({"id":1,"name" : "India", });
    this.countryNameList.add({"id":2,"name" : "UAE", });

    this.cityNameList = [
      {"ID": 1, "Name" : "Delhi", "ParentId" : 1},
      {"ID": 2, "Name" : "Indore", "ParentId" : 1},
      {"ID": 3, "Name" : "Mumbai", "ParentId" : 1},
      {"ID": 4, "Name" : "Bhopal", "ParentId" : 1},
      {"ID": 5, "Name" : "Gwalior", "ParentId" : 1},
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
    }

    // Location drop down
    Widget locationDropDownView(){
      return Container(
        padding: EdgeInsets.only(right: 80),
        height: 100,
        child: Column(
            children: [
              FormHelper.dropDownWidget(
                  context,
                  "Country",
                  this.countryId,
                  this.countryNameList,
                  (onChangedVal){
                    this.countryId = onChangedVal;
                    this.city = cityNameList.where(
                            (cityItem) => cityItem["ParentId"].toString() == onChangedVal.toString()).toList();
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
              ),
              FormHelper.dropDownWidget(
                  context,
                  "City",
                  this.cityId,
                  this.cityNameList,
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
                optionLabel: "Name"
              )
            ]
        ),
      );
    }

    // Price value slider
    Widget priceValueSlider(){
      return SfRangeSlider(
        min: 0.0,
        max: 100.0,
        values: _values,
        interval: 20,
        showTicks: false,
        showLabels: true,
        enableTooltip: true,
        minorTicksPerInterval: 1,
        onChanged: (SfRangeValues values){
          setState(() {
            _values = values;
          });
        },
      );
    }

    // Filter pop up dialog
    filterPopUpDialog() {
      return showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) {
            return SimpleDialog(
              backgroundColor: appColors.appBgColorJungleGreen,
              insetPadding: EdgeInsets.all(20),
              contentPadding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              children: [
                    Container(
                      height: appDimens.heightFullScreen() - 425,
                      width: appDimens.widthFullScreen() - 20,
                      child: SingleChildScrollView(
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
                            SizedBox(height: 35,),
                            Text(appString.trans(context, appString.locationTitleText),
                              style: appStyles.commonSubTitleTextStyle(fontSize: 15),
                            ),
                            SizedBox(height: 10,),
                            locationDropDownView(),
                            SizedBox(height: 10,),
                            priceValueSlider(),
                            SizedBox(height: 35,),
                            Text(appString.trans(context, appString.priceTitleText),
                              style: appStyles.commonSubTitleTextStyle(fontSize: 15),
                            ),
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
                          ],
                        ),
                      ),
                    )
              ],
            );
          });
    }
    
      // Top search field
      Widget topSearchField() {
        return Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
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
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: appColors.buttonBgColor),
                child: iconApps.iconImage(
                    imageUrl: iconApps.searchIcon,
                    imageColor: appColors.black,
                    iconSize: Size(20, 20)),
              )
            ],
          ),
        );
      }

      // Search result title text with filter button
      Widget titleWithFilterOption(){
        return Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(appString.trans(context, appString.foundText),
                    style: appStyles.commonSubTitleTextStyle(fontWeight: FontWeight.w600,
                    fontSize: 15),
                  ),
                  SizedBox(width: 3,),
                  Text("90+",
                    style: appStyles.commonSubTitleTextStyle(fontWeight: FontWeight.w600,
                    fontSize: 15),
                  ),
                  SizedBox(width: 3,),
                  Text(appString.trans(context, appString.destinationText),
                    style: appStyles.commonSubTitleTextStyle(fontWeight: FontWeight.w600,
                    fontSize: 15),
                  ),
                ],
              ),
              GestureDetector(
                onTap: (){
                  filterPopUpDialog();
                },
                child: Container(
                  padding: EdgeInsets.all(8).copyWith(left: 15,right: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: appColors.buttonBgColor),
                  child: iconApps.iconImage(
                      imageUrl: iconApps.filterIcon,
                      imageColor: appColors.black,
                      iconSize: Size(20, 20)),
                ),
              )
            ],
          ),
        );
      }

      return ContainerFirst(
          appBarHeight: 56,
          isOverLayStatusBar: false,
          isSingleChildScrollViewNeed: false,
          contextCurrentView: context,
          appBar: HomeScreenAppBar(
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
          ),
          containChild: Column(
            children: [
              topSearchField(),
              titleWithFilterOption()
            ],
          )
      );
    }
}
