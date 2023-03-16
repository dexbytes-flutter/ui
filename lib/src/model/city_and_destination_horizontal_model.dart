
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
        imageUrl: "https://i2.wp.com/westpapuadaily.com/wp-content/uploads/2021/10/1057953_720.jpg?resize=678%2C509&ssl=1",
        isBookmarked: false,
        placeName: "Bali",
        recommendationType: "Top Recommended",
        placeSubTitle: "Indonesia",
        numberOfDestination: 80,
        destinationText: "Destination",
        flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
      ),
      CityAndDestinationCardViewModel(
        imageUrl: "https://i2.wp.com/westpapuadaily.com/wp-content/uploads/2021/10/1057953_720.jpg?resize=678%2C509&ssl=1",
        isBookmarked: false,
        placeName: "Bali",
        recommendationType: "Top Recommended",
        placeSubTitle: "Indonesia",
        numberOfDestination: 80,
        destinationText: "Destination",
        flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
      ),
      CityAndDestinationCardViewModel(
        imageUrl: "https://i2.wp.com/westpapuadaily.com/wp-content/uploads/2021/10/1057953_720.jpg?resize=678%2C509&ssl=1",
        isBookmarked: false,
        placeName: "Bali",
        recommendationType: "Top Recommended",
        placeSubTitle: "Indonesia",
        numberOfDestination: 80,
        destinationText: "Destination",
        flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
      ),
      CityAndDestinationCardViewModel(
        imageUrl: "https://i2.wp.com/westpapuadaily.com/wp-content/uploads/2021/10/1057953_720.jpg?resize=678%2C509&ssl=1",
        isBookmarked: false,
        placeName: "Bali",
        recommendationType: "Top Recommended",
        placeSubTitle: "Indonesia",
        numberOfDestination: 80,
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
        imageUrl: "https://i2.wp.com/westpapuadaily.com/wp-content/uploads/2021/10/1057953_720.jpg?resize=678%2C509&ssl=1",
        isBookmarked: false,
        placeName: "Bali",
        recommendationType: "Top Recommended",
        placeSubTitle: "Indonesia",
        numberOfDestination: 80,
        destinationText: "Destination",
        flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
      ),
      CityAndDestinationCardViewModel(
        imageUrl: "https://i2.wp.com/westpapuadaily.com/wp-content/uploads/2021/10/1057953_720.jpg?resize=678%2C509&ssl=1",
        isBookmarked: false,
        placeName: "Bali",
        recommendationType: "Top Recommended",
        placeSubTitle: "Indonesia",
        numberOfDestination: 80,
        destinationText: "Destination",
        flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
      ),
      CityAndDestinationCardViewModel(
        imageUrl: "https://i2.wp.com/westpapuadaily.com/wp-content/uploads/2021/10/1057953_720.jpg?resize=678%2C509&ssl=1",
        isBookmarked: false,
        placeName: "Bali",
        recommendationType: "Top Recommended",
        placeSubTitle: "Indonesia",
        numberOfDestination: 80,
        destinationText: "Destination",
        flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
      ),
      CityAndDestinationCardViewModel(
        imageUrl: "https://i2.wp.com/westpapuadaily.com/wp-content/uploads/2021/10/1057953_720.jpg?resize=678%2C509&ssl=1",
        isBookmarked: false,
        placeName: "Bali",
        recommendationType: "Top Recommended",
        placeSubTitle: "Indonesia",
        numberOfDestination: 80,
        destinationText: "Destination",
        flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
      ),
    ]
  ),
];

class CityAndDestinationCardViewModel{
  final String imageUrl;
  final bool isBookmarked;
  final String? recommendationType;
  final int? numberOfDestination;
  final String? destinationText;
  final String? placeName;
  final String? placeSubTitle;
  final String flagUrl;
  final double? rating;

  CityAndDestinationCardViewModel({
  required this.imageUrl,
  required this.isBookmarked,
  this.recommendationType,
  this.numberOfDestination,
  this.destinationText,
    this.placeName,
  this.placeSubTitle,
  required this.flagUrl,
    this.rating,
  });
}

final List<CityAndDestinationCardViewModel> cityAndDestinationViewList = [
  CityAndDestinationCardViewModel(
      imageUrl: "https://i2.wp.com/westpapuadaily.com/wp-content/uploads/2021/10/1057953_720.jpg?resize=678%2C509&ssl=1",
      isBookmarked: false,
      placeName: "Bali",
      recommendationType: "Top Recommended",
      placeSubTitle: "Indonesia",
      numberOfDestination: 80,
      destinationText: "Destination",
      flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
    rating: null
  ),
  CityAndDestinationCardViewModel(
    imageUrl: "https://i2.wp.com/westpapuadaily.com/wp-content/uploads/2021/10/1057953_720.jpg?resize=678%2C509&ssl=1",
    isBookmarked: false,
    placeName: "Bali",
    recommendationType: "Top Recommended",
    placeSubTitle: "Indonesia",
    numberOfDestination: 80,
    destinationText: "Destination",
    flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
      rating: null
  ),
  CityAndDestinationCardViewModel(
    imageUrl: "https://i2.wp.com/westpapuadaily.com/wp-content/uploads/2021/10/1057953_720.jpg?resize=678%2C509&ssl=1",
    isBookmarked: false,
    placeName: "Bali",
    recommendationType: "Top Recommended",
    placeSubTitle: "Indonesia",
    numberOfDestination: 80,
    destinationText: "Destination",
    flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
      rating: null
  ),
  CityAndDestinationCardViewModel(
    imageUrl: "https://i2.wp.com/westpapuadaily.com/wp-content/uploads/2021/10/1057953_720.jpg?resize=678%2C509&ssl=1",
    isBookmarked: false,
    placeName: "Bali",
    recommendationType: "Top Recommended",
    placeSubTitle: "Indonesia",
    numberOfDestination: 80,
    destinationText: "Destination",
    flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
      rating: null
  ),
];