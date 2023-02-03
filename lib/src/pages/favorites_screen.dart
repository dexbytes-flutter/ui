import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/model/favorite_card_model.dart';
import 'package:base_flutter_app/src/pages/sign_in_screen.dart';
import 'package:base_flutter_app/src/values/app_dimens.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar.dart';
import 'package:base_flutter_app/src/widgets/basic_view_container/container_first.dart';
import 'package:base_flutter_app/src/widgets/favorite_screen_card_widget.dart';
import 'package:flutter/material.dart';

import '../all_file_import/app_providers_files_link.dart';
import '../all_file_import/app_utils_files_link.dart';
import '../helper/local_constant.dart';

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

    MainAppBloc mainAppBloc = MainAppBloc();

    // Favorite card list
    Widget favoriteCards(){
      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: favoriteCardList.length,
        itemBuilder: (context,index){
          return FavoriteScreenCard(
            imageUrl: favoriteCardList[index].imageUrl,
            title: favoriteCardList[index].title,
            subTitle: favoriteCardList[index].subTitle,
            price: favoriteCardList[index].price,
          );
        },
      );
    }

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
            favoriteCards(),
            SizedBox(height: 15,),
        Container(
            margin: EdgeInsets.only(left: 20,right: 20,bottom: 15),
            child: CommonButton(
            buttonName: "Log out",
            buttonHeight: 48,
            buttonBorderRadius: 12,
            isBottomMarginRequired: false,
            textStyle: TextStyle(fontSize:16, fontWeight: FontWeight.w600,color: Colors.white ),
            backCallback: (){
              // mainAppBloc.add(LogOutEvent(context: context));
              SharedPreferencesFile().saveBool(isUserLoggedInC, false);
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                return SignInScreen();
              }), (route) => false);
            }
    )
        )
          ],
        )
    );
  }
}
