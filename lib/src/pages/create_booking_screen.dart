import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/model/create_booking_type_model.dart';
import 'package:base_flutter_app/src/model/filter_choice_chip_model.dart';
import 'package:base_flutter_app/src/pages/dashboard_screen.dart';
import 'package:base_flutter_app/src/widgets/common_choice_chip_widget.dart';
import 'package:base_flutter_app/src/widgets/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../widgets/appbar/common_app_bar.dart';
import '../widgets/custom_slider_widget.dart';

class CreateBookingScreen extends StatefulWidget {
  const CreateBookingScreen({Key? key}) : super(key: key);

  @override
  State<CreateBookingScreen> createState() => _CreateBookingScreenState();
}

class _CreateBookingScreenState extends State<CreateBookingScreen> {
  DateTime? startDateCheck;
  DateTime? endDateCheck;
  int _value = 3;

  @override
  Widget build(BuildContext context) {
      // Date drop down view
      dateDropDown() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: 160,
              child: DatePickerWidget(
                hintText: appString.trans(context, appString.startDateText),
                selectedValue: (value) {
                  print("value $value");
                  setState(() {
                    startDateCheck = value;
                  });
                  print("value $startDateCheck");
                },
              )),
          SizedBox(
            width: 10,
          ),
          Container(
              width: 160,
              child: DatePickerWidget(
                hintText: appString.trans(context, appString.endDateText),
                selectedValue: (value) {
                  print("value $value");
                  setState(() {
                    endDateCheck = value;
                  });
                  print("value $endDateCheck");
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
        return Padding(
          padding: const EdgeInsets.only(top: 95),
          child: Row(
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
                  fontSize: 18,
                  fontWeight: FontWeight.w500, texColor: appColors.white
                ),
              ),
            ],
          ),
        );
      }

      // Common button
      nextButton(){
        return CommonButton(
          buttonName: appString.trans(context, appString.loginText),
          buttonHeight: 50,
          buttonBorderRadius: 18,
          isBottomMarginRequired: false,
          textStyle: appStyles.buttonNameStyle(),
          backCallback: () {
            Navigator.push(
              context,
              SlideRightRoute(widget: DashBoardPage()),
            );
          },
        );
      }

    return ContainerFirst(
        appBarHeight: 56,
        isOverLayStatusBar: true,
        isOverLayAppBar: false,
        isSingleChildScrollViewNeed: true,
        isFixedDeviceHeight: false,
        contextCurrentView: context,
        appBar: CommonAppBar(
          isHideRightIcon: true,
        ),
        containChild: Padding(
          padding: const EdgeInsets.only(left: 20, top: 5, right: 20),
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
              totalAmountView(),
              // SizedBox(height: 20,),
              // nextButton()
            ],
          ),
        ),
      bottomMenuView: Align(
        alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20,left: 20,right: 20),
            child: nextButton(),
          )
      ),
    );
  }
}