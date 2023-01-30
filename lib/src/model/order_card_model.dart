

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
    subTitle: "Perfectly baked, hearty and full \nof flavour.",
    imageUrl: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQcLhKFqsOsGybz1Z3dBqVhtcdmjIkBhwmcyGmjjIr6_5-wJVM1",
    price: "4.20",
  ),
  OrderCardModel(
    title: "Choco Frappe",
    subTitle: "Decaf Colombia",
    imageUrl: "https://i.pinimg.com/564x/1e/ab/79/1eab7906fe1621a5453bf896b17dc685.jpg",
    price: "4.20",
  ),
  /*OrderCardModel(
    title: "Cortado",
    subTitle: "With Oat Milk",
    imageUrl: "https://i.pinimg.com/236x/64/a9/07/64a9070d8aab5c8264e019b0518c5f1b.jpg",
    price: "4.20",
  ),
  OrderCardModel(
    title: "Lungo",
    subTitle: "With Oat Milk",
    imageUrl: "https://i.pinimg.com/564x/35/aa/9e/35aa9e81089a36f7bed68e5420eb333c.jpg",
    price: "4.20",
  ),
  OrderCardModel(
    title: "Flat White",
    subTitle: "With Oat Milk",
    imageUrl: "https://i.pinimg.com/564x/32/ab/5a/32ab5aeda87745d71b0187d775485c77.jpg",
    price: "4.20",
  ),
  OrderCardModel(
    title: "Mocha",
    subTitle: "With Oat Milk",
    imageUrl: "https://i.pinimg.com/236x/96/51/51/965151beb59a8cbcac4e4c0fc2ff18ef.jpg",
    price: "4.20",
  ),*/
];