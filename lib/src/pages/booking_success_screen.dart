import 'package:base_flutter_app/src/all_file_import/app_providers_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/pages/dashboard_screen.dart';
import 'package:base_flutter_app/src/pages/home_screen.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookingSuccessfulScreen extends StatefulWidget {
  final String? detailImageUrl;
  final String? placeFlag;
  final String? placeName;
  final String? placeSubTitle;
  final String? bookingDate;
  const BookingSuccessfulScreen({
    Key? key,
    this.detailImageUrl,
    this.placeFlag,
    this.placeName,
    this.placeSubTitle,
    this.bookingDate
  }) : super(key: key);

  @override
  State<BookingSuccessfulScreen> createState() => _BookingSuccessfulScreenState();
}

class _BookingSuccessfulScreenState extends State<BookingSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);

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
                  imageUrl: widget.detailImageUrl!,
                  fit: BoxFit.cover,
                  height: 130,
                  width: 130,
                ),
              ),
            ),
          ),
          SizedBox(height: 15,),
          Center(
            child: Text(widget.placeName!,
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
                        // imageUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
                        imageUrl: widget.placeFlag!,
                        fit: BoxFit.cover,
                        height: 12,
                        width: 12,
                      ),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Text(widget.placeSubTitle!,
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
              Text(widget.bookingDate!,
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
        isHideRightIcon: true,
        appBarRowMargin: EdgeInsets.only(top: 50,right: 20,left: 20),
      ),
      containChild: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Text(appString.trans(context, appString.bookingSuccessTitleText),
                textAlign: TextAlign.left,
                style: appStyles.commonTitleStyle(fontSize: 50,fontWeight: FontWeight.w900)),
            SizedBox(height: 15,),
            Text(appString.trans(context, appString.bookingSuccessSubTitleText),
                style: appStyles.commonSubTitleTextStyle(fontSize: 15)),
            SizedBox(height: 45,),
            centerView()
            // screenTitle()
          ],
        ),
      ),
      bottomMenuView: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: appDimens.widthFullScreen(),
          padding: EdgeInsets.only(bottom: 25,left: 20,right: 20),
          child: CommonButton(
            buttonName: appString.trans(context, appString.exploreHomeButtonText),
            buttonHeight: 50,
            buttonBorderRadius: 18,
            isBottomMarginRequired: false,
            textStyle: appStyles.buttonNameStyle(),
            backCallback: () {
              Navigator.push(
                  context,
                  SlideRightRoute(
                      widget: DashBoardPage()
                  )
              );
            },
          ),
        ),
      ),
    );
  }
}
