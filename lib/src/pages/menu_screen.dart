import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/values/app_dimens.dart';
import 'package:base_flutter_app/src/widgets/basic_view_container/container_first.dart';
import 'package:base_flutter_app/src/widgets/coffee_name_horizontal_list.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  @override
  Widget build(BuildContext context) {
    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);

    // category list view
    Widget category() {
      return Container(
          height: appDimens.heightFullScreen()/15,
          margin: EdgeInsets.only(left: 8),
          child: CoffeeNameHorizontalList(
          isMenuScreen: true,
          )
      );
    }

    return ContainerFirst(
      contextCurrentView: context,
      isSingleChildScrollViewNeed: true,
      isFixedDeviceHeight: true,
      statusBarColor: Colors.white,
      appBarHeight: -1,
      appBackgroundColor: Colors.white,
      containChild: Stack(
        children: [
          Container(
            height: appDimens.heightFullScreen()/6,
            width: appDimens.widthFullScreen()/1,
            padding: EdgeInsets.only(
                top: appDimens.heightFullScreen()/14,
                left: 15
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)
                ),
                color: appColors.containerBgColor
            ),
            child: Text("Menu",
              style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,
                  color: appColors.white
              ),
            ),
          ),
          category()
        ],
      ),

    );
  }
}
