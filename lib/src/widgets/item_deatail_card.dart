import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/appbar/home_appbar.dart';
import 'package:base_flutter_app/src/widgets/basic_view_container/container_first.dart';
import 'package:base_flutter_app/src/widgets/coffee_size_widget.dart';
import 'package:base_flutter_app/src/widgets/common_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:readmore/readmore.dart';

import 'appbar/common_app_bar.dart';

class ItemDetailCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subTitle;
  final String description;
  final String price;
  final bool isFav;
  const ItemDetailCard({
    Key? key,
    this.imageUrl = "https://images.pexels.com/photos/2396220/pexels-photo-2396220.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    this.title = "Cappuccino",
    this.subTitle = "With Oat Milk",
    this.description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    this.price = "4.20",
    this.isFav = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);

    // Top image widget
    Widget topImageView() {
      return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              height: appDimens.heightFullScreen()/1.6,
              // width: 400,
              width: appDimens.widthFullScreen()/1,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              child: CommonAppBar()),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  height: appDimens.heightFullScreen() / 5.5,
                  width: appDimens.widthFullScreen()/1,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                title,
                                softWrap: true,
                                style: appStyles.commonCardTitleTextStyle(
                                    texColor: appColors.white
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 5),
                              child: Text(
                                subTitle,
                                style: appStyles.commonCardSubTitleTextStyle(
                                texColor: Colors.black.withOpacity(0.40)
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 20, top: 10),
                                  child: iconApps.iconImage(
                                    imageUrl: iconApps.startIcon,
                                    iconSize: Size(20, 20),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 12, left: 15),
                                  child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "4.5",
                                          style: appStyles.coffeCardTitleStyle(
                                            texColor: appColors.white
                                          )
                                      ),
                                      WidgetSpan(
                                          child: SizedBox(
                                            width: 5,
                                          )),
                                      TextSpan(
                                          text: "(6.986)",
                                          style: appStyles.commonCardSubTitleTextStyle(
                                            texColor: Colors.black.withOpacity(0.40)
                                          )
                                      )
                                    ]),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(right: 20),
                            margin: EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: appColors.appThemeColor1),
                                  child: Column(
                                    children: [
                                      iconApps.iconImage(
                                          imageUrl: iconApps.coffeeBeansIcon,
                                          iconSize: Size(20, 20),
                                          imageColor: Color(0xFFCB7642)),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "Coffee",
                                        style: appStyles.commonSubTitleTextStyle()
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 14, right: 14, top: 8, bottom: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: appColors.appThemeColor1),
                                  child: Column(
                                    children: [
                                      iconApps.iconImage(
                                          imageUrl: iconApps.milkDropIcon,
                                          iconSize: Size(20, 20),
                                          imageColor: Color(0xFFCB7642)),
                                      SizedBox(height: 4,),
                                      Text(
                                        "Milk",
                                        style: appStyles.commonSubTitleTextStyle(),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10).copyWith(left: 15,right: 15),
                            margin: EdgeInsets.only(right: 25),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: appColors.appThemeColor1),
                            child: Text(
                              "Medium Roasted",
                              style: appStyles.commonSubTitleTextStyle(),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ),
        ],
      );
    }

    // Bottom view
    Widget bottomView() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15,),
            child: Text(
              appString.trans(context, appString.descriptionTitleText),
              style: appStyles.commonCardTitleTextStyle(),)
          ),
          SizedBox(
            height: 10,
          ),
          ReadMoreText(
           description,
            trimLines: 3,
            preDataTextStyle: appStyles.commonCardSubTitleTextStyle(),
            style: appStyles.commonCardSubTitleTextStyle(),
            colorClickableText: appColors.appButtonBgColor,
            trimMode: TrimMode.Line,
            trimCollapsedText: appString.trans(context, appString.readMoreText),
            trimExpandedText: appString.trans(context, appString.showlessText),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            appString.trans(context, appString.sizeText),
            style: appStyles.commonCardTitleTextStyle(),
          ),
          SizedBox(
            height: 10,
          ),
          SizeChoice(),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appString.trans(context, appString.priceText),
                    style: appStyles.commonCardTitleTextStyle(),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(appString.trans(context, appString.rupeeSignText),
                          style: appStyles.commonCardTitleTextStyle(
                              fontSize: 17,texColor: appColors.textNormalColor1
                          )
                      ),
                      Text(price,
                          style: appStyles.commonCardTitleTextStyle(
                              fontSize: 17,texColor: appColors.textNormalColor1
                          )
                      )
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 119,bottom: 10),
                    height: 50,
                    width: 152,
                    child: CommonButton(
                      buttonColor: Color(0xFF54321E),
                      buttonName: appString.trans(context, appString.buyNowButtonText),
                      buttonHeight: 50,
                      buttonBorderRadius: 12,
                      isBottomMarginRequired: false,
                      textStyle: appStyles.commonButtonTitleTextTextStyle(),
                      backCallback: () {
                        /*if(_validateFields(isButtonClicked: true)){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                    return OtpVerificationScreen(
                      isSignInScreen: true,
                    );
                  }), (route) => false);
                }*/
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      );
    }

    return ContainerFirst(
      contextCurrentView: context,
      isSingleChildScrollViewNeed: true,
      isFixedDeviceHeight: true,
      isOverLayAppBar: true,
      statusBarColor: appColors.appBgColor1.withOpacity(0.15),
      appBarHeight: -1,
      containChild: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topImageView(),
            bottomView(),
          ],
        ),
      ),
    );
  }
}
