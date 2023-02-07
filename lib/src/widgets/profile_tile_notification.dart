import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/model/notification_list_card_profile_tile_model.dart';
import 'package:base_flutter_app/src/widgets/notification_list_card_profile_tile.dart';
import 'package:flutter/material.dart';

import 'appbar/appbar_with_left_icon_title.dart';

class ProfileTileNotification extends StatelessWidget {
  const ProfileTileNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget notificationCardList(){
      return ListView.builder(
        shrinkWrap: true,
        itemCount: notificationListCardModel.length ,
          itemBuilder: (context, index){
            return NotificationListCard(
              title: notificationListCardModel[index].title,
              subTitle: notificationListCardModel[index].subTitle,
            );
          }
      );

    }
    return ContainerFirst(
        contextCurrentView: context,
        appBarHeight: 48,
        appBar: CommonAppBarWithLeftIconTitle(
        title: "Notifications",
        ),
        containChild: Column(
          children: [
            notificationCardList()
          ],
        )
    );
  }
}
