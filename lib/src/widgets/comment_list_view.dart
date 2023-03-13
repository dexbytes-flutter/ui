import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/widgets/comment_UI.dart';
import 'package:base_flutter_app/src/widgets/full_view_image_widget.dart';
import 'package:flutter/material.dart';

import '../model/comment_model.dart';


class CommentsListView extends StatefulWidget {
  final Function(dynamic)? commentTypeCallBack;

  CommentsListView({ Key ?key,
    this.commentTypeCallBack,

  }) : super(key: key);

  @override
  _CommentsListViewState createState() => _CommentsListViewState(commentTypeCallBack);
}

class _CommentsListViewState extends State<CommentsListView> {
  final Function(dynamic)? commentTypeCallBack;
  bool isMore = true;
  bool isSelected = true;

  _CommentsListViewState(this.commentTypeCallBack);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
        itemCount: reviewList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 25),
            child: CommentsUI(
              imageUrl: reviewList[index].imageUrl,
              name: reviewList[index].name,
              daysAgo:reviewList[index].daysAgo,
              rating: reviewList[index].rating,
              review: reviewList[index].review,
              uploadImageUrl1: reviewList[index].uploadImageUrl1,
              uploadImageUrl2: reviewList[index].uploadImageUrl2,
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
}