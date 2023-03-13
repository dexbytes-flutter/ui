import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/widgets/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../widgets/appbar/common_app_bar.dart';

class CreateBookingScreen extends StatefulWidget {
  const CreateBookingScreen({Key? key}) : super(key: key);

  @override
  State<CreateBookingScreen> createState() => _CreateBookingScreenState();
}

class _CreateBookingScreenState extends State<CreateBookingScreen> {
  DateTime? startDateCheck;
  DateTime? endDateCheck;
  int _value = 6;

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
        children: [
          /*Slider(
              value: _value.toDouble(),
              min: 1.0,
              max: 25.0,
              divisions: 10,
              activeColor: appColors.buttonBgColor,
              inactiveColor: appColors.textColor,
              label: "$_value ${appString.trans(context, appString.personText)}",
              onChanged: (double newValue) {
                setState(() {
                  _value = newValue.round();
                });
              },
              semanticFormatterCallback: (double newValue) {
                return '${newValue.round()} dollars';
              }),*/

          SfSlider(
            min: 1,
            max: 25.0,
            value: _value,
            interval: 10,
            showTicks: false,
            enableTooltip: true,
            activeColor: appColors.buttonBgColor,
            inactiveColor: appColors.textColor,
            onChanged: (newValue){
              setState(() {
                _value = newValue.round();
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("1 person",
                  style:appStyles.commonSubTitleTextStyle(
                    fontSize: 11.5 ,
                    fontWeight: FontWeight.w500,
                    texColor:appColors.grey.withOpacity(0.80),
                  )
              ),
              Text("25 person",
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
                height: 10,
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
              SizedBox(
                height: 30,
              ),
              Text(
                appString.trans(context, appString.totalText),
                style: appStyles.commonSubTitleTextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ));
  }
}
