
class HomeScreenVerticalTitleModel{
  final String listTitle;
  final List<VerticalTitleSublistList> verticalTitleSubTitleList;
  final int id;
  HomeScreenVerticalTitleModel({
    required this.listTitle,
    required this.verticalTitleSubTitleList,
    required this.id
  });
}

final List<HomeScreenVerticalTitleModel> homeVerticalList = [

  HomeScreenVerticalTitleModel(
      listTitle: "Destination",
      id: 0,
      verticalTitleSubTitleList: [
        VerticalTitleSublistList(
            placeName: "Borobudur \nTemple",
            placeSubTitle: "Magelang Indonesia",
            imageUrl: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQQ9j9GWnKtl9xJjLvEPREdCFlkLjl2XKmMdQKOAnnyLmCO_Moo",
          isBookmarked: true,
          recommendationType: "Recommended",
            flagUrl: 'https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png'
        ),
        VerticalTitleSublistList(
          placeName: "Borobudur \nTemple",
            placeSubTitle: "Magelang Indonesia",
          imageUrl: "https://i.pinimg.com/736x/47/2f/c7/472fc7febc30f37886bc3cec4f07f66d.jpg",
            isBookmarked: false,
            recommendationType: "Recommended",
            flagUrl: 'https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png'
        ),
        VerticalTitleSublistList(
          placeName: "Borobudur \nTemple",
            placeSubTitle: "Magelang Indonesia",
          imageUrl: "https://images.pexels.com/photos/3348363/pexels-photo-3348363.jpeg?cs=srgb&dl=pexels-max-ravier-3348363.jpg&fm=jpg",
            isBookmarked: false,
            recommendationType: "Recommended",
            flagUrl: 'https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png'
        ),
      ]
  ),
  HomeScreenVerticalTitleModel(
      listTitle: "Countries",
      id: 1,
      verticalTitleSubTitleList: [
        VerticalTitleSublistList(
          placeName: "Indonesia",
            placeSubTitle: "",
          imageUrl: "https://i2.wp.com/westpapuadaily.com/wp-content/uploads/2021/10/1057953_720.jpg?resize=678%2C509&ssl=1",
            isBookmarked: false,
            recommendationType: "Top Recommended",
          destinationText: "Destination",
          numberOfDestination: 100,
            flagUrl: ''
        ),
        VerticalTitleSublistList(
          placeName: "Indonesia",
            placeSubTitle: "",
          imageUrl: "https://images.pexels.com/photos/4064432/pexels-photo-4064432.jpeg?cs=srgb&dl=pexels-matteo-badini-4064432.jpg&fm=jpg",
            isBookmarked: false,
            recommendationType: "Top Recommended",
            destinationText: "Destination",
            numberOfDestination: 100,
            flagUrl: ''
        ),
        VerticalTitleSublistList(
          placeName: "Indonesia",
          placeSubTitle: "",
          imageUrl: "https://images.unsplash.com/photo-1617634667039-8e4cb277ab46?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHNjZW5lcnl8ZW58MHx8MHx8&w=1000&q=80",
            isBookmarked: false,
            recommendationType: "Top Recommended",
            destinationText: "Destination",
            numberOfDestination: 100,
            flagUrl: ''
        ),
    ]
  ),
  HomeScreenVerticalTitleModel(
    listTitle: "Cities",
    id: 2,
    verticalTitleSubTitleList: [
      VerticalTitleSublistList(
        placeName: "Aragua",
        placeSubTitle: "",
        imageUrl: "https://i.pinimg.com/originals/0c/ca/11/0cca112aaf106f312cece45cba34be54.jpg",
          isBookmarked: false,
          recommendationType: "Recommended",
        numberOfDestination: 15,
        destinationText: "Destination",
          flagUrl: ''
      ),
      VerticalTitleSublistList(
        placeName: "Aragua",
        placeSubTitle: "",
        imageUrl: "https://static.toiimg.com/thumb/msid-48807408,width=1200,height=900/48807408.jpg",
          isBookmarked: false,
          recommendationType: "Recommended",
          numberOfDestination: 15,
          destinationText: "Destination",
          flagUrl: ''
      ),
      VerticalTitleSublistList(
        placeName: "Aragua",
        placeSubTitle: "",
        imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1tjnAhpatgtaQeOl3xWbWtk2TrED_nbVcjw&usqp=CAU",
          isBookmarked: false,
          recommendationType: "Recommended",
          numberOfDestination: 15,
          destinationText: "Destination",
          flagUrl: ''
      ),
    ]
  ),
];


