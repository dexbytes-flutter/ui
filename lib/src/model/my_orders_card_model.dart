
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
  final int id;

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
      required this.orderTime,
      required this.id
  });
}

final List<MyOrderCardModel> actualOrderList = [
  MyOrderCardModel(
    id: 0,
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
    id: 1,
    orderNumber: "116",
    numberOfItems: "3",
    orderStatus: "Preparing",
    orderTrackId: "13,8",
    locationIcon: "assets/images/location_icon.svg",
    calendarIcon: "assets/images/calendar_icon.svg",
    clockIcon: "assets/images/clock_icon.svg",
    address: "Independence Ave.,14",
    orderDate: "14.12.2022",
    orderTime: "10:00",
  ),
  MyOrderCardModel(
    id: 2,
    orderNumber: "117",
    numberOfItems: "1",
    orderStatus: "Preparing",
    orderTrackId: "13,9",
    locationIcon: "assets/images/location_icon.svg",
    calendarIcon: "assets/images/calendar_icon.svg",
    clockIcon: "assets/images/clock_icon.svg",
    address: "Independence Ave.,14",
    orderDate: "14.12.2022",
    orderTime: "9:30",
  ),

];

final List<MyOrderCardModel> pastOrderList = [
  MyOrderCardModel(
    id: 0,
    orderNumber: "228",
    numberOfItems: "4",
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
    id: 1,
    orderNumber: "229",
    numberOfItems: "3",
    orderStatus: "Received",
    orderTrackId: "24,6",
    locationIcon: "assets/images/location_icon.svg",
    calendarIcon: "assets/images/calendar_icon.svg",
    clockIcon: "assets/images/clock_icon.svg",
    address: "Independence Ave.,14",
    orderDate: "08.12.2022",
    orderTime: "10:10",
  ),
  MyOrderCardModel(
    id: 2,
    orderNumber: "230",
    numberOfItems: "1",
    orderStatus: "Received",
    orderTrackId: "24,7",
    locationIcon: "assets/images/location_icon.svg",
    calendarIcon: "assets/images/calendar_icon.svg",
    clockIcon: "assets/images/clock_icon.svg",
    address: "Independence Ave.,14",
    orderDate: "08.12.2022",
    orderTime: "9:45",
  ),
];