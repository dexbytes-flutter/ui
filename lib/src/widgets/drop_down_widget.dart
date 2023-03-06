import 'package:flutter/material.dart';

import '../all_file_import/app_values_files_link.dart';



//for Restaurant type dropdown
class DropDownDataPicker extends StatefulWidget {
  final List<DropdownMenuItem<String>> itemList;
  final String? hint;
  final Function? selectedValue;
  late String? countryId;
  final String? cityId;
  final String? choosenValue;
  final Function(String?)? onChangedValue;

  DropDownDataPicker({Key? key,
    required this.itemList,
    this.hint,
    this.selectedValue,
    this.cityId,
    this.countryId,
    this.choosenValue,
    this.onChangedValue
  }) : super(key: key);

  @override
  _DropDownDataPickerState createState() => _DropDownDataPickerState(itemTypeList: this.itemList);
}

class _DropDownDataPickerState extends State<DropDownDataPicker> {

  // String? valueChoose;
  
  List<DropdownMenuItem<String>>? itemTypeList;

  _DropDownDataPickerState({this.itemTypeList});

  @override
  Widget build(BuildContext context) {


    return Container(
      height: 40,
      padding: const EdgeInsets.only(right: 6),
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
          color: appColors.appBgColor2,
          borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 12),
        child: DropdownButtonHideUnderline(
          child: ButtonTheme(
            // alignedDropdown: true,
            child: DropdownButton<String> (
                alignment: AlignmentDirectional.centerStart,
                iconEnabledColor:Colors.grey.shade500,
                icon: const Icon(Icons.keyboard_arrow_down),
                iconSize: 28,
                elevation: 1,
                isExpanded: true,
                dropdownColor: appColors.appBgColor2,
                // dropdownColor: !isDarkMode? Colors.grey.shade300 : Color(0xff212327),
                // alignment: Alignment.bottomCenter,
                borderRadius: BorderRadius.circular(10),
                hint: Text( widget.hint ??"",style: appStyles.commonTitleStyle(fontSize: 14,
                    texColor: appColors.textColor, fontWeight: FontWeight.w500)
                ),
                isDense: false,
                value: widget.choosenValue,
                items: itemTypeList,
                onChanged: widget.onChangedValue
            ),
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) {

    return DropdownMenuItem(
        value:item,
        child: Text(
            item,
            style: appStyles.commonTitleStyle(texColor: appColors.textColor,
                fontSize: 14, fontWeight: FontWeight.w500
            )
        )
    );}

}
