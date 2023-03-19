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
  final FocusNode? focusNode;
  final String? errorMessages;
  final TextEditingController? controllerT;
  final bool? isStartDateSelected;
  final Color? datePickerFieldIconColor;

  const DatePickerWidget({
    Key? key, this.isShowMonthName = false,
    this.errorHeight = 20,
    this.child,
    this.hintText,
    this.selectedValue,
    this.focusNode,
    this.controllerT,
    this.errorMessages,
    this.isStartDateSelected,
    this.datePickerFieldIconColor
  }) : super(key: key);


  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime date = DateTime.now();

  String getText() {
    // ignore: unnecessary_null_comparison
    if (date == null) {
      return 'Select start date';
    } else {
      return widget.isShowMonthName
          ? DateFormat('dd MMMM, yyyy').format(date)
          : DateFormat('dd/MM/yyyy').format(date);
      // return DateFormat('dd/MMM/yyyy').format(date);
      // return '${date.day}/${date.month}/${date.year}';
    }
  }



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
                      primary: appColors.appBgColorJungleGreen,
                      onSurface: appColors.black,
                      onPrimary: appColors.white,
                      surface: appColors.appBgColorJungleGreen,
                      brightness: Brightness.light
                  ),
                  dialogBackgroundColor: appColors.white
              )
          );
        }
    );

     if (newDate == null){
       /*setState(() {
         date = newDate!;
         widget.controllerT!.text = getText().toString();
         widget.selectedValue!.call(date);
       });*/
       return widget.controllerT!.clear();
     } else{
       setState(() {
         date = newDate;
         widget.controllerT!.text = getText().toString();
         widget.selectedValue!.call(date);
       });
     }

   /* if (newDate == null) return controllers['dateTextFieldController']?.clear();
    setState(() {
      date = newDate;
      controllers['dateTextFieldController']?.text = getText().toString();
      widget.selectedValue!.call(date);
    });*/
    // setState(() => date = newDate
    // );
  }

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: ()
      {
        if(widget.isStartDateSelected!) pickDate(context);
        // print(controllers['dateTextFieldController']?.text);

      },
      child: CommonTextFieldWithError(
        focusNode: widget.focusNode!,
        isShowBottomErrorMsg: true,
        errorMessages: widget.errorMessages ?? '',
        controllerT: widget.controllerT,
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
        hintStyle: appStyles.commonTitleStyle(fontSize: 14,texColor: appColors.textColor,fontWeight: FontWeight.w400),
        textStyle: appStyles.commonTitleStyle(fontWeight: FontWeight.w500,fontSize: 14,
            texColor: appColors.white ),
        contentPadding: EdgeInsets.only(left: 20),
        inputFieldSuffixIcon: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_down,
                color: widget.isStartDateSelected!? appColors.white : appColors.iconColorGrey,
          ),
          // icon: Icon(CupertinoIcons.calendar_today),
          onPressed: (){},
        ),
        onTextChange: (value) {

          // _checkName(value, 'address', onchange: true);
        },
        onEndEditing: (value) {
          // _checkName(value, 'dateTextFieldController');
        },
      ),
    );
  }
}