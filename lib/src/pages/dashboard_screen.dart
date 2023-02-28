
import 'package:base_flutter_app/src/widgets/bottom_navigation_bar/bottom_navigation_bar_with_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../all_file_import/app_providers_files_link.dart';
import '../all_file_import/app_utils_files_link.dart';
import '../all_file_import/app_values_files_link.dart';
import '../all_file_import/app_widget_files_link.dart';

class DashBoardPage extends StatefulWidget {

  const DashBoardPage({Key? key}) : super(key: key);
  @override
  _DashBoardPage createState() => _DashBoardPage();
}


class _DashBoardPage extends State<DashBoardPage>
    with TickerProviderStateMixin {
  _DashBoardPage();

  Color statusBarColors = Color(0xff212327);
  // GlobalKey<ScaffoldState>? scaffoldKey;

  GlobalKey<ScaffoldState> globalScaffoldKey = GlobalKey();
  double bottomMenuHeight = 56;
  //Current index
  TabItemBottomNavigatorWithStack _currentTab =
      TabItemBottomNavigatorWithStack.menu1;

  //Get selected menu
  Widget buildOffstageNavigator(TabItemBottomNavigatorWithStack tabItem,{item}) {
    return Offstage(
        offstage: _currentTab != tabItem,
        child: AppNavigator(
          navigatorKey: _navigatorKeys[tabItem]!,
          tabItem: tabItem,item: item,));
  }

  //Add Menu navigation key according to added menu
  Map<TabItemBottomNavigatorWithStack, GlobalKey<NavigatorState>>
  _navigatorKeys = {
    TabItemBottomNavigatorWithStack.menu1: GlobalKey<NavigatorState>(),
    TabItemBottomNavigatorWithStack.menu2: GlobalKey<NavigatorState>(),
    TabItemBottomNavigatorWithStack.menu3: GlobalKey<NavigatorState>(),
    TabItemBottomNavigatorWithStack.menu4: GlobalKey<NavigatorState>(),
    TabItemBottomNavigatorWithStack.menu5: GlobalKey<NavigatorState>(),
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    appDimens.appDimensFind(context: context);


    MainAppBloc.dashboardContext = context;

    //Selected bottom menu index
    void _selectTab(TapedItemModel capedItemModel) {
      TabItemBottomNavigatorWithStack tabItem = capedItemModel.tabItemBottomNavigatorWithStack;
      try {
        statusBarColors = Color(int.parse(capedItemModel.statusBarColor!));
      } catch (e) {
        print(e);
      }
      if (tabItem == _currentTab) {
        // pop to first route
        _navigatorKeys[tabItem]!
            .currentState!
            .popUntil((route) => route.isFirst);
      } else {
        setState(() => _currentTab = tabItem);
      }
    }

    //Return main Ui view
    return WillPopScope(
      onWillPop: null, //_onBackPressed,
      child: BlocBuilder<MainAppBloc, MainAppState>(
        // ignore: non_constant_identifier_names
          builder: (_, mainAppState) {
            int selectedMenuIndex = 0;
            Color statusBarColorsLocal = statusBarColors;

            if (mainAppState is HomeBottomNavigationBarTapedState) {
              selectedMenuIndex = mainAppState.tapedBottomBarIndex;
              statusBarColorsLocal = mainAppState.statusBarColor != null
                  ? projectUtil.colorFromIntString(
                  stringColor: mainAppState.statusBarColor!)
                  : statusBarColors;
            }
            return ContainerDashboard(
              // globalScaffoldKey: globalScaffoldKey ,
              // appBackgroundColor: Colors.red,
                contextCurrentView: context,
                isOverLayStatusBar: true,
                statusBarColor: statusBarColorsLocal,
                appBackgroundColor:!isDarkMode? appColors.white:appColors.appBgColor6,
                appBarHeight: -1,
                bottomMenuHeight: 60,
                bottomMenuView: BottomNavigatorWithStack(
                  currentTab: _currentTab,
                  onSelectTab: _selectTab,
                ),
                appBar: Container(
                  color: statusBarColorsLocal,
                ),
                containChild: BlocBuilder<MainAppBloc, MainAppState>(
                  // ignore: non_constant_identifier_names
                    builder: (_, mainAppState) {
                      String selectedMenuPageId = "";
                      if (mainAppState is HomeBottomNavigationBarTapedState) {
                        selectedMenuPageId = mainAppState.tapedBottomBarPageId;
                        selectedMenuIndex = mainAppState.tapedBottomBarIndex;
                      }
                      return Stack(children: <Widget>[
                        buildOffstageNavigator(TabItemBottomNavigatorWithStack.menu1,item: (){
                          globalScaffoldKey.currentState?.openDrawer();
                        }),
                        buildOffstageNavigator(TabItemBottomNavigatorWithStack.menu2),
                        buildOffstageNavigator(TabItemBottomNavigatorWithStack.menu3),
                        buildOffstageNavigator(TabItemBottomNavigatorWithStack.menu4),
                        buildOffstageNavigator(TabItemBottomNavigatorWithStack.menu5),
                      ]);
                    }));

          }),
    );
  }
}