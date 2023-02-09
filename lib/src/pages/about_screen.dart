import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_left_icon_title.dart';
import 'package:base_flutter_app/src/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../all_file_import/app_providers_files_link.dart';
import '../model/about_us_data_model.dart';
import '../widgets/appbar/common_app_bar_new.dart';
import '../widgets/common_expansion_tile_widget.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({ Key ?key,
  }) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {


  int selectedIndex = -1;
  int selectedIndex2 = -1;//dont set it to 0

  bool isExpanded = false;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ContainerFirst(
      contextCurrentView: context,
      isSingleChildScrollViewNeed: true,
      isFixedDeviceHeight: true,
      reverse: false,
      appBarHeight: 56,
      appBar: CommonAppBarNew(
        isHideRightICon: true,
        title: appString.trans(context, appString.aboutUsAppBarTitle),
      ),
      containChild: Container(
        child: Stack(
          children: [
            Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  blackIconTiles(),
                ]
            ),
          ],
        ),
      ),
    );
  }


  Widget blackIconTiles(){
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 0.0),
              child: ListView.builder(
                key: Key('builder ${selectedIndex.toString()}'),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                  itemCount: drawerlist.length,
                itemBuilder: (context, int index) {
                  String title = drawerlist[index].title ?? "";
                  String descriptions = drawerlist[index].descriptions ?? "";
                  bool selected = selectedIndex == index;
                  return Container(
                      margin: EdgeInsets.only(left: 15,right: 15,top: 12,),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 0.3,
                              offset: Offset(0.0,0.3)
                          )
                        ],
                      ),
                      child: FaqExpansionTileWidget(
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

                              print("$index");
                              /*descriptions.isEmpty?Fluttertoast.showToast(
                                msg: "Tapped on $title",
                                fontSize: 14,
                                backgroundColor: Color(0xff828588),
                                textColor: Colors.black,
                              ):Container();*/
                            });
                          },
                          title: title,
                          titleTextStyle: appStyles.aboutTitleTextStyle(fontWeight: selected ? FontWeight.w600:FontWeight.normal),
                          trailingIcon: descriptions.isEmpty?
                          Icon(selected?Icons.arrow_drop_down_sharp:Icons.arrow_drop_down_sharp,color: Colors.transparent,size: 30,):
                          Icon(selected?Icons.arrow_drop_down_sharp:Icons.arrow_right, color: Colors.grey,size: 30),
                          children: [
                            Container(
                              padding: EdgeInsets.all(15).copyWith(top: 0,bottom: 15),
                              color: Colors.transparent,
                              child: Text(descriptions,
                                style: appStyles.aboutTitleTextStyle(texColor: Colors.grey.shade500,fontSize: 15,fontWeight: FontWeight.w400),
                                textAlign: TextAlign.start,
                              ),
                            )
                          ]
                      )
                  );
                },
              ),
            ),
          ),
          // accountTile(),
        ],
      ),
    );
  }


  void expandOrShrinkDrawer(){
    setState(() {
      isExpanded = !isExpanded;
    });
  }

}
