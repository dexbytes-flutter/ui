import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'booking_cancellation_screen.dart';
import 'faq_screen.dart';

class BookingDetailCardViewScreen extends StatefulWidget {
  final bool? isBookMarked;
  final String? imageUrl;
  final String locationName;
  const BookingDetailCardViewScreen({
    Key? key,
    this.isBookMarked = false,
    this.imageUrl,
    required this.locationName
  }) : super(key: key);

  @override
  State<BookingDetailCardViewScreen> createState() => _BookingDetailCardViewScreenState();
}

class _BookingDetailCardViewScreenState extends State<BookingDetailCardViewScreen> {
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
                imageUrl: widget.imageUrl!,
                fit: BoxFit.cover,
                height: appDimens.heightFullScreen()/2,
                width: appDimens.widthFullScreen(),
              ),
            ),
          ),
          Positioned(
            bottom: 200,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(8).copyWith(left: 18,right: 18),
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
            bottom: 105,
            child: Text(widget.locationName,
              softWrap: true,
              textAlign: TextAlign.center,
              style: appStyles.commonTitleStyle(
                  fontSize: 35
              ),),
          ),
          Positioned(
            bottom: 80,
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
              bottom: 25,
              child: Text(appString.trans(context, appString.bookingDetailsText),
                style: appStyles.commonTitleStyle(fontSize: 15,
                    fontWeight: FontWeight.w600,texColor: appColors.buttonBgColor
                ),
              )
          ),
        /*  Positioned(
            top: 160,
            child: Text(widget.locationName,
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
              style: appStyles.commonTitleStyle(fontSize: 15,
              fontWeight: FontWeight.w600,texColor: appColors.buttonBgColor
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
          ),*/
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
              SlideRightRoute(widget: BookingCancellationScreen(
                imageUrl: widget.imageUrl!,
                locationName: widget.locationName,
              )),
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
              Row(
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
              Padding(
              padding: const EdgeInsets.only(top: 12),
              child: SizedBox(
                child: Divider(
                  color: appColors.appBgColor1.withOpacity(0.15),
                  height: 5,
                  thickness: 1,
                ),
              ),
            ),
              SizedBox(height: 12,),
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
                     height: 30,
                     thickness: 1,
                   ),
                 ),
               ],
             ),
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
                      height: 30,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
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
                      height: 30,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }

    return ContainerFirst(
        appBarHeight: 85,
        isOverLayStatusBar: true,
        isOverLayAppBar: true,
        isSingleChildScrollViewNeed: false,isFixedDeviceHeight: false,
        contextCurrentView: context,
        appBar: CommonAppBar(
          appBarRowMargin: EdgeInsets.only(top: 52,left: 20,right: 20),
          isHideRightIcon: false,
          isBookMarked: widget.isBookMarked,
        ),
        containChild: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            backgroundImageStackView(),
            SizedBox(height: 15,),
            bottomTitleRows(),
          ],
        ),
      bottomMenuView: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
          height: 120,
          child: Column(
            children: [
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
        ),
      ),
    );
  }
}
