import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/values/app_dimens.dart';
import 'package:flutter/material.dart';


class CommonAppBarWithLeftIconTitle extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final Widget? leading;
  final Widget? titleWidget;
  final bool showActionIcon;
  final VoidCallback? onMenuActionTap;
  const CommonAppBarWithLeftIconTitle({
    Key? key,
    this.title = "",
    this.leading,
    this.titleWidget,
    this.showActionIcon = false,
    this.onMenuActionTap
  }) : super(key: key);

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(
      double.maxFinite,
      60,
  );


  @override
  Widget build(BuildContext context) {
    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15/10
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                leading ?? GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: iconApps.iconImage(imageUrl: iconApps.backArrowIcon,
                    iconSize: Size(20,20),
                  ),
                ),
              ],
            ),
           Center(child: Text(title,
            style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 18, color: Colors.black))),
          ],
        ),
      )
    );
  }
}
