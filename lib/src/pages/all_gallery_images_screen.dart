import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/model/gallery_list_view_model.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AllGalleryImagesScreen extends StatefulWidget {
  const AllGalleryImagesScreen({Key? key}) : super(key: key);

  @override
  State<AllGalleryImagesScreen> createState() => _AllGalleryImagesScreenState();
}

class _AllGalleryImagesScreenState extends State<AllGalleryImagesScreen> {
  @override
  Widget build(BuildContext context) {

    // Stagger grid tile list view
    staggerGridTileListView(){
      return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20),
          gridDelegate: SliverQuiltedGridDelegate(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            repeatPattern: QuiltedGridRepeatPattern.inverted,
            pattern: [
              QuiltedGridTile(2,4),
              QuiltedGridTile(4,4),
              // QuiltedGridTile(1, 1),
            ],
          ),
          itemCount: allGalleryImageList.length,
          itemBuilder: (context,index){
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: allGalleryImageList[index].imageUrl,
                fit: BoxFit.cover,
                height: 80,
                width: 80,
              ),
            );
          }
      );
        /*GridView.custom(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.only(
          bottom: 16,
          left: 16,
          right: 16,
        ),
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 6,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          repeatPattern: QuiltedGridRepeatPattern.inverted,
          pattern: [
            QuiltedGridTile(2, 2),
            QuiltedGridTile(2, 2),
            QuiltedGridTile(2, 2),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate((context, index) {
          return  ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: allGalleryImageList[index].imageUrl,
              fit: BoxFit.cover,
              height: 80,
              width: 80,
            ),
          );
        },
            childCount:allGalleryImageList.length
        ),
      )*/;
    }


    // Gallery images view
    galleryImagesView(){
      return Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            children: [
              StaggeredGridTile.count(
                crossAxisCellCount: 3,
                mainAxisCellCount: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/13/Before_Machu_Picchu.jpg/1200px-Before_Machu_Picchu.jpg",
                    fit: BoxFit.cover,
                    height: 80,
                    width: 80,
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1.4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeO1YN0h533FW_p45ZoGE4z3F4t3Ryi5Lmjw&usqp=CAU",
                    fit: BoxFit.cover,
                    height: 80,
                    width: 80,
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: "https://www.villa-bali.com/guide/wp-content/uploads/2013/07/14823672449_c1a13ab10e_k-630x419.jpg",
                    fit: BoxFit.cover,
                    height: 80,
                    width: 80,
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: "https://res.klook.com/images/fl_lossy.progressive,q_65/c_fill,w_1200,h_630/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/cb3rcucjerqdltdquhlo/Bali%20Private%20UNESCO%20Heritage%20Sites%20Day%20Trip%20in%20Indonesia.jpg",
                    fit: BoxFit.cover,
                    height: 80,
                    width: 80,
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1.4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: "https://pictures.altai-travel.com/1920x0/panoramic-view-of-the-machu-picchu-35.jpg",
                    fit: BoxFit.cover,
                    height: 80,
                    width: 80,
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1.4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeO1YN0h533FW_p45ZoGE4z3F4t3Ryi5Lmjw&usqp=CAU",
                    fit: BoxFit.cover,
                    height: 80,
                    width: 80,
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: "https://www.villa-bali.com/guide/wp-content/uploads/2013/07/14823672449_c1a13ab10e_k-630x419.jpg",
                    fit: BoxFit.cover,
                    height: 80,
                    width: 80,
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: "https://res.klook.com/images/fl_lossy.progressive,q_65/c_fill,w_1200,h_630/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/cb3rcucjerqdltdquhlo/Bali%20Private%20UNESCO%20Heritage%20Sites%20Day%20Trip%20in%20Indonesia.jpg",
                    fit: BoxFit.cover,
                    height: 80,
                    width: 80,
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1.4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: "https://pictures.altai-travel.com/1920x0/panoramic-view-of-the-machu-picchu-35.jpg",
                    fit: BoxFit.cover,
                    height: 80,
                    width: 80,
                  ),
                ),
              ),
            ],
          )
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
