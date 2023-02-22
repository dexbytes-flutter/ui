import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/model/common_detail_card.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar.dart';
import 'package:flutter/material.dart';

import '../all_file_import/app_values_files_link.dart';
import '../widgets/common_contact_detail_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  int? selectedIndex;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {

    // Screen title
    Widget screenTitle(){
      return Padding(
        padding: const EdgeInsets.only(top: 15,left: 20,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(appString.trans(context, appString.forgotPasswordTitleText),
                style: appStyles.sliderTextStyle()),
            SizedBox(height: 15,),
            Text(appString.trans(context, appString.selectContactDetailText),
                style: appStyles.commonSubTitleTextStyle(fontSize: 15)),
          ],
        ),
      );
    }

    //Contact detail widget
    Widget contactDetailView(){
      return ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: ClampingScrollPhysics(),
          itemCount: commonDetailCardList.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                setState(() {
                  this.selectedIndex = index;
                });
              },
              child: CommonContactDetailCard(
                cardMargin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                cardPadding: EdgeInsets.all(30),
                imageUrl: commonDetailCardList[index].icon,
                title: commonDetailCardList[index].title,
                subTitle: commonDetailCardList[index].subTitle,
                index: index,
                selectedIndex: selectedIndex,
              ),
            );
          }
      );
    }

    return ContainerFirst(
        appBarHeight: 56,
        isOverLayStatusBar: true,
        statusBarColor: Colors.white,
        isSingleChildScrollViewNeed: false,
        contextCurrentView: context,
        appBar: CommonAppBar(
          leftIconMargin: EdgeInsets.only(top: 22, left: 20),
          isHideRightIcon: true,
        ),
        containChild: Column(
          children: [
            screenTitle(),
            SizedBox(height: 30,),
            contactDetailView(),
          ],
        )
    );
  }
}