class VerticalTitleSublistList{
  final String imageUrl;
  final double? rating;
  final bool? isBookmarked;
  final String? recommendationType;
  final String? placeName;
  final String? placeSubTitle;
  final String? flagUrl;
  final int? numberOfDestination;
  final String? destinationText;


  VerticalTitleSublistList({
    required this.imageUrl,
    this.rating,
    this.isBookmarked,
    this.recommendationType,
    required this.placeName,
    this.placeSubTitle,
    required this.flagUrl,
    this.numberOfDestination,
    this.destinationText,
  });
}

// Search screen recommended list data
final List<VerticalTitleSublistList> searchScreenImageList = [
    VerticalTitleSublistList(
        imageUrl: "https://i.pinimg.com/originals/0c/ca/11/0cca112aaf106f312cece45cba34be54.jpg",
        rating: 4.9,
        isBookmarked: false,
        recommendationType: "Recommended",
        placeName : "Blausee \nNature park",
        placeSubTitle: "Indonesia",
      flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
      numberOfDestination: 100,
      destinationText: "Destination"
    ),
    VerticalTitleSublistList(
        imageUrl: "https://i.pinimg.com/originals/0c/ca/11/0cca112aaf106f312cece45cba34be54.jpg",
        rating: 4.9,
        isBookmarked: false,
        recommendationType: "Recommended",
        placeName : "Blausee \nNature park",
        placeSubTitle: "Indonesia",
        flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
        numberOfDestination: 100,
        destinationText: "Destination"
    ),
    VerticalTitleSublistList(
        imageUrl: "https://i.pinimg.com/originals/0c/ca/11/0cca112aaf106f312cece45cba34be54.jpg",
        rating: 4.9,
        isBookmarked: false,
        recommendationType: "Recommended",
        placeName : "Blausee \nNature park",
        placeSubTitle: "Indonesia",
        flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
        numberOfDestination: 100,
        destinationText: "Destination"
    ),
    VerticalTitleSublistList(
        imageUrl: "https://i.pinimg.com/originals/0c/ca/11/0cca112aaf106f312cece45cba34be54.jpg",
        rating: 4.9,
        isBookmarked: false,
        recommendationType: "Recommended",
        placeName : "Blausee \nNature park",
        placeSubTitle: "Indonesia",
        flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
        numberOfDestination: 100,
        destinationText: "Destination"
    ),
    VerticalTitleSublistList(
        imageUrl: "https://i.pinimg.com/originals/0c/ca/11/0cca112aaf106f312cece45cba34be54.jpg",
        rating: 4.9,
        isBookmarked: false,
        recommendationType: "Recommended",
        placeName : "Blausee \nNature park",
        placeSubTitle: "Indonesia",
        flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
        numberOfDestination: 100,
        destinationText: "Destination"
    ),
    VerticalTitleSublistList(
        imageUrl: "https://i.pinimg.com/originals/0c/ca/11/0cca112aaf106f312cece45cba34be54.jpg",
        rating: 4.9,
        isBookmarked: false,
        recommendationType: "Recommended",
        placeName : "Blausee \nNature park",
        placeSubTitle: "Indonesia",
        flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
        numberOfDestination: 100,
        destinationText: "Destination"
    ),
    VerticalTitleSublistList(
        imageUrl: "https://i.pinimg.com/originals/0c/ca/11/0cca112aaf106f312cece45cba34be54.jpg",
        rating: 4.9,
      isBookmarked: false,
      recommendationType: "Recommended",
      placeName : "Blausee \nNature park",
      placeSubTitle: "Indonesia",
      flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png",
      numberOfDestination: 100,
      destinationText: "Destination"
    ),
];




