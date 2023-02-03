class FavoriteCardModel{
  final String title;
  final String subTitle;
  final String price;
  final String imageUrl;


  FavoriteCardModel({
    required this.title,
    required this.subTitle,
    required this.imageUrl,
    required this.price,
  });
}

final List<FavoriteCardModel> favoriteCardList = [
  FavoriteCardModel(
    title: "Coromel Macchioto",
    subTitle: "Large, Oat milk",
    imageUrl: "https://thelittlestcrumb.com/wp-content/uploads/salted-caramel-macchiato-featured-image-1.jpg",
    price: "6.70",
  ),
  FavoriteCardModel(
    title: "Caffe Mocha",
    subTitle: "Large Almond milk",
    imageUrl: "https://i.pinimg.com/originals/2c/38/41/2c38414c6051b62fa0c1f81ee3942085.jpg",
    price: "7.00",
  ),
  FavoriteCardModel(
    title: "Traditional Cappuccino",
    subTitle: "Blue Ridge Blend",
    imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Cappuccino_at_Sightglass_Coffee.jpg/640px-Cappuccino_at_Sightglass_Coffee.jpg",
    price: "3.00",
  ),
  FavoriteCardModel(
    title: "Cinnamon Roll",
    subTitle: "Sweet breakfast pastry",
    imageUrl: "https://static01.nyt.com/images/2019/01/08/dining/ar-cinnamon-rolls/merlin_147610815_a671c63a-47a9-44a0-88fa-79a8ee282494-threeByTwoMediumAt2X.jpg",
    price: "3.50",
  ),
];