import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/bloc/main_app_bloc/main_app_bloc.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/pages/favorites_screen.dart';
import 'package:base_flutter_app/src/pages/home_screen.dart';
import 'package:base_flutter_app/src/pages/notification_screen.dart';
import 'package:base_flutter_app/src/pages/bag_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

final Map<TabItemBottomNavigatorWithStack, Widget> menuScreens = {
  TabItemBottomNavigatorWithStack.menu1: HomeScreen(),
  TabItemBottomNavigatorWithStack.menu2: Container(child: Center(child: Text("Message")),),
  TabItemBottomNavigatorWithStack.menu3: Container(child: Center(child: Text("Search")),),
  TabItemBottomNavigatorWithStack.menu4: Container(child: Center(child: Text("Cart")),),
  TabItemBottomNavigatorWithStack.menu5: Container(child: Center(child: Text("Profile")),),
};

enum TabItemBottomNavigatorWithStack { menu1, menu2, menu3, menu4, menu5 }

/// This is the stateful widget that the main application instantiates.
class BottomNavigatorWithStack extends StatefulWidget {
  final TabItemBottomNavigatorWithStack? currentTab;
  final ValueChanged<TapedItemModel>? onSelectTab;

  final List<Widget>? widgetOptions;
  final double menuHeight;
  const BottomNavigatorWithStack(
      {Key? key,
        this.currentTab,
        this.onSelectTab,
        this.menuHeight = 56,
        this.widgetOptions,})
      : super(key: key);

  @override
  State<BottomNavigatorWithStack> createState() =>
      _BottomNavigatorWithStackState(
          currentTab: this.currentTab, onSelectTab: this.onSelectTab);
}

/// This is the private State class that goes with BottomNavigatorWithStack.
class _BottomNavigatorWithStackState extends State<BottomNavigatorWithStack> {
  TabItemBottomNavigatorWithStack? currentTab;
  ValueChanged<TapedItemModel>? onSelectTab;
  int selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  double menuHeight = 56;
  double fontSize = 18;
  Map<String, dynamic> homeBottomNavigationBar =
  MainAppBloc.configTheme.containsKey("homeBottomNavigationBar")
      ? MainAppBloc.configTheme["homeBottomNavigationBar"]
      : {};
  Map<String, dynamic> setting = MainAppBloc.configTheme.containsKey("setting")
      ? MainAppBloc.configTheme["setting"]
      : {};

  // Color backgroundColor = Colors.white;
  Color backgroundColor = Colors.brown;
  Color activeIconColor = Colors.white;
  // Color deActiveIconColor = Colors.blueGrey.withOpacity(0.25);
  Color deActiveIconColor = Colors.white;
  TextStyle activeMenuTextStyle = TextStyle(fontSize: 0, color: Colors.white);
  TextStyle deActiveMenuTextStyle =
  TextStyle(fontSize: 0, color: Colors.blueGrey.withOpacity(0.25));
  double elevation = 0;
  int bottomMenuType = 0;

  List<BottomNavigationBarItem> menuItem = <BottomNavigationBarItem>[];
  List<dynamic> menuItemTemp = [];

/*  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    String menuPageId = menuItemTemp[selectedIndex]["menuPageId"];
    widget.onItemTapped?.call(selectedIndex, menuPageId);
  }*/

