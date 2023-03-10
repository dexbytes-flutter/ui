import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:photo_view/photo_view.dart';

import '../all_file_import/app_values_files_link.dart';
import '../image_res/iconApp.dart';


class FullPhotoView extends StatelessWidget {
  final String? galleryZoomImageUrl;

  const FullPhotoView({Key? key,
    this.galleryZoomImageUrl,


  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: appColors.appBgColorJungleGreen,
      body: Center(
        child: Stack(
          children: [
            Container(
              child: PhotoView(
                imageProvider: NetworkImage(
                  galleryZoomImageUrl ?? "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F37%2F2020%2F11%2F25%2FHow-much-to-tip-at-salon.jpg",
                  // width:  widget.imageWidth == null? MediaQuery.of(context).size.width:widget.imageWidth, ,
                ),
                backgroundDecoration: BoxDecoration(
                  color: appColors.appBgColorJungleGreen,
                ),
                maxScale: PhotoViewComputedScale.covered * 1.8,
                minScale: PhotoViewComputedScale.contained * 1,
              ),
            ),
            Positioned(
              top: 25,
              left: 10,
              child: IconButton(
                splashRadius: 30,
                icon: iconApps.iconImage(
                    imageUrl: iconApps.leftArrow,
                    imageColor: appColors.white,
                    iconSize: Size(30, 30)
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

