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

class CoffeeDetailCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subTitle;
  const CoffeeDetailCard({
    Key? key,
    this.imageUrl = "https://i.pinimg.com/564x/db/d4/54/dbd4547ca83892ecc86ed87ed916b109.jpg",
    this.title = "Cappuccino",
    this.subTitle = "With Oat Milk",
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
                      // color: Color(0xFFCB7642).withOpacity(0.3),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              title,
                              style: TextStyle(
                                  color: appColors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: Text(
                              subTitle,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.40),
                                  // color: Colors.grey.shade500,
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w500),
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
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                    WidgetSpan(
                                        child: SizedBox(
                                          width: 5,
                                        )),
                                    TextSpan(
                                        text: "(6.986)",
                                        style: TextStyle(
                                            color: Colors.black.withOpacity(0.40),
                                            // color: Colors.grey.shade500,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.5))
                                  ]),
                                ),
                              )
                            ],
                          )
                        ],
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
                                        style:
                                        TextStyle(color: Colors.grey.shade500,
                                          fontSize: 11,
                                        ),
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
                                        style:
                                        TextStyle(color: Colors.grey.shade500,
                                            fontSize: 11
                                        ),
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
                              style: TextStyle(color: Colors.grey.shade500,
                                  fontSize: 11
                              ),
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
              "Description",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: appColors.textColor.withOpacity(0.80)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ReadMoreText(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
            trimLines: 3,
            preDataTextStyle: TextStyle(fontWeight: FontWeight.w500),
            style: TextStyle(color: Colors.grey.shade500),
            colorClickableText: Color(0xFFCB7642),
            trimMode: TrimMode.Line,
            trimCollapsedText: '...Read More',
            trimExpandedText: ' show less',
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Size",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: appColors.textColor.withOpacity(0.80)),
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
                    "Price",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: appColors.textColor.withOpacity(0.80)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text("\$",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFCB7642))
                      ),
                      Text(" 4.20",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: appColors.textColor.withOpacity(0.80))
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
                      buttonName: "Buy Now",
                      buttonHeight: 50,
                      buttonBorderRadius: 12,
                      isBottomMarginRequired: false,
                      textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey.shade200),
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
      appBarHeight: 56,
      appBar: CommonAppBar(),
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
