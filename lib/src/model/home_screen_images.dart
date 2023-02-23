class HomePageSlideImageModel {
  final String imageUrl;
  final String title;
  final String selectedListTitle;

  HomePageSlideImageModel({
    required this.imageUrl,
    required this.title,
    required this.selectedListTitle
  });
}

final homePageSlideImageList = [

  HomePageSlideImageModel(
      imageUrl:  'https://images.unsplash.com/photo-1523810804307-760585ed63cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8aW5kb25lc2lhJTIwYmVhY2h8ZW58MHx8MHx8&w=1000&q=80',
      title: 'Explore the \nbeauty of the \nworld !',
      selectedListTitle: ""
  ),
  HomePageSlideImageModel(
      imageUrl: 'https://wallpaperbat.com/img/360593-stunning-indonesia-picture.jpg',
      title: 'Enjoy \nyour travel \nexperience',
      selectedListTitle: ""
  ),
  HomePageSlideImageModel(
      imageUrl:  'https://i.pinimg.com/474x/78/42/ac/7842ac73d48cc8c2df9b2dcd3aa1c212.jpg',
      title: "Let's make \nyour dream \ntravel",
      selectedListTitle: ""
  ),
];