import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageListWithItemCountOnStack extends StatelessWidget {
  final String imageUrl;
  final double? imageWidth;
  final double? imageHeight;
  final int? widgetList;
  final int? totalCount;
  final bool? showTotalCount;
  final int? lastVisibleIndex;
  final Function? onTapCallBack;
  final int? selectedIndex;
  final int? currentIndex;
  const ImageListWithItemCountOnStack(
      {Key? key,
      this.imageHeight,
      this.imageWidth,
      required this.imageUrl,
      required this.widgetList,
      this.totalCount,
      this.showTotalCount,
      this.lastVisibleIndex,
        this.onTapCallBack,
        this.selectedIndex,
        this.currentIndex
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTap: (){
            onTapCallBack?.call();
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: selectedIndex == currentIndex ? appColors.buttonBgColor : appColors.appTransColor,
                  width: selectedIndex == currentIndex ? 2 : 0),
              borderRadius: BorderRadius.circular(20)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                height: imageHeight ?? 55,
                width: imageWidth ?? 55,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        lastVisibleIndex == totalCount!
            ? Center(
                child: Text(
                "+ ${widgetList! - totalCount!}",
                textAlign: TextAlign.center,
                style: appStyles.commonTitleStyle(
                    fontWeight: FontWeight.w500, fontSize: 18),
              ))
            : Container()
      ],
    );
  }
}
