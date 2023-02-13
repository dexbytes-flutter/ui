import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar_new.dart';
import 'package:base_flutter_app/src/widgets/common_expansion_tile_widget.dart';
import 'package:base_flutter_app/src/widgets/title_text.dart';
import 'package:flutter/material.dart';

import '../model/notification_model.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  int selectedIndex = -1;
  int selectedIndex2 = -1;//dont set it to 0
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {

    // Expansible message container
    Widget expansibleMessageContainer(){
      return ListView.builder(
        key: Key('builder ${selectedIndex.toString()}'),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: ClampingScrollPhysics(),
        itemCount: notificationInfoList.length,
        itemBuilder: (context,index){
          String title = notificationInfoList[index].title ?? "";
          String notificationTime = notificationInfoList[index].notificationTime ?? "";
          String descriptions = notificationInfoList[index].descriptions ?? "";
          bool selected = selectedIndex == index;

          return Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 15,right: 15,top: 15),
              decoration: selected? BoxDecoration(
                  color: appColors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: Colors.grey.shade500.withOpacity(0.20),
                      width: 2
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 5,
                      spreadRadius: 8,
                      offset: Offset(0.0,3),
                    )
                  ]
              ):
              BoxDecoration(
                color: appColors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: Colors.grey.shade500.withOpacity(0.20),
                    width: 2
                ),
              ),
              child: FaqExpansionTileWidget(
                margin: EdgeInsets.only(top: 15,),
                key: Key(index.toString()), //attention
                initiallyExpanded : index == selectedIndex, //attenti
                // onCardClickCallBack: ((newState) {
                //   if (newState)
                //     setState(() {
                //       Duration(seconds: 20000);
                //       selected = index;
                //     });
                //   else
                //     setState(() {
                //       selected = -1;
                //     });
                // }),// on
                onCardClickCallBack: (z){
                  setState(() {
                    selectedIndex = z?index:-1;
                  });
                },
                title: title,
                subTitle: selected? "": notificationTime,
                subTitleTextStyle: appStyles.commonCardTitleTextStyle(
                    fontSize: 15,texColor: appColors.textColor.withOpacity(0.40)),
                titleTextStyle: appStyles.commonCardTitleTextStyle(
                  texColor: appColors.textNormalColor1.withOpacity(0.65),
                ),
                trailingIcon: descriptions.isEmpty || selected
                    ? Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: iconApps.iconImage(imageUrl: iconApps.downArrowIcon,
                      iconSize: Size(25, 25),imageColor: appColors.appButtonBgColor),
                )
                    : iconApps.iconImage(imageUrl: iconApps.rightArrow1,
                    iconSize: Size(25, 25),imageColor: appColors.appButtonBgColor
                ),
                /*:
                selected?iconApps.iconImage(imageUrl: iconApps.downArrowIcon,
                    iconSize: Size(25, 25),imageColor: appColors.appButtonBgColor
                ):iconApps.iconImage(imageUrl: iconApps.rightArrow1,
                    iconSize: Size(25, 25),imageColor: appColors.appButtonBgColor
                ),*/
                children: [
                  Container(
                    padding: EdgeInsets.all(15).copyWith(top: 0,bottom: 15),
                    color: Colors.transparent,
                    child: Text(descriptions,
                      style: appStyles.aboutTitleTextStyle(texColor: appColors.textColor.withOpacity(0.40),fontSize: 15,fontWeight: FontWeight.w500),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  descriptions.isNotEmpty? Container(
                    padding: EdgeInsets.all(15).copyWith(top: 10,bottom: 15),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(notificationTime,
                          style: appStyles.commonCardTitleTextStyle(
                              fontSize: 14,texColor: appColors.textColor.withOpacity(0.40)
                          ),
                        )),
                  ):Text("")
                ],
              )
            /*Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("You have an order for Lespresso \ncoffee.",
                      style: appStyles.commonCardTitleTextStyle(
                        texColor: appColors.textNormalColor1.withOpacity(0.70),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("3 hours ago",
                      style: appStyles.commonCardSubTitleTextStyle(
                          texColor: appColors.textColor.withOpacity(0.50)
                      ),
                    )
                  ],
                ),
                InkWell(
                  onTap: (){

                  },
                  child: iconApps.iconImage(
                      imageUrl: iconApps.rightArrow1,
                      iconSize: Size(30, 30),
                      imageColor: appColors.appButtonBgColor.withOpacity(0.30)
                  ),
                )
              ],
            ),*/
          );
        },

      );
    }

    return ContainerFirst(
        contextCurrentView: context,
        appBarHeight: 56,
        appBar: CommonAppBarNew(
          isHideRightICon: true,
          isHideLeftIcon: true,
          title: appString.trans(context, appString.notificationAppBarTitle),
        ),
        containChild: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText(
              text: "Today",
              textStyle: appStyles.homeMenuTopTitleTextStyle(),
              margin: EdgeInsets.only(left: 15,right: 15),
            ),
            expansibleMessageContainer(),
            SizedBox(height: 15,),
            TitleText(
              text: "Yesterday",
              textStyle: appStyles.homeMenuTopTitleTextStyle(),
              margin: EdgeInsets.only(left: 15,right: 15),
            ),
          ],
        )
    );
  }

  void expandOrShrinkDrawer(){
    setState(() {
      isExpanded = !isExpanded;
    });
  }
}
