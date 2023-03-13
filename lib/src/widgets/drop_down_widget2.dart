import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../all_file_import/app_values_files_link.dart';

class CustomDropDownWidget extends StatefulWidget {

  final String selectedCountry;
  final List<DropdownMenuItem<String>>? itemList;
  final double dropDownHeight;
  final double dropDownWidth;
  final EdgeInsetsGeometry? dropDownMargin;
  final Color? dropDownContainerDecorationColor;
  final Color? dropDownContainerDecorationBorderColor;
  final double? dropDownContainerDecorationBorderWidth;
  final double? dropDownContainerDecorationBorderRadius;
  final bool? isExpand;
  final bool? isDense;
  final ButtonStyleData? buttonStyleData;
  final DropdownStyleData? dropdownStyleData;
  final MenuItemStyleData? menuItemStyleData;
  final IconStyleData? iconStyleData;
  final Widget? dropDownHintText;
  final  Function(String?)? onValueChangeCallBack;
  const CustomDropDownWidget({
    Key? key,
    required this.selectedCountry,
    required this.itemList,
    this.dropDownHeight = 160,
    this.dropDownWidth = 40,
    this.dropDownMargin,
    this.dropDownContainerDecorationColor,
    this.dropDownContainerDecorationBorderWidth,
    this.dropDownContainerDecorationBorderRadius,
    this.buttonStyleData,
    this.dropdownStyleData,
    this.menuItemStyleData,
    this.iconStyleData,
    this.dropDownHintText,
    this.onValueChangeCallBack,
    this.isExpand,
    this.isDense,
    this.dropDownContainerDecorationBorderColor
  }) : super(key: key);

  @override
  State<CustomDropDownWidget> createState() => _CustomDropDownWidgetState();
}

class _CustomDropDownWidgetState extends State<CustomDropDownWidget> {

  @override
  Widget build(BuildContext context) {


    return Container(
      width: widget.dropDownHeight ?? 160,
      height: widget.dropDownWidth ?? 40,
      margin: widget.dropDownMargin ?? EdgeInsets.zero,
      decoration: BoxDecoration(
          color: widget.dropDownContainerDecorationColor,
          border: Border.all(color: widget.dropDownContainerDecorationBorderColor ?? Colors.black,
              width: widget.dropDownContainerDecorationBorderWidth ?? 3),
          borderRadius: BorderRadius.circular(widget.dropDownContainerDecorationBorderRadius ?? 15)
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: widget.isExpand ?? false,
          isDense: widget.isDense ?? true,
          buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.only(right: 10)
          ),
          dropdownStyleData: widget.dropdownStyleData ?? const DropdownStyleData(
              elevation: 0,
              offset: Offset(0, -2),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  )
              )
          ),
          menuItemStyleData: widget.menuItemStyleData ?? const MenuItemStyleData(
              height: 25
          ),
          iconStyleData: widget.iconStyleData ?? const IconStyleData(
            icon: Icon(Icons.keyboard_arrow_down),
            iconDisabledColor: Colors.grey,
            iconEnabledColor: Colors.blue,
          ),
          hint: widget.dropDownHintText ?? Text("",
          style: appStyles.commonTitleStyle(fontSize: 14,
              texColor: appColors.textColor, fontWeight: FontWeight.w500),
          ),
          value:  widget.selectedCountry.isNotEmpty ? widget.selectedCountry : null,
          items: widget.itemList,
          onChanged: widget.onValueChangeCallBack,
        ),
      ),
    );
  }
}