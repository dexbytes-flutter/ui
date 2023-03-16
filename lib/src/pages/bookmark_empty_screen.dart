import 'package:base_flutter_app/src/all_file_import/app_providers_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/pages/search_screen.dart';
import 'package:flutter/material.dart';

class BookmarkEmptyScreen extends StatefulWidget {
  const BookmarkEmptyScreen({Key? key}) : super(key: key);

  @override
  State<BookmarkEmptyScreen> createState() => _BookmarkEmptyScreenState();
}

class _BookmarkEmptyScreenState extends State<BookmarkEmptyScreen> {
  @override
  Widget build(BuildContext context) {

    // Title text
    Widget titleText(){
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(appString.trans(context, appString.yourBookmarkTitleText,),
              style: appStyles.commonTitleStyle(fontSize: 25,texColor: appColors.buttonBgColor),
            ),
          ),
        ],
      );
    }

    //Center empty bookmark text view
    centerView(){
      return Text(appString.trans(context, appString.bookmarkScreenCenterEmptyText),
        textAlign: TextAlign.left,
        style: appStyles.commonSubTitleTextStyle(),
      );
    }

    return ContainerFirst(
        appBarHeight: 56,
        isOverLayStatusBar: false,
        appBar: titleText(),
        isSingleChildScrollViewNeed: false,
        contextCurrentView: context,
        containChild: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              left: 20,
              right: 20,
              child: Container(
                height: 2,
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
