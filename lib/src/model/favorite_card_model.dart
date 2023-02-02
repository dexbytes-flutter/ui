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
    title: "Coromol Macchioto",
    subTitle: "Large, Oat milk",
    imageUrl: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTA_jecMwjbjbOEk1u8SpSRVOabXCIXfXqfPVEhEPOYU0KXQL0S",
    price: "6.70",
  ),
  FavoriteCardModel(
    title: "Caffe Mocha",
    subTitle: "Large Almond milk",
    imageUrl: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSVDLtCbQxSpZqHA5fTw2QZj9XhMWQuOUspri4FVgjO_MqLcrc0",
    price: "7.00",
  ),
  FavoriteCardModel(
    title: "Traditional Cappuccino",
    subTitle: "Blue Ridge Blend",
    imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1drxUsZfkhE1hBXjeQuGfpl1fuiA4uS6oyWbuBHcbmzNz_A_Z",
    price: "3.00",
  ),
  FavoriteCardModel(
    title: "Cinnamon Roll",
    subTitle: "",
    imageUrl: "https://i.pinimg.com/564x/4e/1e/a2/4e1ea24a47498997ed3f600e37ed8912.jpg",
    price: "3.50",
  ),
];