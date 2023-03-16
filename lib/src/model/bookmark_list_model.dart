class BookmarkListModel{
  final String placeTitle;
  final String placeSubTitle;
  final String flagImageUrl;
  final double rating;
  final bool isBookMarked;
  final String imageUrl;
  BookmarkListModel({
    required this.placeTitle,
    required this.placeSubTitle,
    required this.flagImageUrl,
    required this.rating,
    required this.isBookMarked,
    required this.imageUrl
  });
}

final List<BookmarkListModel> bookmarkList = [
  BookmarkListModel(
      placeTitle: "Goreme National Park",
      placeSubTitle: "Nevsehir Merkez, Turkey",
      flagImageUrl: "https://cdn.britannica.com/82/4782-004-4119489D/Flag-Turkey.jpg",
      rating: 4.9,
      isBookMarked: true,
      imageUrl: "https://travelsnippet.com/wp-content/uploads/2022/10/mountain-landscape-with-hot-air-balloons-cappadoc-2022-02-01-22-39-58-utc-1.jpg"
  ),
  BookmarkListModel(
    placeTitle: "Goreme National Park",
    placeSubTitle: "Nevsehir Merkez, Turkey",
    flagImageUrl: "https://cdn.britannica.com/82/4782-004-4119489D/Flag-Turkey.jpg",
    rating: 4.9,
    isBookMarked: true,
    imageUrl: "https://nationalparks-15bc7.kxcdn.com/images/parks/ancient-goreme/Goreme%20National%20Park%20pillars.jpg",
  ),
  BookmarkListModel(
    placeTitle: "Goreme National Park",
    placeSubTitle: "Nevsehir Merkez, Turkey",
    flagImageUrl: "https://cdn.britannica.com/82/4782-004-4119489D/Flag-Turkey.jpg",
    rating: 4.9,
    isBookMarked: true,
    imageUrl: "https://www.manuelcohen.com/img-get/I0000zO8rFquYo6Y/s/1200/I0000zO8rFquYo6Y.jpg",
  ),
  BookmarkListModel(
    placeTitle: "Goreme National Park",
    placeSubTitle: "Nevsehir Merkez, Turkey",
    flagImageUrl: "https://cdn.britannica.com/82/4782-004-4119489D/Flag-Turkey.jpg",
    rating: 4.9,
    isBookMarked: true,
    imageUrl: "https://i0.wp.com/rayhaber.com/wp-content/uploads/2019/10/goreme-vadisi-milli-park-statusunden-hizli-tren-projesi-icin-mi-cikarildi.jpg?fit=678%2C381&ssl=1",
  ),
  BookmarkListModel(
    placeTitle: "Goreme National Park",
    placeSubTitle: "Nevsehir Merkez, Turkey",
    flagImageUrl: "https://cdn.britannica.com/82/4782-004-4119489D/Flag-Turkey.jpg",
    rating: 4.9,
    isBookMarked: true,
    imageUrl: "https://static.vecteezy.com/system/resources/previews/001/381/704/large_2x/goreme-national-park-cappadocia-photo.jpg",
  )
];