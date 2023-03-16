import 'package:flutter/material.dart';

import '../all_file_import/app_values_files_link.dart';

class CommonVerticalList extends StatelessWidget {
  final String? listTitle;
  final int index;
  final int selectedIndex;
  final EdgeInsetsGeometry? commonListMargin;
  final bool? isHorizontalList;
  const CommonVerticalList({
    Key? key, this.listTitle,
    required this.index,
    required this.selectedIndex,
    this.commonListMargin,
    this.isHorizontalList
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: commonListMargin ?? EdgeInsets.only(left: 5,top: 20,right: 40),
      child: Column(
        children: [
          Text(listTitle!,
              style: appStyles.commonSubTitleTextStyle(
                  texColor: selectedIndex == index? appColors.buttonBgColor : appColors.textColor,
                fontSize: isHorizontalList == true ? 12 : 14
              ),
            ),
          SizedBox(height: selectedIndex == index ? 2:0,),
          Container(
            width: isHorizontalList!? 8 : 15,
            height: isHorizontalList!? 1.5 : 0,
            decoration: BoxDecoration(
              border: Border.all(
                color: selectedIndex == index ? appColors.buttonBgColor : appColors.appTransColor
              ),
            ),
          )
        ],
      ),
    );
  }
}
