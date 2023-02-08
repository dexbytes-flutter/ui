import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar_new.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return ContainerFirst(
      contextCurrentView: context,
      appBarHeight: 56,
      appBar: CommonAppBarNew(
        isHideRightICon: true,
        title: appString.trans(context, appString.notificationAppBarTitle),
      ),
      containChild: Center(
        child: Text("Notification screen"),),
    );
  }
}
