import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'booking_cancellation_screen.dart';
import 'faq_screen.dart';

class BookingDetailCardViewScreen extends StatelessWidget {
  final bool isBookMarked;
  const BookingDetailCardViewScreen({
    Key? key,
    this.isBookMarked = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Background image in stack
    backgroundImageStackView(){
      return Stack(
        alignment: Alignment.center,
        children: [
          ShaderMask(
            shaderCallback: (bound) => LinearGradient(
              colors: [
                appColors.white,
                appColors.appTransColor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(bound),
            blendMode: BlendMode.dstIn,
            child: ClipRRect(
              child: CachedNetworkImage(
                imageUrl: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQQ9j9GWnKtl9xJjLvEPREdCFlkLjl2XKmMdQKOAnnyLmCO_Moo",
                fit: BoxFit.cover,
                height: appDimens.heightFullScreen()/1.8,
                width: appDimens.widthFullScreen(),
              ),
            ),
          ),
          Positioned(
            top: 110,
              child: Center(
                child: Container(
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
                ),
              )
          ),
          Positioned(
            top: 160,
            child: Text("Borobudur \nTemple",
            softWrap: true,
            textAlign: TextAlign.center,
            style: appStyles.commonTitleStyle(
              fontSize: 35
            ),),
          ),
          Positioned(
            top: 255,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: appColors.white),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CachedNetworkImage(
                      imageUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
                      fit: BoxFit.cover,
                      height: 12,
                      width: 12,
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Text("Magelang, Indonesia",
                style: appStyles.commonSubTitleTextStyle(fontSize: 11),
                )
              ],
            ),
          ),
          Positioned(
            top: 300,
              child: Text(appString.trans(context, appString.bookingDetailsText),
              style: appStyles.commonTitleStyle(fontSize: 18,
              fontWeight: FontWeight.w500,texColor: appColors.buttonBgColor
              ),
              )
          ),
          Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(appString.trans(context, appString.startDateText),
                  style: appStyles.commonTitleStyle( fontSize: 15,
                      fontWeight: FontWeight.w500, texColor: appColors.textColor),
                ),
                Text("July 21 2021",
                  style: appStyles.commonTitleStyle( fontSize: 15,
                      fontWeight: FontWeight.w500, texColor: appColors.white),),
              ],),
          ),
        ],
      );
    }

    // Bottom buttons
    bottomButtonRow(){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Container(
          width: 270,
          child: CommonButton(
            buttonName: appString.trans(context, appString.faqButtonText),
            buttonHeight: 50,
            buttonBorderRadius: 18,
            isBottomMarginRequired: false,
            textStyle: appStyles.buttonNameStyle(),
            backCallback: () {
              /*if (_validateFields(isButtonClicked: true)) {
                Navigator.push(
                  context,
                  SlideRightRoute(widget: DashBoardPage()),
                );
                // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                //   return OtpVerificationScreen(
                //     isSignUpScreen: this.isSignUpScreen,
                //   );
                // }), (route) => false);
              }*/
              Navigator.push(
                context,
                SlideRightRoute(widget: FaqScreen()),
              );
            },
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              SlideRightRoute(widget: BookingCancellationScreen()),
            );
          },
          child: Container(
            height: 50,
            width: 50,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: appColors.appBgColor2
            ),
            child: iconApps.iconImage(
                imageUrl: iconApps.deleteIcon,
              iconSize: Size(20, 20),
              imageColor: appColors.white
            ),
          ),
        )
      ],
      );
    }

      // Bottom title rows
      bottomTitleRows(){
        return Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children: [
              Column(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Text(appString.trans(context, appString.endDateText),
                       style: appStyles.commonTitleStyle( fontSize: 15,
                           fontWeight: FontWeight.w500, texColor: appColors.textColor),
                     ),
                     Text("July 25 2021",
                       style: appStyles.commonTitleStyle( fontSize: 15,
                           fontWeight: FontWeight.w500, texColor: appColors.white),)
                   ],),
                 SizedBox(
                   child: Divider(
                     color: appColors.appBgColor1.withOpacity(0.15),
                     height: 20,
                     thickness: 1,
                   ),
                 ),
               ],
             ),
              SizedBox(height: 10,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(appString.trans(context, appString.personText),
                        style: appStyles.commonTitleStyle( fontSize: 15,
                            fontWeight: FontWeight.w500, texColor: appColors.textColor),
                      ),
                      Text("3 Person",
                        style: appStyles.commonTitleStyle( fontSize: 15,
                            fontWeight: FontWeight.w500, texColor: appColors.white),)
                    ],),
                  SizedBox(
                    child: Divider(
                      color: appColors.appBgColor1.withOpacity(0.15),
                      height: 20,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(appString.trans(context, appString.typeText),
                        style: appStyles.commonTitleStyle( fontSize: 15,
                            fontWeight: FontWeight.w500, texColor: appColors.textColor),
                      ),
                      Text("Normal",
                        style: appStyles.commonTitleStyle( fontSize: 15,
                            fontWeight: FontWeight.w500, texColor: appColors.white),)
                    ],),
                  SizedBox(
                    child: Divider(
                      color: appColors.appBgColor1.withOpacity(0.15),
                      height: 20,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(appString.trans(context, appString.totalPriceText),
                    style: appStyles.commonTitleStyle( fontSize: 15,
                        fontWeight: FontWeight.w500, texColor: appColors.textColor),
                  ),
                  Text("\$ 360",
                    style: appStyles.commonTitleStyle( fontSize: 15,
                        fontWeight: FontWeight.w500, texColor: appColors.white),)
                ],),
              SizedBox(height: 25,),
              bottomButtonRow()
            ],
          ),
        );
      }

    return ContainerFirst(
        appBarHeight: 56,
        isOverLayStatusBar: true,
        isOverLayAppBar: true,
        isSingleChildScrollViewNeed: false,isFixedDeviceHeight: false,
        contextCurrentView: context,
        appBar: CommonAppBar(
          leftIconMargin: EdgeInsets.only(left: 20),
          isHideRightIcon: false,
          isShowTitle: false,
          appBarRowMargin: EdgeInsets.only(top: 20),
          isBookMarked: isBookMarked,
        ),
        containChild: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            backgroundImageStackView(),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20,right: 20),
              child: SizedBox(
                child: Divider(
                  color: appColors.appBgColor1.withOpacity(0.15),
                  height: 5,
                  thickness: 1,
                ),
              ),
            ),
            SizedBox(height: 15,),
            bottomTitleRows(),
          ],
        )
    );
  }
}
