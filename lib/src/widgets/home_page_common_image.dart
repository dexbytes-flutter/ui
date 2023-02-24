import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomepageCommonImage extends StatelessWidget {
  final String? imageUrl;
  const HomepageCommonImage({
    Key? key,
    this.imageUrl
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget ratingView(){
      return Container(
        padding: EdgeInsets.all(10).copyWith(left: 20,right: 20),
        decoration: BoxDecoration(
          color: appColors.buttonBgColor.withOpacity(0.20),
          borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          children: [
            iconApps.iconImage(
                imageUrl: iconApps.starIcon,
                iconSize: Size(14, 14)
            ),
            SizedBox(width: 5,),
            Text("4.9",
            style: appStyles.commonSubTitleTextStyle(texColor: appColors.buttonBgColor,fontWeight: FontWeight.w500,fontSize: 15),)
          ],
        ),
      );
    }
    Widget placeTitleView(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Borobudur \nTemple",
          style: appStyles.commonTitleStyle(fontSize: 32),
          ),
          SizedBox(height: 8,),
          Row(
            children: [
              Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: appColors.red
                ),
              ),
              SizedBox(width: 5,),
              Text("Magelang Indonesia",
              style: appStyles.commonSubTitleTextStyle(fontSize: 14),
              )
            ],
          )
        ],
      );
    }

    bottomButton(){
      return Container(
          // height: 50,
          // width: 100,
          padding: EdgeInsets.only(left: 20,right: 20).copyWith(top: 2,bottom: 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: appColors.buttonBgColor.withOpacity(0.50)
          ),
          child: InkWell(
            onTap: (){
            },
            child: Container(
                padding: EdgeInsets.all(12),
                child: iconApps.iconImage(
                    imageUrl: iconApps.rightArrow,
                    imageColor: appColors.buttonBgColor,
                    iconSize: Size(20, 25)
                )
            ),
          )
      );
    }

    return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: ShaderMask(
                shaderCallback: (bound) => LinearGradient(
                  colors: [
                    appColors.appTransColor.withOpacity(0.40),
                    appColors.appBgColorJungleGreen.withOpacity(0.75)
                  ],
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                ).createShader(bound),
                blendMode: BlendMode.darken,
                child: CachedNetworkImage(
                  imageUrl: imageUrl!,
                  fit:BoxFit.cover,
                  width: appDimens.widthFullScreen()/1.42,
                  height: appDimens.heightFullScreen()/1.5,
                ),
              ),
            ),
            Positioned(
              left: 25,
                top: 25,
                child: ratingView()
            ),
            Positioned(
              top: 25,
                right: 25,
                child: iconApps.iconImage(
                imageUrl: iconApps.bookmarkIconFilled,
                iconSize: Size(25, 35),
                  imageColor: appColors.buttonBgColor.withOpacity(0.70)
              )
            ),
            Positioned(
              bottom: 230,
                left: 25,
                child: Text(appString.trans(context, appString.recommendedImageText),
                  style: appStyles.commonSubTitleTextStyle(fontSize: 13),
                )
            ),
            Positioned(
              bottom: 110,
                left: 25,
                child: placeTitleView()
            ),
            Positioned(
              right: 25,
                bottom: 25,
                child: bottomButton()
            )
          ],
        );
  }
}
