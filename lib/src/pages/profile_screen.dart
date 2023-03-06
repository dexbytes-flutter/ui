import 'package:base_flutter_app/src/all_file_import/app_providers_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/widgets/appbar/home_screen_app_bar.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {


    return ContainerFirst(
        appBarHeight: -1,
        isOverLayStatusBar: false,
        isSingleChildScrollViewNeed: false,
        contextCurrentView: context,
        containChild: Column(
          children: [
            HomeScreenAppBar(
              margin: EdgeInsets.only(left: 20,right: 20,),
              isHideBackIcon: true,
            ),

          ],
        )
    );
  }
  void redirectTo(value) {
    if(value == "Profile Details"){

      Navigator.push(
        MainAppBloc.getDashboardContext,
        SlideRightRoute(
            widget: HomeScreen()),
      );

    } else if(value == "Settings"){

      /*Navigator.push(
        MainAppBloc.getDashboardContext,
        SlideRightRoute(
            widget: SettingScreen()),
      );*/
    }else if(value == "Orders"){

     /* Navigator.push(
        MainAppBloc.getDashboardContext,
        SlideRightRoute(
            widget: MyOrderScreen()),
      );*/
    }else if(value == "Coupons"){

      /*Navigator.push(
        MainAppBloc.getDashboardContext,
        SlideRightRoute(
            widget: CouponsScreen()),
      );*/
    }else if(value == "FAQs"){

     /* Navigator.push(
        MainAppBloc.getDashboardContext,
        SlideRightRoute(
            widget: FaqScreen()),
      );*/
    }else if(value == "About Us"){

      /*Navigator.push(
        MainAppBloc.getDashboardContext,
        SlideRightRoute(
            widget: AboutUs()),
      );*/
    }else if(value == "Address"){

      // Navigator.push(
      //   MainAppBloc.getDashboardContext,
      //   SlideRightRoute(
      //       widget: ShippingAddressScreen(appBarTitle: "Addresses",)),
      // );
    }

  }
}
