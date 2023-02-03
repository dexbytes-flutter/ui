import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:flutter/material.dart';

class CategoryListView extends StatefulWidget {
  final int selectedCategoryIndex;
  final String imageUrl;
  final String categoryListTitle;
  final int index;

  const CategoryListView({
    Key? key,
    this.selectedCategoryIndex  = 0,
    this.imageUrl = "assets/images/hot_drinks.svg",
    this.categoryListTitle = "Hot coffee",
    this.index = 0
  }) : super(key: key);

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {

  @override
  Widget build(BuildContext context) {
    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);

    return Container(
      margin: EdgeInsets.only(right: 15),
      width: appDimens.widthFullScreen() / 2.4,
      decoration: BoxDecoration(
        color: widget.selectedCategoryIndex == widget.index
            ? appColors.appButtonBgColor
            : appColors.containerBgColor1,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: appColors.white),
            child: iconApps.iconImage(
              imageUrl: widget.imageUrl,
              iconSize: Size(18, 18),
              imageColor: widget.selectedCategoryIndex == widget.index
                  ? appColors.appButtonBgColor
                  : appColors.containerBgColor1,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
               widget.categoryListTitle,
                softWrap: true,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: widget.selectedCategoryIndex == widget.index
                        ? appColors.white
                        : Colors.grey.shade400),
              ),
            ),
          )
        ],
      ),
    );
  }
}
