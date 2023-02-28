
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
            subTitle: "Magelang Indonesia",
            countryTitle: "",
            imageUrl: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQQ9j9GWnKtl9xJjLvEPREdCFlkLjl2XKmMdQKOAnnyLmCO_Moo",
        ),
        VerticalTitleSublistList(
          title: "Borobudur \nTemple",
          subTitle: "Magelang Indonesia",
          countryTitle: "",
          imageUrl: "https://i.pinimg.com/736x/47/2f/c7/472fc7febc30f37886bc3cec4f07f66d.jpg",

        ),
        VerticalTitleSublistList(
          title: "Borobudur \nTemple",
          subTitle: "Magelang Indonesia",
          countryTitle: "",
          imageUrl: "https://images.pexels.com/photos/3348363/pexels-photo-3348363.jpeg?cs=srgb&dl=pexels-max-ravier-3348363.jpg&fm=jpg",
        ),
      ]
  ),
  HomeScreenVerticalTitleModel(
      listTitle: "Countries",
      id: 1,
      verticalTitleSubTitleList: [
        VerticalTitleSublistList(
          title: "Indonesia",
          subTitle: "100+",
          countryTitle: "",
          imageUrl: "https://i2.wp.com/westpapuadaily.com/wp-content/uploads/2021/10/1057953_720.jpg?resize=678%2C509&ssl=1",
        ),
        VerticalTitleSublistList(
          title: "Indonesia",
          subTitle: "100+",
          countryTitle: "",
          imageUrl: "https://images.pexels.com/photos/4064432/pexels-photo-4064432.jpeg?cs=srgb&dl=pexels-matteo-badini-4064432.jpg&fm=jpg",
        ),
        VerticalTitleSublistList(
          title: "Indonesia",
          subTitle: "100+",
          countryTitle: "",
          imageUrl: "https://images.unsplash.com/photo-1617634667039-8e4cb277ab46?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHNjZW5lcnl8ZW58MHx8MHx8&w=1000&q=80",
        ),
    ]
  ),
  HomeScreenVerticalTitleModel(
    listTitle: "Cities",
    id: 2,
    verticalTitleSubTitleList: [
      VerticalTitleSublistList(
        title: "Aragua",
        subTitle: "15+",
        countryTitle: "venezuela",
        imageUrl: "https://i.pinimg.com/originals/0c/ca/11/0cca112aaf106f312cece45cba34be54.jpg",
      ),
      VerticalTitleSublistList(
        title: "Aragua",
        subTitle: "15+",
        countryTitle: "venezuela",
        imageUrl: "https://static.toiimg.com/thumb/msid-48807408,width=1200,height=900/48807408.jpg",
      ),
      VerticalTitleSublistList(
        title: "Aragua",
        subTitle: "15+",
        countryTitle: "venezuela",
        imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1tjnAhpatgtaQeOl3xWbWtk2TrED_nbVcjw&usqp=CAU",
      ),
    ]
  ),
];


class VerticalTitleSublistList{
  final String title;
  final String subTitle;
  final String countryTitle;
  final String imageUrl;

  VerticalTitleSublistList({
    required this.title,
    required this.subTitle,
    required this.countryTitle,
    required this.imageUrl
  });
}

final List<VerticalTitleSublistList> searchScreenImageList = [
    VerticalTitleSublistList(
    title: "Blausee \nNature park",
    subTitle: "Indonesia",
    countryTitle: "venezuela",
    imageUrl: "https://i.pinimg.com/originals/0c/ca/11/0cca112aaf106f312cece45cba34be54.jpg",
    ),
  VerticalTitleSublistList(
    title: "Aragua",
    subTitle: "Indonesia",
    countryTitle: "venezuela",
    imageUrl: "https://i.pinimg.com/originals/0c/ca/11/0cca112aaf106f312cece45cba34be54.jpg",
  ),
  VerticalTitleSublistList(
    title: "Aragua",
    subTitle: "Indonesia",
    countryTitle: "venezuela",
    imageUrl: "https://i.pinimg.com/originals/0c/ca/11/0cca112aaf106f312cece45cba34be54.jpg",
  ),
];