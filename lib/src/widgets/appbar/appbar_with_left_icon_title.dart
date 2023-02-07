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
      80,
  );

  @override
  Widget build(BuildContext context) {
    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 35/20
        ),
        child: Stack(
          children: [
            Positioned.fill(
                child: titleWidget == null? Center(child: Text(title,
                style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 18, color: Colors.black)))
          : Center(child: titleWidget!),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                leading?? Transform.translate(
                    offset: const Offset(-14, 0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: iconApps.iconImage(imageUrl: iconApps.backArrowIcon,
                      iconSize: Size(20,20),
                    ),/*Container(
                      // padding: EdgeInsets.all(10),
                      // margin: EdgeInsets.only(left: 10,top: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: appColors.grey
                      ),
                      child: iconApps.iconImage(imageUrl: iconApps.backArrowIcon,
                        iconSize: Size(20,20),
                      ),
                    )*/
                  ),
                ),
                if(showActionIcon)
                  Transform.translate(
                      offset: const Offset(10,0),
                    child: InkWell(
                      onTap: (){

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.menu
                        ),
                      ),
                    ),
                  )
              ],
            )
          ],
        ),
      )
      /*Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 10,top: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: appColors.appBgColor1.withOpacity(0.60)
                  ),
                  child: iconApps.iconImage(imageUrl: iconApps.backArrowIcon,
                    iconSize: Size(20,20),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Text("hjjkjhkjhkhkhl",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
          ),
        ],
      ),*/
    );
  }
}
