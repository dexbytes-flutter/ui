import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return ContainerFirst(
        appBarHeight: -1,
        isOverLayStatusBar: true,
        statusBarColor: Colors.white,
        isSingleChildScrollViewNeed: false,
        contextCurrentView: context,
        containChild: Column(
          children: [

          ],
        )
    );
  }
}
