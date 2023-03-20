class BookingListModel{
  final String placeSubTitle;
  final String placeName;
  final String imageUrl;
  final bool isBookmarked;
  final String placeSubTitleFlagIcon;
  final String bookingStatus;
  final String recommendation;
  final double rating;
  final String bookingDate;

  BookingListModel({
    required this.placeSubTitle,
    required this.placeName,
    required this.imageUrl,
    required this.isBookmarked,
    required this.placeSubTitleFlagIcon,
    required this.bookingStatus,
    required this.recommendation,
    required this.rating,
    required this.bookingDate
  });
}

final List<BookingListModel> bookingListPlaceImagesList = [
  BookingListModel(
      placeName: "Kuta \nBeach",
      bookingDate: "July 23,2023 - July 26,2023",
      placeSubTitle: "venezuela",
      imageUrl: "https://sweetrip.id/wp-content/uploads/2022/01/malik.aslm_247713446_2187324401408301_4130051218010471559_n-1024x818.jpg",
      isBookmarked: false,
      placeSubTitleFlagIcon: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
      bookingStatus: "Cancelled",
      recommendation: "Top Recommended",
      rating: 4.9
  ),
  BookingListModel(
      placeName: "Borobudur \nTemple",
      bookingDate: "Aug 15,2023 - Aug 25,2023",
      placeSubTitle: "venezuela",
      imageUrl: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQQ9j9GWnKtl9xJjLvEPREdCFlkLjl2XKmMdQKOAnnyLmCO_Moo",
      isBookmarked: false,
      placeSubTitleFlagIcon: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
      bookingStatus: "",
      recommendation: "Top Recommended",
    rating: 4.9
  ),
  BookingListModel(
      placeName: "Goreme \nNational Park",
      bookingDate: "Sep 10,2023 - Sep 13,2023",
      placeSubTitle: "venezuela",
      imageUrl: "https://www.livingoutlau.com/wp-content/uploads/2021/09/Things-To-Do-in-Cappadocia-Featured.jpg",
      isBookmarked: false,
      placeSubTitleFlagIcon: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
      bookingStatus: "Finished",
      recommendation: "",
    rating: 4.9
  ),
];