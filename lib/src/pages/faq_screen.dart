import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar.dart';
import 'package:flutter/material.dart';

import '../model/faq_data_model.dart';
import '../widgets/common_expansion_tile_widget.dart';

class FaqScreen extends StatefulWidget {
  final String userName;
  final String galleryZoomImageUrl;
  final Function(dynamic)? onImageCallBack;

  const FaqScreen({ Key ?key,
    this.userName = "Mohit Panchal",
    this.galleryZoomImageUrl = "https://static.toiimg.com/thumb/msid-86203836,imgsize-29194,width-800,height-600,resizemode-75/86203836.jpg",
    this.onImageCallBack
  }) : super(key: key);

  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {


  int selectedIndex = -1;
  int selectedIndex2 = -1;//dont set it to 0

  bool isExpanded = false;


  @override
  void initState() {
    // prepareDrawerMenu();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ContainerFirst(
      isOverLayStatusBar: false,
      isSingleChildScrollViewNeed: false,
      contextCurrentView: context,
      appBarHeight: 56,
      appBar: CommonAppBar(
        isHideRightIcon: true,
      ),
      containChild: Container(
        child: Stack(
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 30),
                    child: Text(appString.trans(context, appString.faqButtonText),
                        style: appStyles.commonTitleStyle(fontSize: 30)),
                  ),
                  SizedBox(height: 15,),
                  blackIconTiles(),
                ]
            ),
          ],
        ),
      ),
    );
  }


  Widget blackIconTiles(){
    return ListView.builder(
      key: Key('builder ${selectedIndex.toString()}'),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: faqDrawerlist.length,
      itemBuilder: (context, index) {
        String title = faqDrawerlist[index].title ?? "";
        String descriptions = faqDrawerlist[index].descriptions ?? "";
        bool selected = selectedIndex == index;
        return Container(
            margin: const EdgeInsets.only(left: 15,right: 15,top: 12,),
            decoration: BoxDecoration(
              color: appColors.appBgColor2,
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
    );
  }


  void expandOrShrinkDrawer(){
    setState(() {
      isExpanded = !isExpanded;
    });
  }

}
