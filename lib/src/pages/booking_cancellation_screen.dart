import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar/common_app_bar.dart';
import 'book_list_tile_screen.dart';

class BookingCancellationScreen extends StatefulWidget {
  final String imageUrl;
  final String locationName;

  const BookingCancellationScreen({
    Key? key,
    required this.imageUrl,
    required this.locationName
  }) : super(key: key);

  @override
  State<BookingCancellationScreen> createState() => _BookingCancellationScreenState();
}

class _BookingCancellationScreenState extends State<BookingCancellationScreen> {
  @override
  Widget build(BuildContext context) {

    // Center view
    Widget centerView(){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2.5,color: appColors.appBgColor1
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
                  // imageUrl: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQQ9j9GWnKtl9xJjLvEPREdCFlkLjl2XKmMdQKOAnnyLmCO_Moo",
                  imageUrl: widget.imageUrl,
                  fit: BoxFit.cover,
                  height: 130,
                  width: 130,
                ),
              ),
            ),
          ),
          SizedBox(height: 15,),
          Center(
            child: Text(widget.locationName,
              textAlign: TextAlign.center,
              style: appStyles.commonTitleStyle(fontSize: 25),
            ),
          ),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
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
                  SizedBox(width: 5,),
                  Text("Indonesia",
                    style: appStyles.commonSubTitleTextStyle(fontSize: 11,fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Container(
                height: 30,
                margin: EdgeInsets.only(left: 10,right: 10),
                child: VerticalDivider(
                  width: 0,
                  thickness: 1,
                  endIndent: 4,
                  indent: 5,
                  color: Colors.grey.shade600,
                ),
              ),
              iconApps.iconImage(
                  imageUrl: iconApps.calendarIcon,
                  imageColor: appColors.white,
                  iconSize: Size(12, 15)
              ),
              SizedBox(width: 5,),
              Text("July 21 2023",
              style: appStyles.commonSubTitleTextStyle(fontSize: 11,fontWeight: FontWeight.w600),
              )
            ],
          ),
        ],
      );
    }

    return ContainerFirst(
        appBarHeight: 85,
        isOverLayStatusBar: true,
        isSingleChildScrollViewNeed: false,
        contextCurrentView: context,
        appBar: CommonAppBar(
          appBarRowMargin: EdgeInsets.only(top: 50,left: 20, right: 20),
          isHideRightIcon: true,
        ),
        containChild: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Text(appString.trans(context, appString.bookingCancellationText),
                  textAlign: TextAlign.left,
                  style: appStyles.commonTitleStyle(fontSize: 38)),
              SizedBox(height: 15,),
              Text(appString.trans(context, appString.bookingCancellationSubTitleText),
                  style: appStyles.commonSubTitleTextStyle(fontSize: 15)),
              SizedBox(height: appDimens.heightFullScreen()/6.5,),
              centerView()
            ],
          ),
        ),
      bottomMenuView: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: appDimens.widthFullScreen(),
          padding: EdgeInsets.only(bottom: 25,left: 20,right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50,
                  width: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: appColors.appBgColor2
                  ),
                  child: Center(
                    child: Text(
                      appString.trans(context, appString.closeButtonText),
                      style: appStyles.commonTitleStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              Container(
                width: 160,
                child: CommonButton(
                  buttonName: appString.trans(context, appString.cancelBookingButtonText),
                  buttonHeight: 50,
                  buttonBorderRadius: 18,
                  isBottomMarginRequired: false,
                  textStyle: appStyles.buttonNameStyle(),
                  backCallback: () {
                    Navigator.push(
                      context,
                      SlideRightRoute(
                          widget: BookListTileScreen()
                      ),
                    );
                    /*if (_validateFields(isButtonClicked: true)) {
                      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                      //   return OtpVerificationScreen(
                      //     isSignUpScreen: this.isSignUpScreen,
                      //   );
                      // }), (route) => false);
                    }*/
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
