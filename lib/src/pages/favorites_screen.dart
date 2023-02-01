import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/favorite_card_model.dart';
import 'package:base_flutter_app/src/values/app_dimens.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar.dart';
import 'package:base_flutter_app/src/widgets/basic_view_container/container_first.dart';
import 'package:base_flutter_app/src/widgets/favorite_screen_card_widget.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {

  @override
  Widget build(BuildContext context) {

    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);

    return ContainerFirst(
        contextCurrentView: context,
        isSingleChildScrollViewNeed: true,
        isFixedDeviceHeight: true,
        statusBarColor: Colors.white,
        appBarHeight: 56,
        appBar: CommonAppBar(
          isShowTitle: true,
          title: "Favorites",
          isHideRightICon: true,
          isHideLeftIcon: true,
        ),
        appBackgroundColor: Colors.white,
        containChild: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           /* Container(
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
              child: Text("Favorites",
                style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,
                color: appColors.white
                ),
              ),
            ),*/
            SizedBox(height: 20,),
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 20),
                    child: Text("4 Items",
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,
                      color: appColors.textColor.withOpacity(0.80),
                      ),
                    ))
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: favoriteCardList.length,
              itemBuilder: (context,index){
                return Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: FavoriteScreenCard(
                        imageUrl: favoriteCardList[index].imageUrl,
                        title: favoriteCardList[index].title,
                        subTitle: favoriteCardList[index].subTitle,
                        price: favoriteCardList[index].price,
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      right: 0,
                      child: Container(
                        margin: EdgeInsets.only(right: 20),
                        padding: EdgeInsets.all(8).copyWith(left: 15,right: 15),
                        decoration: BoxDecoration(
                            color: Color(0xFFCB7642),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15)
                            )
                        ),
                        child: iconApps.iconImage(
                            imageUrl: iconApps.plusIcon,
                            iconSize: Size(20, 20)),
                      ),
                    )
                  ],
                );
              },
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text("Edit",
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,
                        color: appColors.appButtonBgColor,
                      )
                  ),
                )
            ),
            SizedBox(height: 20,),
            SizedBox(height: 20,),
            SizedBox(height: 20,),
            SizedBox(height: 20,),
          ],
        )
    );
  }
}
