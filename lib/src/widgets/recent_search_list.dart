import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:flutter/material.dart';

class RecentSearchListView extends StatelessWidget {
  final String? recentSearchText;
  final EdgeInsetsGeometry? margin;
  const RecentSearchListView({
    Key? key, this.recentSearchText, this.margin
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: margin ?? EdgeInsets.zero,
      padding: EdgeInsets.all(10).copyWith(left: 15, right: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: appColors.appBgColor2),
      child: Text(recentSearchText!,
        style: appStyles.commonSubTitleTextStyle(fontSize: 13,texColor: appColors.white),
      ),
    );
  }
}
