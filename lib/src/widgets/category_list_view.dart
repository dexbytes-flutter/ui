import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/menu_category_list_model.dart';
import 'package:flutter/material.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({Key? key}) : super(key: key);

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {

  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);

    return ListView.builder(
      padding: EdgeInsets.only(left: 20,),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: categoryDataList.length,
      itemBuilder: (context,index){
        return GestureDetector(
          onTap: (){
            setState(() {
              this.selectedCategoryIndex = index;
            });
          },
          child: Container(
            margin: EdgeInsets.only(right: 15),
            width: appDimens.widthFullScreen()/2.4,
            decoration: BoxDecoration(
              color: selectedCategoryIndex == index ? appColors.appButtonBgColor : appColors.containerBgColor1,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: appColors.white
                  ),
                  child: iconApps.iconImage(
                      // imageUrl: iconApps.hotDrinksIcon,
                      imageUrl: categoryDataList[index].listIcon,
                      iconSize: Size(20,20),
                    imageColor: selectedCategoryIndex == index ? appColors.appButtonBgColor : appColors.containerBgColor1,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(categoryDataList[index].listTitle,
                      softWrap: true,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,
                      color:  selectedCategoryIndex == index ? appColors.white: Colors.grey.shade400
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
