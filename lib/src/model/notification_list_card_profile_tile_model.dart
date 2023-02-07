class NotificationListCardModel{
  final String title;
  final String subTitle;

  NotificationListCardModel({
  required this.title,
  required this.subTitle
  });
}

final List<NotificationListCardModel> notificationListCardModel = [

  NotificationListCardModel(
      title: "Order notifications",
    subTitle: "Receive notifications when your order is ready"
  ),
  NotificationListCardModel(
      title: "News Ucoffee",
      subTitle: "Get notification about new products and promotions"
  )
];