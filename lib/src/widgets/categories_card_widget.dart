import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/values/app_color.dart';
import 'package:flutter/material.dart';

import '../all_file_import/app_providers_files_link.dart';
import '../model/main_app_state_model.dart';

class CategoryRowWidget extends StatefulWidget {
  final bool isIconVisible;
  final List<String> selectedCategory;
  final selectSizeCallback;
  final List<dynamic>? categoryList;
  final Function(dynamic)? selectColorCallback;
  final Function(dynamic)? onItemSelectCallback;
  final EdgeInsetsGeometry? padding;
  CategoryRowWidget({
    this.selectSizeCallback,
    this.categoryList = const [],
    this.selectedCategory = const ["All"],
    this.onItemSelectCallback,
    this.selectColorCallback,
    this.isIconVisible = false,
    this.padding,
  });

  @override
  _CategoryRowWidgetState createState() => _CategoryRowWidgetState(categoryList,selectedCategory);
}

class _CategoryRowWidgetState extends State<CategoryRowWidget> {



  List<String> selectedCategory;
  List<dynamic>? categoryList;
  _CategoryRowWidgetState(this.categoryList,this.selectedCategory) {
    MainAppBloc mainAppBloc = MainAppBloc();
    MainAppStateModel mainAppModel = mainAppBloc.state.getMainAppStateModel;
    // bool isLeftTextAlign = mainAppBloc.state.getMainAppStateModel.isLeftTextAlign;



  if(categoryList!=null && categoryList!.length>0){
    data = [];
    /*data.add(DataList(
        icon: "assets/images/category_icon_spoon.svg",
        // name: "الكـل"
        // name: isLeftTextAlign?"All":"الكـل"
    ));*/
    data.addAll(categoryList!);
  }
  }
  List<dynamic> data = [
    DataList(
        icon: "assets/images/category_icon_spoon.svg",
        name: "All"
        // name: "الكـل"
    ),

  ];

  int selectedIndex = 0;
  Color selectedColor = Colors.transparent;
  bool isSelect = true;

  @override
  void didUpdateWidget(covariant CategoryRowWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if(widget.categoryList!=null && widget.categoryList!.isNotEmpty) {


      try {
        setState(() {
          selectedCategory = widget.selectedCategory;
          data = [];
          data.add(DataList(
              icon: "assets/images/category_icon_spoon.svg",
              // name: "الكـل"
              name: "All"
          ));
          data.addAll(widget.categoryList!);

          try {
            selectedIndex = data.indexWhere((element) => element.name == selectedCategory[0]);
          } catch (e) {
            print(e);
          }
              });


      } catch (e) {
        print(e);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
         padding: EdgeInsets.only(left: 10.0,right: 10),
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 3.0,right: 3),
            child: ChoiceChip(
              padding: EdgeInsets.only(top: 0,bottom: 0,left: 0,right: 0),
              labelPadding:EdgeInsets.only(top: 0,bottom: 0,left: 0,right: 0),
              elevation: 0,
              pressElevation: 0,
              label: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: selectedIndex == index ? appColors.buttonBgColor : Colors.grey.withOpacity(0.16),
                ),
                padding: widget.padding ?? EdgeInsets.all(18), //EdgeInsets.only(top: 6,bottom: 6,left: 15,right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    widget.isIconVisible ?
                    iconApps.iconImage(
                      imageUrl: data[index].icon,
                      imageColor:selectedIndex == index ? Colors.white : Colors.grey.shade600,
                      iconSize: Size(21, 21),//imageColor:Colors.white
                    ):Container(),
                    SizedBox(width:widget.isIconVisible?10:0,),
                    Text(data[index].name,
                      style: TextStyle(
                          fontSize: 17,
                         fontWeight: FontWeight.w500,
                         color: selectedIndex == index ? Colors.white : Colors.grey.shade600,
                      ),

                    ),
                  ],
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
              backgroundColor:Colors.transparent,
              selectedColor: Colors.transparent,
              selected: selectedIndex == index,
              onSelected: (selected) {
                widget.onItemSelectCallback?.call(data[index]);
                setState(() {
                  selectedIndex =  index;
                  // print(data[index].name);
                  widget.selectSizeCallback?.call();

                });
              },

            ),
          );
        }
    );
  }
}


class DataList {
  int? categoryId;
  String? name;
  String? icon;
  DataList({
    this.categoryId = -1,
    required this.name,
    this.icon = "",
  });
}