  _BottomNavigatorWithStackState({this.onSelectTab, this.currentTab}) {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    //Set values from jason file
    backgroundColor = homeBottomNavigationBar.containsKey("backgroundColor")
        ?  Color(int.parse(homeBottomNavigationBar["backgroundColor"]))
        : backgroundColor;
    activeIconColor = homeBottomNavigationBar.containsKey("activeIconColor")
        ? Color(int.parse(homeBottomNavigationBar["activeIconColor"]))
        : activeIconColor;
    deActiveIconColor = homeBottomNavigationBar.containsKey("deActiveIconColor")
        ? Color(int.parse(homeBottomNavigationBar["deActiveIconColor"]))
        : deActiveIconColor;
    if (homeBottomNavigationBar.containsKey("deActiveMenuTextStyle")) {
      deActiveMenuTextStyle.copyWith(
          color: Color(int.parse(
              homeBottomNavigationBar["deActiveMenuTextStyle"]["color"])),
          fontSize: homeBottomNavigationBar["deActiveMenuTextStyle"]["fontSize"]
              .toDouble());
    }
    if (homeBottomNavigationBar.containsKey("activeMenuTextStyle")) {
      activeMenuTextStyle.copyWith(
          color:
          Color(int.parse(
              homeBottomNavigationBar["activeMenuTextStyle"]["color"])),
          fontSize: homeBottomNavigationBar["activeMenuTextStyle"]["fontSize"]
              .toDouble());
    }

    if (homeBottomNavigationBar.containsKey("elevation")) {
      elevation = homeBottomNavigationBar["elevation"];
    }
    if (homeBottomNavigationBar.containsKey("bottomMenuType")) {
      bottomMenuType = homeBottomNavigationBar["bottomMenuType"];
    }

    if (homeBottomNavigationBar.containsKey("menuHeight")) {
      menuHeight = homeBottomNavigationBar["menuHeight"];
    }

    if (menuHeight < 56) {
      menuHeight = 56;
    }

    updateMenuItem();
  }
  @override
  void didUpdateWidget(covariant BottomNavigatorWithStack oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (widget.currentTab != null) {
      setState(() {
        currentTab = widget.currentTab;
        updateMenuItem();
      });
    }
  }


  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    String menuPageId = menuItemTemp[selectedIndex]["menuPageId"];
    String statusBarColor = menuItemTemp[selectedIndex]["statusBarColors"];
    widget.onSelectTab?.call(TapedItemModel(
        tabItemBottomNavigatorWithStack: getMenuId(menuPageId),
        statusBarColor: statusBarColor));
    // widget.onItemTapped?.call(selectedIndex, menuPageId);
  }

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return IntrinsicHeight(
      child: Material(
        elevation: 0,
        color:!isDarkMode?appColors.bottomMenuColor1:appColors.indicatorColor,
        child: Container(
          color:!isDarkMode?appColors.bottomMenuColor1:appColors.indicatorColor,
          child: BottomNavigationBar(
            items: menuItem,
            elevation: elevation,
            type: bottomMenuType == 0
                ? BottomNavigationBarType.fixed
                : BottomNavigationBarType.fixed,
            backgroundColor: Color(0xFF482A17),
            // fixedColor: backgroundColor,
            currentIndex: selectedIndex,
            selectedIconTheme: IconThemeData(color: backgroundColor),
            // selectedItemColor: !isDarkMode? Color(0xFF54321E):Colors.white, /*activeIconColor*/
            selectedItemColor: Color(0xFF54321E), /*activeIconColor*/
            unselectedItemColor: deActiveIconColor,
            selectedLabelStyle: activeMenuTextStyle,
            unselectedLabelStyle: deActiveMenuTextStyle,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }


  TabItemBottomNavigatorWithStack getMenuId(String menuIdStr) {
    TabItemBottomNavigatorWithStack? tapedItem;
    switch (menuIdStr) {
      case "menu1":
        tapedItem = TabItemBottomNavigatorWithStack.menu1;
        break;
      case "menu2":
        tapedItem = TabItemBottomNavigatorWithStack.menu2;
        break;
      case "menu3":
        tapedItem = TabItemBottomNavigatorWithStack.menu3;
        break;
      case "menu4":
        tapedItem = TabItemBottomNavigatorWithStack.menu4;
        break;
      case "menu5":
        tapedItem = TabItemBottomNavigatorWithStack.menu5;
        break;
    }
    return tapedItem!;
  }

  void updateMenuItem() {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    if (homeBottomNavigationBar.containsKey("menu_item")) {
      menuItemTemp = homeBottomNavigationBar["menu_item"];
      menuItem = [];
      int index = 0;
      menuItemTemp.map((values) {
        menuItem.add(BottomNavigationBarItem(
          activeIcon: Container(
            margin:  EdgeInsets.only(top: 8),
            child:   iconApps.iconImage(imageUrl: values["activeIcon"],
                iconSize: index == 2? Size(18,22):Size(24,22),
                imageColor: !isDarkMode?Color(0xFFCB7642):Color(0xFFFFFFFF)),
          ),
          icon: Container(
              margin: EdgeInsets.only(top: 8),
              child: iconApps.iconImage(imageUrl: values["deActiveIcon"],
                  iconSize: index == 2? Size(18,22):Size(24,22),
                  imageColor: Color(0xFFFFFFFF)   )),
          label:values["label"],
        ));
        index++;
      }).toList();
    }
  }
}

class TapedItemModel {
  final TabItemBottomNavigatorWithStack tabItemBottomNavigatorWithStack;
  final String? statusBarColor;
  TapedItemModel(
      {required this.tabItemBottomNavigatorWithStack, this.statusBarColor});
}

//App Navigator
class AppNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class AppNavigator extends StatelessWidget {
  AppNavigator({this.navigatorKey, this.tabItem,this.item});
  final GlobalKey<NavigatorState>? navigatorKey;
  final TabItemBottomNavigatorWithStack? tabItem;
  final dynamic? item;

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {dynamic item}) {
    return {
      AppNavigatorRoutes.root: (context) => _buildRootWidget(context),
      AppNavigatorRoutes.detail: (context) => _buildDetailWidget(context, item)
    };
  }

  Widget _buildRootWidget(BuildContext context) {
    if (tabItem == TabItemBottomNavigatorWithStack.menu1) {
      return new HomeScreen();
    } else if (tabItem == TabItemBottomNavigatorWithStack.menu2) {
      return OrderScreen();
    } else if (tabItem == TabItemBottomNavigatorWithStack.menu3) {
      return FavoritesScreen();
    } else if (tabItem == TabItemBottomNavigatorWithStack.menu4) {
      return NotificationScreen();
    } else {
      return HomeScreen();
    }
  }

  Widget _buildDetailWidget(BuildContext context, dynamic item) {
    // if (item is StringFlixVideoExpandItem) {
    //   return new ExpandVideoScreen(item);
    // }
    if (tabItem == TabItemBottomNavigatorWithStack.menu1) {
      return new HomeScreen();
    } else if (tabItem == TabItemBottomNavigatorWithStack.menu2) {
      return OrderScreen();
    } else if (tabItem == TabItemBottomNavigatorWithStack.menu3) {
      return FavoritesScreen();
    } else if (tabItem == TabItemBottomNavigatorWithStack.menu4) {
      return NotificationScreen();
    } else {
      return HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context,item: this.item);

    return Navigator(
      key: navigatorKey,
      initialRoute: AppNavigatorRoutes.detail,
      onGenerateRoute: (routeSettings) {
        return CupertinoPageRoute(
          builder: (context) => routeBuilders[routeSettings.name]!(context),
        );
      },
    );
  }
}




class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    Paint paint = new Paint()
      ..color = !isDarkMode? appColors.whiteCard.withOpacity(0.95):appColors.appBgColor3//AppColors().appBgColor3
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 0); // Start
    path.quadraticBezierTo(size.width * 0.9, 5.7, size.width * 0.339, 2.1);
    path.quadraticBezierTo(size.width * 0.390 ,6, size.width * 0.40, 15);
    path.arcToPoint(Offset(size.width * 0.60, 16), radius: Radius.elliptical(44,44), clockwise: false);
    path.quadraticBezierTo(size.width * 0.63, 0, size.width *0.71, 0);
    path.quadraticBezierTo(size.width * 0.0, 0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    canvas.drawShadow(path, Colors.transparent, 5, true);
    canvas.drawPath(path, paint);
  }

  // void paint(Canvas canvas, Size size) {
  //   Paint paint = new Paint()
  //     ..color = AppColors().appBgColor3
  //     ..style = PaintingStyle.fill;
  //
  //   Path path = Path();
  //   path.moveTo(0,10); // Start
  //   path.quadraticBezierTo(size.width * 0.0, 0, size.width * 0.0, 0);
  //   path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.39, 4);
  //   path.arcToPoint(Offset(size.width * 0.61, 5), radius: Radius.circular(30.0), clockwise: false);
  //   path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.80, 0);
  //   path.quadraticBezierTo(size.width * 0.80, 0, size.width, 0);
  //   path.lineTo(size.width, size.height);
  //   path.lineTo(0, size.height);
  //   path.lineTo(0, 20);
  //   canvas.drawShadow(path, Colors.transparent, 5, true);
  //   canvas.drawPath(path, paint);
  // }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}