class BookingListModel{
  final String title;
  final String subTitle;
  final String countryTitle;
  final String imageUrl;
  final bool isBookmarked;
  final String subTitleFlagIcon;
  final String bookingStatus;
  final String recommendation;

  BookingListModel({
    required this.title,
    required this.subTitle,
    required this.countryTitle,
    required this.imageUrl,
    required this.isBookmarked,
    required this.subTitleFlagIcon,
    required this.bookingStatus,
    required this.recommendation
  });
}

final List<BookingListModel> bookingListPlaceImagesList = [
  BookingListModel(
      title: "Kuta Beach",
      subTitle: "July 23,2023 - July 26,2023",
      countryTitle: "venezuela",
      imageUrl: "https://i.pinimg.com/originals/0c/ca/11/0cca112aaf106f312cece45cba34be54.jpg",
      isBookmarked: false,
      subTitleFlagIcon: "http://cdn.onlinewebfonts.com/svg/img_116262.png",
      bookingStatus: "Cancelled",
      recommendation: "Top Recommended"
  ),
  BookingListModel(
      title: "Borobudur \nTemple",
      subTitle: "Aug 15,2023 - Aug 25,2023",
      countryTitle: "venezuela",
      imageUrl: "https://i.pinimg.com/originals/0c/ca/11/0cca112aaf106f312cece45cba34be54.jpg",
      isBookmarked: false,
      subTitleFlagIcon: "http://cdn.onlinewebfonts.com/svg/img_116262.png",
      bookingStatus: "",
      recommendation: "Top Recommended"
  ),
  BookingListModel(
      title: "Goreme \nNational Park",
      subTitle: "Sep 10,2023 - Sep 13,2023",
      countryTitle: "venezuela",
      imageUrl: "https://i.pinimg.com/originals/0c/ca/11/0cca112aaf106f312cece45cba34be54.jpg",
      isBookmarked: false,
      subTitleFlagIcon: "http://cdn.onlinewebfonts.com/svg/img_116262.png",
      bookingStatus: "Finished",
      recommendation: ""
  ),
];