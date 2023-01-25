import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/appbar/home_appbar.dart';
import 'package:base_flutter_app/src/widgets/basic_view_container/container_first.dart';
import 'package:base_flutter_app/src/widgets/coffee_size_widget.dart';
import 'package:base_flutter_app/src/widgets/common_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import 'appbar/common_app_bar.dart';

class CoffeeDetailCard extends StatelessWidget {
  const CoffeeDetailCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);

    // Top image widget
    Widget topImageView() {
      return Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: CachedNetworkImage(
              imageUrl:
                  "https://i.pinimg.com/564x/de/da/46/deda46ce8ddc97f7a152d0871b94c649.jpg",
              height: 280,
              width: 400,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: appDimens.heightFullScreen() / 5,
              width: appDimens.heightFullScreen() / 1.78,
              decoration: BoxDecoration(
                color: Colors.white12.withOpacity(0.40),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 12),
                        child: Text(
                          "Cappuccino",
                          style: TextStyle(
                              color: appColors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Text(
                          "With Oat Milk",
                          style: TextStyle(
                              color: Colors.white,
                              // color: Colors.grey.shade500,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20, top: 15),
                            child: iconApps.iconImage(
                              imageUrl: iconApps.startIcon,
                              iconSize: Size(22, 22),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 18, left: 15),
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "4.5",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500)),
                                WidgetSpan(
                                    child: SizedBox(
                                  width: 5,
                                )),
                                TextSpan(
                                    text: "(6.986)",
                                    style: TextStyle(
                                        color: Colors.white,
                                        // color: Colors.grey.shade500,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14))
                              ]),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
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
                                    height: 3,
                                  ),
                                  Text(
                                    "Coffee",
                                    style:
                                        TextStyle(color: Colors.grey.shade500),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 15, right: 15, top: 8, bottom: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: appColors.appThemeColor1),
                              child: Column(
                                children: [
                                  iconApps.iconImage(
                                      imageUrl: iconApps.milkDropIcon,
                                      iconSize: Size(20, 20),
                                      imageColor: Color(0xFFCB7642)),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    "Milk",
                                    style:
                                        TextStyle(color: Colors.grey.shade500),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: appColors.appThemeColor1),
                        child: Text(
                          "Medium Roasted",
                          style: TextStyle(color: Colors.grey.shade500),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
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
            padding: const EdgeInsets.only(top: 25, left: 15),
            child: Text(
              "Description",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: appColors.textColor.withOpacity(0.80)),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: ReadMoreText(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              trimLines: 3,
              preDataTextStyle: TextStyle(fontWeight: FontWeight.w500),
              style: TextStyle(color: Colors.black),
              colorClickableText: Color(0xFFCB7642),
              trimMode: TrimMode.Line,
              trimCollapsedText: '...Read More',
              trimExpandedText: ' show less',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 15),
            child: Text(
              "Size",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: appColors.textColor.withOpacity(0.80)),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: SizeChoice()),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 15),
            child: Text(
              "Price",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: appColors.textColor.withOpacity(0.80)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "\$",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFCB7642))),
                  TextSpan(
                      text: " 4.20",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: appColors.textColor.withOpacity(0.80)))
                ])),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 100,
                    ),
                    child: CommonButton(
                      buttonColor: Color(0xFF54321E),
                      buttonName: "Buy Now",
                      buttonHeight: 50,
                      buttonBorderRadius: 12,
                      isBottomMarginRequired: false,
                      textStyle: TextStyle(
                          fontSize: 14,
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
                  ),
                )
              ],
            ),
          )
        ],
      );
    }

    return ContainerFirst(
      contextCurrentView: context,
      isSingleChildScrollViewNeed: true,
      isFixedDeviceHeight: true,
      isOverLayAppBar: true,
      isOverLayStatusBar: true,
      statusBarColor: appColors.appBgColor1.withOpacity(0.15),
      appBarHeight: 65,
      appBar: CommonAppBar(),
      containChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          topImageView(),
          bottomView(),
        ],
      ),
    );
  }
}
