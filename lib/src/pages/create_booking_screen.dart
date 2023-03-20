import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/model/create_booking_type_model.dart';
import 'package:base_flutter_app/src/model/filter_choice_chip_model.dart';
import 'package:base_flutter_app/src/pages/dashboard_screen.dart';
import 'package:base_flutter_app/src/pages/select_payment_screen.dart';
import 'package:base_flutter_app/src/widgets/common_choice_chip_widget.dart';
import 'package:base_flutter_app/src/widgets/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../widgets/appbar/common_app_bar.dart';
import '../widgets/custom_slider_widget.dart';

class CreateBookingScreen extends StatefulWidget {
  final String? detailImageUrl;
  final String? placeFlag;
  final String? placeName;
  final String? placeSubTitle;
  final String? bookingDate;
  const CreateBookingScreen({
    Key? key,
    this.detailImageUrl,
    this.placeFlag,
    this.placeName,
    this.placeSubTitle,
    this.bookingDate
  }) : super(key: key);

  @override
  State<CreateBookingScreen> createState() => _CreateBookingScreenState();
}

class _CreateBookingScreenState extends State<CreateBookingScreen> {

  bool isStartDateSelected = false;
  DateTime? newDate;

  @override
  void initState() {
    controllers['startDateController'] = TextEditingController();
    controllers['endDateController'] = TextEditingController();
    super.initState();
  }

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controllers['startDateController']?.dispose();
    controllers['endDateController']?.dispose();
  }
  int _value = 3;

  Map<String, TextEditingController> controllers = {
    'startDateController': new TextEditingController(),
    'endDateController': new TextEditingController(),
  };

  Map<String, FocusNode> focusNodes = {
    'startDateController': new FocusNode(),
    'endDateController': new FocusNode(),
  };

  Map<String, String> errorMessages = {
    'startDateController': "",
    'endDateController': "",
  };

  @override
  Widget build(BuildContext context) {

    // Date drop down view
      dateDropDown() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: 155,
              child: DatePickerWidget(
                controllerT: controllers['startDateController'],
                focusNode: focusNodes['startDateController'],
                errorMessages: errorMessages['startDateController']?.toString()??'',
                hintText: appString.trans(context, appString.startDateText),
                isStartDateSelected: true,
                selectedValue: (value) {
                  print("value $value");
                    if(controllers['startDateController']!.text != ""){
                      setState(() {
                        isStartDateSelected = true;
                        controllers['endDateController'] = controllers['startDateController']!;
                        // endDate = value;
                      });
                    } else{
                      setState(() {
                        isStartDateSelected = false;
                        controllers['startDateController']!.clear();
                        // endDate = value;
                      });
                    }

                  // print("value $startDate");
                },
              )),
          SizedBox(
            width: 10,
          ),
          Container(
              width: 155,
              child: DatePickerWidget(
                controllerT: controllers['endDateController'],
                focusNode: focusNodes['endDateController'],
                errorMessages: errorMessages['endDateController']?.toString()??'',
                hintText: appString.trans(context, appString.endDateText),
                isStartDateSelected: isStartDateSelected,
                selectedValue: (value) {
                if(controllers['endDateController']!.text == ""){
                  setState(() {
                  });
                } else{

                }
                print("value $value");

                  // print("value $endDate");
                },
              )),
        ],
      );
    }

      // Person range slider
      personRangSlider() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomSlider(
            inActiveTrackColor: appColors.textColor,
            activeTrackColor: appColors.buttonBgColor,
            trackHeight: 2.5,
            max: 25,
            min: 1,
            value: _value.toDouble(),
            divisions: 20,
            onValueChangeCallback: (value){
              setState(() {
                _value = value.round();
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("1 ${appString.trans(context, appString.personLabelText)}",
                  style:appStyles.commonSubTitleTextStyle(
                    fontSize: 11.5 ,
                    fontWeight: FontWeight.w500,
                    texColor:appColors.grey.withOpacity(0.80),
                  )
              ),
              Text("25 ${appString.trans(context, appString.personLabelText)}",
                  style:appStyles.commonSubTitleTextStyle(
                    fontSize: 11.5 ,
                    fontWeight: FontWeight.w500,
                    texColor:appColors.grey.withOpacity(0.80),
                  )
              )
            ],
          ),
        ],
      );
    }

      // Type view
      typeView(){
        return Wrap(
          spacing: 10.0,
          runSpacing: -5,
          children: <Widget>[
            ChoiceChipWidget(
              reportList: bookingTypeList,
              isAvatar: false,
            ),
          ],
        );
      }

      // Total text
      totalAmountView(){
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              appString.trans(context, appString.totalText),
              style: appStyles.commonSubTitleTextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "\$ 360.0",
              style: appStyles.commonSubTitleTextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600, texColor: appColors.white
              ),
            ),
          ],
        );
      }

    return ContainerFirst(
        appBarHeight: 56,
        isOverLayStatusBar: false,
        isOverLayAppBar: false,
        isSingleChildScrollViewNeed: true,
        isFixedDeviceHeight: false,
        contextCurrentView: context,
        appBar: CommonAppBar(
          isHideRightIcon: true,
        ),
        containChild: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(appString.trans(context, appString.createBookingTitleText),
                  textAlign: TextAlign.left,
                  style: appStyles.commonTitleStyle()),
              SizedBox(
                height: 35,
              ),
              Text(
                appString.trans(context, appString.dateTitleText),
                style: appStyles.commonSubTitleTextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    texColor: appColors.white),
              ),
              SizedBox(
                height: 10,
              ),
              dateDropDown(),
              SizedBox(
                height: 15,
              ),
              Text(
                appString.trans(context, appString.personText),
                style: appStyles.commonSubTitleTextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    texColor: appColors.white),
              ),
              SizedBox(
                height: 25,
              ),
              personRangSlider(),
              SizedBox(
                height: 30,
              ),
              Text(
                appString.trans(context, appString.typeText),
                style: appStyles.commonSubTitleTextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    texColor: appColors.white),
              ),
              SizedBox(
                height: 15,
              ),
              typeView(),
              SizedBox(height: 50,),
            ],
          ),
        ),
      bottomMenuView: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: appDimens.heightFullScreen()/6.5,
            width: appDimens.widthFullScreen(),
            color: appColors.appBgColorJungleGreen,
            padding: const EdgeInsets.only(bottom: 20,left: 20,right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                totalAmountView(),
                SizedBox(height: 20,),
                // Next button
                CommonButton(
                  buttonName: appString.trans(context, appString.nextSmall),
                  buttonHeight: 50,
                  buttonBorderRadius: 18,
                  isBottomMarginRequired: false,
                  textStyle: appStyles.buttonNameStyle(),
                  backCallback: () {
                    Navigator.push(
                      context,
                      SlideRightRoute(widget: SelectPaymentScreen(
                        detailImageUrl: widget.detailImageUrl,
                        placeName: widget.placeName,
                        placeFlag: widget.placeFlag,
                        placeSubTitle: widget.placeSubTitle,
                        bookingDate: widget.bookingDate,
                      )),
                    );
                  },
                ),
              ],
            ),
          )
      ),
    );
  }
}