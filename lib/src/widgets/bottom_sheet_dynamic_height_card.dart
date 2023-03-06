import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:flutter/material.dart';

class BottomSheetDynamicHeightCardView extends StatelessWidget {
  final String sheetTitle;
  final TextStyle sheetTitleStyle;
  final Color topLineColor;
  final double topLineThickness;
  final double topLineWidth;
  final topLineClickCallBack;
  final Color cardBackgroundColor;
  final double cardShape;
  final Widget child;
  final Widget? child2;
  final bool topLineShow;
  final EdgeInsetsGeometry topLineMargin;
  final CrossAxisAlignment crossAxisAlignment;
  final EdgeInsetsGeometry? bottomSheetMargin;
  final EdgeInsetsGeometry? sheetTitlePadding;

  BottomSheetDynamicHeightCardView(
      {Key? key,
        this.sheetTitle = "",
        this.sheetTitleStyle = const TextStyle(),
        this.topLineColor = Colors.grey,
        this.topLineThickness = 4,
        this.topLineWidth = 50,
        this.cardBackgroundColor = Colors.red,
        this.cardShape = 30,
        this.topLineClickCallBack,
        required this.child,
        this.topLineShow =false,
        this.topLineMargin = const EdgeInsets.only(top: 12, bottom: 10),
        this.crossAxisAlignment = CrossAxisAlignment.start, this.child2,
        this.bottomSheetMargin,
        this.sheetTitlePadding
      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: Container(
        height: appDimens.heightFullScreen() - 200,
        margin: bottomSheetMargin ?? EdgeInsets.zero,
        decoration: BoxDecoration(
            color: cardBackgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
            )
        ),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: crossAxisAlignment,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: topLineShow,
                    child: InkWell(
                      highlightColor: Colors.brown,
                      onTap: () {
                        // if (topLineClickCallBack != null) {
                        //   topLineClickCallBack(context);
                        // }
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: topLineMargin,
                        width: topLineWidth,
                        child: Divider(
                          color: topLineColor,
                          //height: 10,
                          thickness: topLineThickness,
                          indent: 1,
                          endIndent: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: sheetTitlePadding ?? EdgeInsets.only(left: 20.0,right: 20,top: 10),
                child: Text("$sheetTitle",
                    style: sheetTitleStyle),
              ),
              child,

              // Padding(
              //   padding: EdgeInsets.only(top: 0.0),
              //   child: Column(
              //     mainAxisSize: MainAxisSize.min,
              //     crossAxisAlignment: crossAxisAlignment,
              //     children: [
              //       Padding(
              //         padding: EdgeInsets.only(left: 20.0,right: 20),
              //         child: Text("$sheetTitle",
              //             style: sheetTitleStyle),
              //       ),
              //       Container(
              //           height: bottomSheetHeight,
              //           child: child
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
