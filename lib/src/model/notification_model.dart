class NotificationModel {
  String? title;
  String? descriptions;
  String? notificationTime;

  NotificationModel({this.title, this.descriptions,
    this.notificationTime});
}

final List<NotificationModel> notificationInfoList = [
  NotificationModel(
    title: "You have an order for Lespresso coffee.",
    descriptions: "Espresso is a borrowed word from Italian steam or hot water through finaly ground coffee.",
    notificationTime: "2 hours ago"
  ),
  NotificationModel(
      title: "You have an order for Lespresso coffee.",
      descriptions: "Espresso is a borrowed word from Italian steam or hot water through finaly ground coffee.",
      notificationTime: "3 hours ago"
  ),
];

final List<NotificationModel> notificationInfoList1 = [
  NotificationModel(
      title: "You have an order for Lespresso coffee.",
      descriptions: "Espresso is a borrowed word from Italian steam or hot water through finaly ground coffee.",
      notificationTime: "24 hours ago"
  ),
  NotificationModel(
      title: "You have an order for Lespresso coffee.",
      descriptions: "Espresso is a borrowed word from Italian steam or hot water through finaly ground coffee.",
      notificationTime: "25 hours ago"
  ),
];