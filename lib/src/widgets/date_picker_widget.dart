import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class DatePickerWidget extends StatefulWidget {
  final double errorHeight;
  final bool isShowMonthName;
  final String? hintText;
  final Widget? child;
  final Function? selectedValue;

  const DatePickerWidget({Key? key, this.isShowMonthName = false, this.errorHeight = 20, this.child, this.hintText, this.selectedValue}) : super(key: key);
  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime date = DateTime.now();

  String getText() {
    // ignore: unnecessary_null_comparison
    if (date == null) {
      return 'Select Date of Birth';
    } else {
      return widget.isShowMonthName
          ? DateFormat('dd MMMM, yyyy').format(date)
          : DateFormat('dd/MM/yyyy').format(date);
      // return DateFormat('dd/MMM/yyyy').format(date);
      // return '${date.day}/${date.month}/${date.year}';
    }
  }

  Map<String, TextEditingController> controllers = {
    'dateOfBirth': new TextEditingController(),
  };

  Map<String, FocusNode> focusNodes = {

    'dateOfBirth': new FocusNode(),
  };

  Map<String, String> errorMessages = {

    'dateOfBirth': "",
  };


  void pickDate(BuildContext context) async {

    final newDate = await showDatePicker(
        context: context,
        fieldLabelText: "DOB",
        // initialDate: DateTime(DateTime.now().year),
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        initialDatePickerMode: DatePickerMode.year,
        // firstDate: DateTime(DateTime.now().year),
        // lastDate: DateTime(DateTime.now().year + 50),
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 0)),
        lastDate: DateTime(DateTime.now().year + 50),
        confirmText: appString.trans(context, appString.okButtonText),
        cancelText: appString.trans(context, appString.cancelText),
        builder: (context ,child ) {
          return Theme(
              child: child!,
              data: ThemeData().copyWith(
                  colorScheme: ColorScheme.dark(
                      primary: appColors.buttonColor2,
                      onSurface: appColors.black,
                      onPrimary: appColors.white,
                      surface: appColors.buttonColor2,
                      brightness: Brightness.light
                  ),
                  dialogBackgroundColor: appColors.white
              )
          );
        }
    );

    if (newDate == null) return controllers['dateOfBirth']?.clear();
    setState(() {
      date = newDate;
      controllers['dateOfBirth']?.text = getText().toString();
      widget.selectedValue!.call(date);
    });
    // setState(() => date = newDate
    // );
  }

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: ()
      {
        pickDate(context);
        print(controllers['dateOfBirth']?.text);

      },
      child: CommonTextFieldWithError(
        focusNode: focusNodes['dateOfBirth'],
        isShowBottomErrorMsg: true,
        errorMessages: errorMessages['dateOfBirth']?.toString()??'',
        controllerT: controllers['dateOfBirth'],
        borderRadius: 12,
        inputHeight: 35,
        autoFocus: true,
        errorMsgHeight: widget.errorHeight,
        errorLeftRightMargin: 0,
        isTextFieldEnabled: false,
        capitalization: CapitalizationText.sentences,
        enabledBorderColor:  appColors.appBgColorJungleGreen,
        focusedBorderColor:  appColors.appBgColorJungleGreen,
        cursorColor: Colors.grey,
        borderStyle: BorderStyle.none,
        backgroundColor: appColors.appBgColor2.withOpacity(0.50),
        inputKeyboardType: InputKeyboardTypeWithError.text,
        textInputAction: TextInputAction.next,
        hintText: widget.hintText?? appString.trans(context, appString.dateTitleText),
        hintStyle: appStyles.commonTitleStyle(fontSize: 12,texColor: appColors.textColor,fontWeight: FontWeight.w400),
        textStyle: appStyles.commonTitleStyle(fontWeight: FontWeight.w500,fontSize: 12,
            texColor: appColors.white ),
        contentPadding: EdgeInsets.only(left: 20,right: 20),
        inputFieldSuffixIcon: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_down,
                color: appColors.white,
          ),
          // icon: Icon(CupertinoIcons.calendar_today),
          onPressed: (){},
        ),
        onTextChange: (value) {
          // _checkName(value, 'address', onchange: true);
        },
        onEndEditing: (value) {
          // _checkName(value, 'dateOfBirth');
          FocusScope.of(context).requestFocus(focusNodes['dateOfBirth']);
        },
      ),
    );
  }
}