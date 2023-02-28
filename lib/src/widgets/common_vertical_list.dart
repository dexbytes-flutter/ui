import 'package:flutter/material.dart';

import '../all_file_import/app_values_files_link.dart';

class CommonVerticalList extends StatelessWidget {
  final String? listTitle;
  final int index;
  final int selectedIndex;
  const CommonVerticalList({
    Key? key, this.listTitle,
    required this.index,
    required this.selectedIndex
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: Container(
        margin: EdgeInsets.only(left: 5,top: 20,right: 40),
        child: Column(
          children: [
            Text(listTitle!,
                style: appStyles.commonSubTitleTextStyle(
                    texColor: selectedIndex == index? appColors.buttonBgColor : appColors.textColor
                ),
              ),
            SizedBox(height: selectedIndex == index? 2:0,),
            Container(
              width: 15,
              decoration: BoxDecoration(
                border: Border.all(
                  color: selectedIndex == index? appColors.buttonBgColor : appColors.appTransColor
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
