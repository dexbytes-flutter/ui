import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../all_file_import/app_values_files_link.dart';

class DropDownPicker extends StatefulWidget {

  final List<DropdownMenuItem<String>> itemList;
  final String? hint;
  final Function? selectedValue;
  const DropDownPicker({Key? key,
    required this.itemList,this.selectedValue,
    this.hint
  }) : super(key: key);

  @override
  _DropDownPickerState createState() => _DropDownPickerState(countryList: this.itemList);
}

class _DropDownPickerState extends State<DropDownPicker> {
  String? valueChoose;
  List<DropdownMenuItem<String>>? countryList;

  _DropDownPickerState({this.countryList});

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;


    return Container(
      height: 35,
      width: 154,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: appColors.appContainerBgColor.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.zero,
        child: DropdownButton<String> (
            icon: Container(
              margin: EdgeInsets.only(right: 8),
              child: SizedBox(
                  child: Center(
                      child: iconApps.iconImage(
                          imageUrl: iconApps.dropDownDownArrow,
                          iconSize: Size(20, 20),
                          imageColor: appColors.textColor
                      )
                  )
              ),
            ),
            iconEnabledColor:Colors.grey ,
            elevation: 0,
            isExpanded: true,
            underline:Container(
              height: 0.0,
              decoration: BoxDecoration(
                border: Border.all(width:0.01,color: appColors.appContainerBgColor.withOpacity(0.12))
              ),
            ),
            dropdownColor:  appColors.textFiledColor4,
            alignment: Alignment.centerLeft,
            borderRadius: BorderRadius.circular(10),
            hint: Padding(
              padding: const EdgeInsets.all(8.0).copyWith(left: 15),
              child: Text( widget.hint ??"Select Date",style:
              appStyles.commonTitleStyle(fontSize: 11.5,texColor: appColors.textColor,
                  fontWeight: FontWeight.w400
              ),),
            ),
            isDense: false,
            value: valueChoose,
            items: countryList,
            onChanged: (value) => setState(() {
              this.valueChoose = value;
              widget.selectedValue?.call(value);
            })
        ),
      ),
    );
  }
  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
        value:item,
        child: Text(
          item,
          style: appStyles.commonTitleStyle(fontWeight: FontWeight.w500,
            fontSize: 11.5, texColor: appColors.textColor
          ),
        )
    );}
}