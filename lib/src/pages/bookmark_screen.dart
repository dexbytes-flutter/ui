import 'package:base_flutter_app/src/all_file_import/app_providers_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/pages/search_screen.dart';
import 'package:flutter/material.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {

    // Title text and search icon
    Widget titleText(){
      return Text(appString.trans(context, appString.yourBookmarkTitleText),
        style: appStyles.commonTitleStyle(fontSize: 25,texColor: appColors.buttonBgColor),
      );
    }

    //Center empty bookmark text view
    centerView(){
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(appString.trans(context, appString.bookmarkScreenCenterEmptyText),
              textAlign: TextAlign.left,
              style: appStyles.commonSubTitleTextStyle(),
            ),
          ],
        ),
      );
    }

    return ContainerFirst(
        appBarHeight: -1,
        isOverLayStatusBar: true,
        statusBarColor: Colors.white,
        isSingleChildScrollViewNeed: false,
        contextCurrentView: context,
        containChild: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 20,
                right: 20,
                top: 30,
                child: titleText()
            ),
            Positioned(
              left: 20,
              right: 20,
              top: 65,
              child: SizedBox(
                child: Divider(
                  color: appColors.appBgColor1.withOpacity(0.15),
                  height: 20,
                  thickness: 2,
                ),
              ),
            ),
            centerView()
          ],
        )
    );
  }
}
