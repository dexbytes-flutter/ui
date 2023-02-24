class HomePageSlideImageModel {
  final String imageUrl;
  final String title;

  HomePageSlideImageModel({
    required this.imageUrl,
    required this.title,
  });
}

final homePageSlideImageList = [

  HomePageSlideImageModel(
      imageUrl:  'https://c1.wallpaperflare.com/preview/590/969/106/stone-temple-prambanan-yogyakarta-tourist-wonderful.jpg',
      title: 'Explore the \nbeauty of the \nworld !',

  ),
  HomePageSlideImageModel(
      imageUrl: 'https://i.pinimg.com/736x/47/2f/c7/472fc7febc30f37886bc3cec4f07f66d.jpg',
      title: 'Enjoy \nyour travel \nexperience',

  ),
  HomePageSlideImageModel(
      imageUrl:  'https://images.pexels.com/photos/3348363/pexels-photo-3348363.jpeg?cs=srgb&dl=pexels-max-ravier-3348363.jpg&fm=jpg',
      title: "Let's make \nyour dream \ntravel",
  ),
];