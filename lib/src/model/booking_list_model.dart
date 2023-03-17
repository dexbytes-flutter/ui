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
      title: "Kuta \nBeach",
      subTitle: "July 23,2023 - July 26,2023",
      countryTitle: "venezuela",
      imageUrl: "https://sweetrip.id/wp-content/uploads/2022/01/malik.aslm_247713446_2187324401408301_4130051218010471559_n-1024x818.jpg",
      isBookmarked: false,
      subTitleFlagIcon: "http://cdn.onlinewebfonts.com/svg/img_116262.png",
      bookingStatus: "Cancelled",
      recommendation: "Top Recommended"
  ),
  BookingListModel(
      title: "Borobudur \nTemple",
      subTitle: "Aug 15,2023 - Aug 25,2023",
      countryTitle: "venezuela",
      imageUrl: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQQ9j9GWnKtl9xJjLvEPREdCFlkLjl2XKmMdQKOAnnyLmCO_Moo",
      isBookmarked: false,
      subTitleFlagIcon: "http://cdn.onlinewebfonts.com/svg/img_116262.png",
      bookingStatus: "",
      recommendation: "Top Recommended"
  ),
  BookingListModel(
      title: "Goreme \nNational Park",
      subTitle: "Sep 10,2023 - Sep 13,2023",
      countryTitle: "venezuela",
      imageUrl: "https://www.livingoutlau.com/wp-content/uploads/2021/09/Things-To-Do-in-Cappadocia-Featured.jpg",
      isBookmarked: false,
      subTitleFlagIcon: "http://cdn.onlinewebfonts.com/svg/img_116262.png",
      bookingStatus: "Finished",
      recommendation: ""
  ),
];