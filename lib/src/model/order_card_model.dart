

class OrderCardModel{
  final String title;
  final String subTitle;
  final String price;
  final String imageUrl;


  OrderCardModel({
    required this.title,
    required this.subTitle,
    required this.imageUrl,
    required this.price,
  });
}

final List<OrderCardModel> orderCardList = [

  OrderCardModel(
    title: "Espresso",
    subTitle: "Blue Ridge Blend",
    imageUrl: "https://t1.gstatic.com/images?q=tbn:ANd9GcTmzXd8YKl2Gb-L3tN1RyekLuD0lSh_T-bsd4LvjYPJPAtDsOUG",
    price: "4.20",
  ),
  OrderCardModel(
    title: "Espresso",
    subTitle: "Perfectly baked",
    imageUrl: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQcLhKFqsOsGybz1Z3dBqVhtcdmjIkBhwmcyGmjjIr6_5-wJVM1",
    price: "4.20",
  ),
  OrderCardModel(
    title: "Choco Frappe",
    subTitle: "Decaf Colombia",
    imageUrl: "https://i.pinimg.com/564x/1e/ab/79/1eab7906fe1621a5453bf896b17dc685.jpg",
    price: "4.20",
  ),
];