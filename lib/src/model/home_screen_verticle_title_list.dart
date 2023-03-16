
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
            title: "Borobudur \nTemple",
            subTitle: "",
            placeSubTitle: "Magelang Indonesia",
            countryTitle: "",
            imageUrl: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQQ9j9GWnKtl9xJjLvEPREdCFlkLjl2XKmMdQKOAnnyLmCO_Moo",
          isBookmarked: true,
          recommendationType: "Recommended",
            flagUrl: 'https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png'
        ),
        VerticalTitleSublistList(
          title: "Borobudur \nTemple",
          subTitle: "",
            placeSubTitle: "Magelang Indonesia",
          countryTitle: "",
          imageUrl: "https://i.pinimg.com/736x/47/2f/c7/472fc7febc30f37886bc3cec4f07f66d.jpg",
            isBookmarked: false,
            recommendationType: "Recommended",
            flagUrl: 'https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png'
        ),
        VerticalTitleSublistList(
          title: "Borobudur \nTemple",
            subTitle: "",
            placeSubTitle: "Magelang Indonesia",
          countryTitle: "",
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
          title: "Indonesia",
            placeSubTitle: "",
          subTitle: "",
          countryTitle: "",
          imageUrl: "https://i2.wp.com/westpapuadaily.com/wp-content/uploads/2021/10/1057953_720.jpg?resize=678%2C509&ssl=1",
            isBookmarked: false,
            recommendationType: "Top Recommended",
          destinationText: "Destination",
          numberOfDestination: 100,
            flagUrl: ''
        ),
        VerticalTitleSublistList(
          title: "Indonesia",
          subTitle: "",
            placeSubTitle: "",
          countryTitle: "",
          imageUrl: "https://images.pexels.com/photos/4064432/pexels-photo-4064432.jpeg?cs=srgb&dl=pexels-matteo-badini-4064432.jpg&fm=jpg",
            isBookmarked: false,
            recommendationType: "Top Recommended",
            destinationText: "Destination",
            numberOfDestination: 100,
            flagUrl: ''
        ),
        VerticalTitleSublistList(
          title: "Indonesia",
          subTitle: "",
          placeSubTitle: "",
          countryTitle: "",
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
        title: "Aragua",
        placeSubTitle: "",
        subTitle: "",
        countryTitle: "venezuela",
        imageUrl: "https://i.pinimg.com/originals/0c/ca/11/0cca112aaf106f312cece45cba34be54.jpg",
          isBookmarked: false,
          recommendationType: "Recommended",
        numberOfDestination: 15,
        destinationText: "Destination",
          flagUrl: ''
      ),
      VerticalTitleSublistList(
        title: "Aragua",
        placeSubTitle: "",
        subTitle: "",
        countryTitle: "venezuela",
        imageUrl: "https://static.toiimg.com/thumb/msid-48807408,width=1200,height=900/48807408.jpg",
          isBookmarked: false,
          recommendationType: "Recommended",
          numberOfDestination: 15,
          destinationText: "Destination",
          flagUrl: ''
      ),
      VerticalTitleSublistList(
        title: "Aragua",
        placeSubTitle: "",
        subTitle: "",
        countryTitle: "venezuela",
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
  final String title;
  final String subTitle;
  final String countryTitle;
  final String imageUrl;
  final bool isBookmarked;
  final String? recommendationType;
  final int? numberOfDestination;
  final String? destinationText;
  final String? placeSubTitle;
  final String flagUrl;

  VerticalTitleSublistList({
    required this.title,
    required this.subTitle,
    required this.countryTitle,
    required this.imageUrl,
    required this.isBookmarked,
    this.recommendationType,
    this.numberOfDestination,
    this.destinationText,
    this.placeSubTitle,
    required this.flagUrl
  });
}

// Search screen recommended list data
final List<VerticalTitleSublistList> searchScreenImageList = [
    VerticalTitleSublistList(
    title: "Blausee \nNature park",
    subTitle: "Indonesia",
    countryTitle: "venezuela",
    imageUrl: "https://i.pinimg.com/originals/0c/ca/11/0cca112aaf106f312cece45cba34be54.jpg",
      isBookmarked: false,
      recommendationType: "Recommended",
      flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png"
    ),
    VerticalTitleSublistList(
    title: "Aragua",
    subTitle: "Indonesia",
    countryTitle: "venezuela",
    imageUrl: "https://i.pinimg.com/originals/0c/ca/11/0cca112aaf106f312cece45cba34be54.jpg",
      isBookmarked: false,
        recommendationType: "",
        flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png"
    ),
    VerticalTitleSublistList(
    title: "Aragua",
    subTitle: "Indonesia",
    countryTitle: "venezuela",
    imageUrl: "https://i.pinimg.com/originals/0c/ca/11/0cca112aaf106f312cece45cba34be54.jpg",
      isBookmarked: false,
        recommendationType: "",
        flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png"
    ),
    VerticalTitleSublistList(
    title: "Aragua",
    subTitle: "Indonesia",
    countryTitle: "venezuela",
    imageUrl: "https://i.pinimg.com/originals/0c/ca/11/0cca112aaf106f312cece45cba34be54.jpg",
      isBookmarked: false,
        recommendationType: "",
        flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png"
    ),
    VerticalTitleSublistList(
    title: "Aragua",
    subTitle: "Indonesia",
    countryTitle: "venezuela",
    imageUrl: "https://i.pinimg.com/originals/0c/ca/11/0cca112aaf106f312cece45cba34be54.jpg",
      isBookmarked: false,
        recommendationType: "",
        flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png"
    ),
    VerticalTitleSublistList(
    title: "Aragua",
    subTitle: "Indonesia",
    countryTitle: "venezuela",
    imageUrl: "https://i.pinimg.com/originals/0c/ca/11/0cca112aaf106f312cece45cba34be54.jpg",
        isBookmarked: false,
        recommendationType: "",
        flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png"
    ),
    VerticalTitleSublistList(
    title: "Aragua",
    subTitle: "Indonesia",
    countryTitle: "venezuela",
    imageUrl: "https://i.pinimg.com/originals/0c/ca/11/0cca112aaf106f312cece45cba34be54.jpg",
        isBookmarked: false,
        recommendationType: "",
        flagUrl: "https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png"
    ),
];




