import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar.dart';
import 'package:base_flutter_app/src/widgets/tab_bar_view_common.dart';
import 'package:flutter/material.dart';

import '../model/my_orders_card_model.dart';
import 'appbar/appbar_with_left_icon_title.dart';

class MyOrdersProfileTile extends StatefulWidget {
  const MyOrdersProfileTile({Key? key}) : super(key: key);

  @override
  State<MyOrdersProfileTile> createState() => _MyOrdersProfileTileState();
}

class _MyOrdersProfileTileState extends State<MyOrdersProfileTile> with TickerProviderStateMixin{

  TabController? tabController;
  int selectedTab = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(initialIndex: selectedTab, length: 2, vsync: this);
    tabController = TabController(initialIndex: selectedTab, length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    //Tab bar
    Widget tabBarView(){
      return TabBar(
        onTap: (index){
          setState(() {
            this.selectedTab = index;
          });
        },
        controller: tabController,
        tabs: [
          Tab(
            child: Align(
              alignment: Alignment.center,
              child: Text("Actual", textAlign: TextAlign.center,
              ),
            ),
          ),
          Tab(
            child: Align(
              alignment: Alignment.center,
              child: Text("Past"),
            ),),
        ],
        labelColor: appColors.white,
        unselectedLabelColor: Colors.black,
        // labelStyle: appStyles.tabTextStyle(),
        labelPadding: EdgeInsets.zero,
        // unselectedLabelStyle: appStyles.tabTextStyle(),
        indicatorSize: TabBarIndicatorSize.label,
        indicator: BoxDecoration(
          color: appColors.appButtonColor,
          borderRadius: BorderRadius.circular(12),
        ),
      );
    }

    // card view
    Widget actualTabCard(){
      return ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 20,bottom: 140),
        itemCount: actualOrderList.length,
        itemBuilder: (contex, index){
          return ActualOrder(
            selectedIndex: selectedTab,
          );
        },

      );
    }

    return ContainerFirst(
        contextCurrentView: context,
        appBarHeight: 48,
        isSingleChildScrollViewNeed: false,
        appBar: CommonAppBarWithLeftIconTitle(
          title: "My orders",
        ),
        containChild: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: appColors.textFiledColor.withOpacity(0.20),
              ),
              child: SizedBox(
                height: 45,
                child: tabBarView(),
              ),
            ),
            SizedBox(
              height:appDimens.heightFullScreen(),
              child: DefaultTabController(
                length: 2,
                initialIndex: selectedTab,
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: [
                    actualTabCard(),
                    actualTabCard()
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}
