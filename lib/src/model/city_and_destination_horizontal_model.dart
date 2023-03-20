
class CityAndDestinationHorizontalModel{

  final String listViewTitle;
  final int listTitleId;
  final bool? isCityAndDestinationList;
  final List<CityAndDestinationCardViewModel> cityAndDestinationSubList;

  CityAndDestinationHorizontalModel({
      required this.listViewTitle,
      required this.listTitleId,
    required this.cityAndDestinationSubList,
    this.isCityAndDestinationList
  });
}

final List<CityAndDestinationHorizontalModel> cityAndDestinationHorizontalList = [
  CityAndDestinationHorizontalModel(
      listViewTitle: "City",
      listTitleId: 0,
    isCityAndDestinationList: true,
    cityAndDestinationSubList: [
      CityAndDestinationCardViewModel(
        imageUrl: "https://www.plataran.com/wp-content/uploads/2020/04/plataran-bimonthly-may-june-2019-lr-15_0ztqu.jpg",
        isBookmarked: false,
        placeName: "Bali",
        recommendationType: "Top Recommended",
        placeSubTitle: "Indonesia",
        numberOfDestination: 80,
        destinationText: "Destination",
        rating: null,
        flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
      ),
      CityAndDestinationCardViewModel(
        imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyh6fCxYcLIsj7yH-NpIAamM5WHT7Zw6m1JZF1ScPCiI9nxW8sXhGay8123mmXAZpSTX0&usqp=CAU",
        isBookmarked: false,
        placeName: "Jogja",
        recommendationType: "Top Recommended",
        placeSubTitle: "Indonesia",
        numberOfDestination: 50,
        destinationText: "Destination",
        rating: null,
        flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
      ),
      CityAndDestinationCardViewModel(
        imageUrl: "https://i2.wp.com/westpapuadaily.com/wp-content/uploads/2021/10/1057953_720.jpg?resize=678%2C509&ssl=1",
        isBookmarked: null,
        placeName: "Bali",
        recommendationType: "Top Recommended",
        placeSubTitle: "Indonesia",
        numberOfDestination: 80,
        rating: 4.9,
        destinationText: "Destination",
        flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
      ),
      CityAndDestinationCardViewModel(
        imageUrl: "https://i2.wp.com/westpapuadaily.com/wp-content/uploads/2021/10/1057953_720.jpg?resize=678%2C509&ssl=1",
        isBookmarked: null,
        placeName: "Bali",
        recommendationType: "Top Recommended",
        placeSubTitle: "Indonesia",
        numberOfDestination: 80,
        rating: 4.9,
        destinationText: "Destination",
        flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
      ),
    ]

  ),
  CityAndDestinationHorizontalModel(
      listViewTitle: "Destination",
      listTitleId: 1,
    isCityAndDestinationList: true,
    cityAndDestinationSubList: [
      CityAndDestinationCardViewModel(
        imageUrl: "https://i0.wp.com/seekingsunrises.com/wp-content/uploads/2021/07/Komodo-Island-Tour.jpg?fit=1020%2C652&ssl=1",
        isBookmarked: true,
        placeName: "Komodo Island",
        recommendationType: "Top Recommended",
        placeSubTitle: "Indonesia",
        numberOfDestination: 80,
        destinationText: "",
        rating: 4.9,
        flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
      ),
      CityAndDestinationCardViewModel(
        imageUrl: "https://i0.wp.com/seekingsunrises.com/wp-content/uploads/2021/07/Komodo-Island-Tour.jpg?fit=1020%2C652&ssl=1",
        isBookmarked: true,
        placeName: "Komodo Island",
        recommendationType: "Top Recommended",
        placeSubTitle: "Indonesia",
        numberOfDestination: 80,
        rating: 4.9,
        destinationText: "",
        flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
      ),
      CityAndDestinationCardViewModel(
        imageUrl: "https://i2.wp.com/westpapuadaily.com/wp-content/uploads/2021/10/1057953_720.jpg?resize=678%2C509&ssl=1",
        isBookmarked: true,
        placeName: "Bali",
        recommendationType: "Top Recommended",
        placeSubTitle: "Indonesia",
        numberOfDestination: 80,
        rating: 4.9,
        destinationText: "Destination",
        flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
      ),
      CityAndDestinationCardViewModel(
        imageUrl: "https://i2.wp.com/westpapuadaily.com/wp-content/uploads/2021/10/1057953_720.jpg?resize=678%2C509&ssl=1",
        isBookmarked: true,
        rating: 4.9,
        placeName: "Bali",
        recommendationType: "Top Recommended",
        placeSubTitle: "Indonesia",
        numberOfDestination: 80,
        destinationText: "",
        flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
      ),
    ]
  ),
];

class CityAndDestinationCardViewModel{
  final String imageUrl;
  final double? rating;
  final bool? isBookmarked;
  final String? recommendationType;
  final String? placeName;
  final String? placeSubTitle;
  final String? flagUrl;
  final int? numberOfDestination;
  final String? destinationText;
  final bool? isVerticalCardListView;

  CityAndDestinationCardViewModel({
  required this.imageUrl,
  this.rating,
  this.isBookmarked,
  this.recommendationType,
  this.placeName,
  this.placeSubTitle,
  this.flagUrl,
  this.numberOfDestination,
  this.destinationText,
  this.isVerticalCardListView,
  });
}
