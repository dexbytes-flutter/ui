import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/model/gallery_list_view_model.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar.dart';
import 'package:base_flutter_app/src/widgets/full_view_image_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AllGalleryImagesScreen extends StatefulWidget {
  const AllGalleryImagesScreen({Key? key}) : super(key: key);

  @override
  State<AllGalleryImagesScreen> createState() => _AllGalleryImagesScreenState();
}

class _AllGalleryImagesScreenState extends State<AllGalleryImagesScreen> {

  String imageUrl = "";

  @override
  Widget build(BuildContext context) {

    // Gallery images stagger grid tile list view
    staggerGridTileListView(){
      return Container(
        margin: EdgeInsets.only(left: 20,right: 20,),
        child: GridView.custom(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 20),
          gridDelegate: SliverQuiltedGridDelegate(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            repeatPattern: QuiltedGridRepeatPattern.same,
            pattern: [
              QuiltedGridTile(2, 4),
              QuiltedGridTile(3, 2),
              QuiltedGridTile(4, 2),
              QuiltedGridTile(4, 2),
              QuiltedGridTile(3, 2),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
                (context, index) => ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    imageUrl = galleryImageList[index].imageUrl;
                  });
                  Navigator.push(
                    context,
                    SlideRightRoute(
                        widget: FullPhotoView(galleryZoomImageUrl: imageUrl)),
                  );
                },
                child: Container(
                  child: CachedNetworkImage(
                    imageUrl: allGalleryImageList[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            childCount: allGalleryImageList.length,
          ),
        ),
      );
    }

    return ContainerFirst(
        appBarHeight: 56,
        isOverLayStatusBar: false,
        isOverLayAppBar: false,
        isSingleChildScrollViewNeed: true,
        isFixedDeviceHeight: false,
        contextCurrentView: context,
        appBar: CommonAppBar(
          isHideRightIcon: true,
        ),
        containChild: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 30),
              child: Text(appString.trans(context, appString.galleryTitleText),
                  style: appStyles.commonTitleStyle(fontSize: 30)),
            ),
            SizedBox(height: 20,),
            staggerGridTileListView(),
          ],
        )
    );
  }
}
