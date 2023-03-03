import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:flutter/material.dart';

class ChoiceChipWidget extends StatefulWidget {
  final List<String> reportList;
  final bool? isAvatar;

  ChoiceChipWidget({
    required this.reportList,
    this.isAvatar
  });

  @override
  _ChoiceChipWidgetState createState() => new _ChoiceChipWidgetState();
}

class _ChoiceChipWidgetState extends State<ChoiceChipWidget> {

  String selectedChoice = "";

  _buildChoiceList() {
    List<Widget> choices = [];
    widget.reportList.forEach((item) {
      choices.add(Container(
        child: ChoiceChip(
          label: Text(item),
          labelStyle: appStyles.commonSubTitleTextStyle(fontSize: 12.5,
          texColor: selectedChoice == item ? appColors.buttonBgColor : appColors.textColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12),
            ),
          ),
          labelPadding: EdgeInsets.only(left: widget.isAvatar!? 0 : 10, right: 10),
          backgroundColor: appColors.appBgColor2,
          selectedColor: appColors.appContainerBgColor1,
          selected: selectedChoice == item,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
            });
          },
        ),
      ));
    });
    return choices;
  }

  _buildChoiceListWithAvatar() {
    List<Widget> choices = [];
    widget.reportList.forEach((item) {
      choices.add(Container(
        child: ChoiceChip(
          avatar: iconApps.iconImage(
              imageUrl: iconApps.starIcon,
              iconSize: Size(10, 10)
          ),
          label: Text(item),
          labelStyle: appStyles.commonSubTitleTextStyle(fontSize: 12.5,
              texColor: selectedChoice == item ? appColors.buttonBgColor : appColors.textColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12),
            ),
          ),
          labelPadding: EdgeInsets.only(right: 10),
          backgroundColor: appColors.appBgColor2,
          selectedColor: appColors.appContainerBgColor1,
          selected: selectedChoice == item,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      runSpacing: -5,
      children: widget.isAvatar!? _buildChoiceListWithAvatar() : _buildChoiceList(),
    );
  }
}