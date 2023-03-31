import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/widgets/comment_UI.dart';
import 'package:base_flutter_app/src/widgets/full_view_image_widget.dart';
import 'package:flutter/material.dart';

import '../model/comment_model.dart';


class CommentsListView extends StatefulWidget {
  final String selectedChoice;
  CommentsListView({
    Key ?key, required this.selectedChoice
  }) : super(key: key);

  @override
  _CommentsListViewState createState() => _CommentsListViewState();
}

class _CommentsListViewState extends State<CommentsListView> {
  bool isMore = true;
  bool isSelected = true;
  String? selectedChoice;
  List<CommentsUI> filteredRatingList = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // Rating filter view
      switch(widget.selectedChoice) {
        case "All": {
          filteredRatingList  = allReviewList.where((item) {
            return item.rating != 0;
          }).toList();
        }
        break;

        case "5": {
          filteredRatingList  = allReviewList.where((item) {
            return item.rating == 5;
          }).toList();
        }
        break;

        case "4": {
          filteredRatingList  = allReviewList.where((item) {
            return item.rating == 4;
          }).toList();
        }
        break;

        case "3": {
          filteredRatingList  = allReviewList.where((item) {
            return item.rating == 3;
          }).toList();
        }
        break;

        case "2": {
          filteredRatingList  = allReviewList.where((item) {
            return item.rating == 2;
          }).toList();
        }
        break;

        case "1": {
          filteredRatingList  = allReviewList.where((item) {
            return item.rating == 1;
          }).toList();
        }
        break;

        default: {
          filteredRatingList  = allReviewList.where((item) {
            return item.rating != 0;
          }).toList();
        }
        break;
      }

    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
        itemCount: filteredRatingList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 25),
            child: CommentsUI(
              imageUrl: filteredRatingList[index].imageUrl,
              name: filteredRatingList[index].name,
              daysAgo:filteredRatingList[index].daysAgo,
              rating: filteredRatingList[index].rating,
              review: filteredRatingList[index].review,
              uploadImageUrl1: filteredRatingList[index].uploadImageUrl1,
              uploadImageUrl2: filteredRatingList[index].uploadImageUrl2,
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