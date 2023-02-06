import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:flutter/material.dart';

class ListTileMyOrder extends StatefulWidget {
  const ListTileMyOrder({Key? key}) : super(key: key);

  @override
  State<ListTileMyOrder> createState() => _ListTileMyOrderState();
}

class _ListTileMyOrderState extends State<ListTileMyOrder> {
  @override
  Widget build(BuildContext context) {

    // Tab bar
    Widget tabBar(){
      return Container();
    }

    return ContainerFirst(
        contextCurrentView: context,
        containChild: Column(
          children: [

          ],
        )
    );
  }
}
