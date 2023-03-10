import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/model/comment_model.dart';
import 'package:base_flutter_app/src/widgets/comment_UI.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar/common_app_bar.dart';

class ReviewViewAllScreen extends StatefulWidget {

  const ReviewViewAllScreen({Key? key}) : super(key: key);

  @override
  State<ReviewViewAllScreen> createState() => _ReviewViewAllScreenState();
}

class _ReviewViewAllScreenState extends State<ReviewViewAllScreen> {

  bool isMore = true;

  @override
  Widget build(BuildContext context) {

    // All review list
    allReview(){
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
        itemCount: allReviewList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 25),
            child: CommentsUI(
              imageUrl: allReviewList[index].imageUrl,
              name: allReviewList[index].name,
              daysAgo:allReviewList[index].daysAgo,
              rating: allReviewList[index].rating,
              review: allReviewList[index].review,
              uploadImageUrl1: allReviewList[index].uploadImageUrl1,
              uploadImageUrl2: allReviewList[index].uploadImageUrl2,
              onPressed: () => print("More Action $index"),
              onTap: () => setState(() {
                isMore = !isMore;
              }),
              isLess: isMore,
            ),
          );
        },
      );
    }

    return ContainerFirst(
        appBarHeight: 56,
        isOverLayStatusBar: false,
        isOverLayAppBar: false,
        isSingleChildScrollViewNeed: true,
        isFixedDeviceHeight: false,
        contextCurrentView: context,
        appBar: CommonAppBar(
          isHideRightIcon: true,
        ),
        containChild: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 30),
              child: Text(appString.trans(context, appString.allReviewTitleText),
                  style: appStyles.commonTitleStyle(fontSize: 30)),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20,),
                child: allReview()
            ),
          ],
        )
    );
  }
}
