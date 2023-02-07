import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:flutter/material.dart';

import 'text_with_toggel_button.dart';

class NotificationListCard extends StatefulWidget {
  final String title;
  final String subTitle;
  const NotificationListCard({
    Key? key,
    this.title = "",
    this.subTitle = ""
  }) : super(key: key);

  @override
  State<NotificationListCard> createState() => _NotificationListCardState();
}

class _NotificationListCardState extends State<NotificationListCard> {


  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: appColors.white
      ),
      margin: const EdgeInsets.only(bottom: 15,left: 20,right: 20),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title,
          style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,
            color: appColors.textNormalColor1
          ),
          ),
          SizedBox(height: 15,),
          Row(
            children: [
              Expanded(
                child: Text(widget.subTitle,
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 13,
                        fontWeight: FontWeight.w400)
                ),
              ),
              TextWithSwitchIcon()
            ],
          )
        ],
      ),
    );
  }
}
