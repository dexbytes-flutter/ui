import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/create_booking_type_model.dart';
import 'package:base_flutter_app/src/model/filter_choice_chip_model.dart';
import 'package:base_flutter_app/src/pages/dashboard_screen.dart';
import 'package:base_flutter_app/src/pages/select_payment_screen.dart';
import 'package:base_flutter_app/src/widgets/common_choice_chip_widget.dart';
import 'package:base_flutter_app/src/widgets/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../widgets/appbar/common_app_bar.dart';
import '../widgets/custom_slider_widget.dart';

class CreateBookingScreen extends StatefulWidget {
  final String? detailImageUrl;
  final String? placeFlag;
  final String? placeName;
  final String? placeSubTitle;
  final String? bookingDate;
  const CreateBookingScreen(
      {Key? key,
      this.detailImageUrl,
      this.placeFlag,
      this.placeName,
      this.placeSubTitle,
      this.bookingDate})
      : super(key: key);

  @override
  State<CreateBookingScreen> createState() => _CreateBookingScreenState();
}

class _CreateBookingScreenState extends State<CreateBookingScreen> {

  bool isStartDateSelected = false;
  late TextEditingController startDate;
  late TextEditingController endDate;
  DateTime? endPickedDate;
  DateTime? startPickedDate;
  @override
  void initState() {
    startDate = TextEditingController();
    endDate = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  int _value = 3;

  @override
  Widget build(BuildContext context) {
    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);

    // Date drop down view
    dateDropDown() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: appDimens.widthFullScreen() / 2.31,
            height: 35,
            decoration: BoxDecoration(
                color: appColors.appBgColor2.withOpacity(0.50),
                borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              controller: startDate,
              style: appStyles.commonTitleStyle(fontWeight: FontWeight.w500,fontSize: 14,
                  texColor: appColors.white ),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(2).copyWith(left: 15,),
                  border: InputBorder.none,
                  hintText: appString.trans(context, appString.startDateText),
                  hintStyle: appStyles.commonTitleStyle(fontSize: 14,texColor: appColors.textColor,fontWeight: FontWeight.w400),
                  suffixIcon: Icon(
                    Icons.keyboard_arrow_down,
                    size: 25,
                    color: appColors.white,
                  )),
              readOnly: true,
              validator: (startDate) {
                if (startDate == null || startDate.isEmpty) {
                  return "Please Input Start Date";
                } else
                  return null;
              },
              onTap: () async {
                startPickedDate = await showDatePicker(
                    builder: (context ,child ) {
                      return Theme(
                          child: child!,
                          data: ThemeData().copyWith(
                              colorScheme: ColorScheme.dark(
                                  primary: appColors.appBgColorJungleGreen,
                                  onSurface: appColors.black,
                                  onPrimary: appColors.white,
                                  surface: appColors.appBgColorJungleGreen,
                                  brightness: Brightness.light
                              ),
                              dialogBackgroundColor: appColors.white
                          )
                      );
                    },
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100));
                if (startPickedDate != null) {
                  String formattedDate =
                      DateFormat('dd-MM-yyyy').format(startPickedDate!);
                  setState(() {
                    startDate.text = formattedDate; //set output date to TextField value.
                    endDate.text = formattedDate;
                  });
                }
              },
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: appDimens.widthFullScreen() / 2.31,
            height: 35,
            decoration: BoxDecoration(
                color: appColors.appBgColor2.withOpacity(0.50),
                borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              style: appStyles.commonTitleStyle(fontWeight: FontWeight.w500,fontSize: 14,
                  texColor: appColors.white ),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(2).copyWith(left: 15,),
                  border: InputBorder.none,
                  hintText: appString.trans(context, appString.endDateText),
                  hintStyle: appStyles.commonTitleStyle(fontSize: 14,texColor: appColors.textColor,fontWeight: FontWeight.w400),
                  suffixIcon: Icon(
                    Icons.keyboard_arrow_down,
                    size: 25,
                    color: startPickedDate == null? appColors.iconColorGrey : appColors.white,
                  )),
              controller: endDate,
              readOnly: true,
              validator: (endDate) {
                if (endDate == null || endDate.isEmpty) {
                  return "Please Input End Date";
                } else {
                  return null;
                }
              },
              onTap: () async {
                if (startDate.text.isNotEmpty) {
                  String dateTime = startDate.text;
                  DateFormat inputFormat = DateFormat('dd-MM-yyyy');
                  DateTime input = inputFormat.parse(dateTime);

                  endPickedDate = await showDatePicker(
                    builder: (context ,child ) {
                      return Theme(
                          child: child!,
                          data: ThemeData().copyWith(
                              colorScheme: ColorScheme.dark(
                                  primary: appColors.appBgColorJungleGreen,
                                  onSurface: appColors.black,
                                  onPrimary: appColors.white,
                                  surface: appColors.appBgColorJungleGreen,
                                  brightness: Brightness.light
                              ),
                              dialogBackgroundColor: appColors.white
                          )
                      );
                    },
                    context: context,
                    initialDate: input.add(const Duration(days: 1)),
                    firstDate: input.add(const Duration(days: 1)),
                    lastDate: DateTime(2100),
                  );
                  if (endPickedDate != null) {
                    String formattedDate =
                        DateFormat('dd-MM-yyyy').format(endPickedDate!);
                    setState(() {
                      endDate.text = formattedDate;
                    });
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('You need to select Start Date')));
                }
              },
            ),
          ),
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
            onValueChangeCallback: (value) {
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
                  style: appStyles.commonSubTitleTextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w500,
                    texColor: appColors.grey.withOpacity(0.80),
                  )),
              Text("25 ${appString.trans(context, appString.personLabelText)}",
                  style: appStyles.commonSubTitleTextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w500,
                    texColor: appColors.grey.withOpacity(0.80),
                  ))
            ],
          ),
        ],
      );
    }

    // Type view
    typeView() {
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
    totalAmountView() {
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
                fontWeight: FontWeight.w600,
                texColor: appColors.white),
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
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(appString.trans(context, appString.createBookingTitleText),
                textAlign: TextAlign.left, style: appStyles.commonTitleStyle()),
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
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
      bottomMenuView: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: appDimens.heightFullScreen() / 5,
            width: appDimens.widthFullScreen(),
            color: appColors.appBgColorJungleGreen,
            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                totalAmountView(),
                SizedBox(
                  height: 20,
                ),
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
                      SlideRightRoute(
                          widget: SelectPaymentScreen(
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
          )),
    );
  }
}
