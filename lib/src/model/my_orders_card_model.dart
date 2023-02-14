
class MyOrderCardModel{
  final String orderNumber;
  final String numberOfItems;
  final String orderStatus;
  final String orderTrackId;
  final String locationIcon;
  final String calendarIcon;
  final String clockIcon;
  final String address;
  final String orderDate;
  final String orderTime;

    MyOrderCardModel({
      required this.orderNumber,
      required this.numberOfItems,
      required this.orderStatus,
      required this.orderTrackId,
      required this.locationIcon,
      required this.calendarIcon,
      required this.clockIcon,
      required this.address,
      required this.orderDate,
      required this.orderTime
  });
}

final List<MyOrderCardModel> actualOrderList = [
  MyOrderCardModel(
    orderNumber: "115",
    numberOfItems: "2",
    orderStatus: "Preparing",
    orderTrackId: "13,7",
    locationIcon: "assets/images/location_icon.svg",
    calendarIcon: "assets/images/calendar_icon.svg",
    clockIcon: "assets/images/clock_icon.svg",
    address: "Independence Ave.,14",
    orderDate: "14.12.2022",
    orderTime: "10:15",
  ),
  MyOrderCardModel(
    orderNumber: "116",
    numberOfItems: "2",
    orderStatus: "Preparing",
    orderTrackId: "13,7",
    locationIcon: "assets/images/location_icon.svg",
    calendarIcon: "assets/images/calendar_icon.svg",
    clockIcon: "assets/images/clock_icon.svg",
    address: "Independence Ave.,14",
    orderDate: "14.12.2022",
    orderTime: "10:15",
  ),
  MyOrderCardModel(
    orderNumber: "117",
    numberOfItems: "2",
    orderStatus: "Preparing",
    orderTrackId: "13,7",
    locationIcon: "assets/images/location_icon.svg",
    calendarIcon: "assets/images/calendar_icon.svg",
    clockIcon: "assets/images/clock_icon.svg",
    address: "Independence Ave.,14",
    orderDate: "14.12.2022",
    orderTime: "10:15",
  ),

];

final List<MyOrderCardModel> pastOrderList = [
  MyOrderCardModel(
    orderNumber: "228",
    numberOfItems: "3",
    orderStatus: "Received",
    orderTrackId: "24,5",
    locationIcon: "assets/images/location_icon.svg",
    calendarIcon: "assets/images/calendar_icon.svg",
    clockIcon: "assets/images/clock_icon.svg",
    address: "Independence Ave.,14",
    orderDate: "08.12.2022",
    orderTime: "10:15",
  ),
  MyOrderCardModel(
    orderNumber: "229",
    numberOfItems: "3",
    orderStatus: "Received",
    orderTrackId: "24,5",
    locationIcon: "assets/images/location_icon.svg",
    calendarIcon: "assets/images/calendar_icon.svg",
    clockIcon: "assets/images/clock_icon.svg",
    address: "Independence Ave.,14",
    orderDate: "08.12.2022",
    orderTime: "10:15",
  ),
  MyOrderCardModel(
    orderNumber: "230",
    numberOfItems: "3",
    orderStatus: "Received",
    orderTrackId: "24,5",
    locationIcon: "assets/images/location_icon.svg",
    calendarIcon: "assets/images/calendar_icon.svg",
    clockIcon: "assets/images/clock_icon.svg",
    address: "Independence Ave.,14",
    orderDate: "08.12.2022",
    orderTime: "10:15",
  ),
];