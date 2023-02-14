
class CoffeeCardModel{
  final String title;
  final String subTitle;
  final String price;
  final String imageUrl;
  final String description;

  CoffeeCardModel({
    required this.title,
    required this.subTitle,
    required this.imageUrl,
    required this.price,
    required this.description
  });
}

final List<CoffeeCardModel> coffeeCardList = [

  CoffeeCardModel(
      title: "Cappuccino",
      subTitle: "With Oat Milk",
      imageUrl: "https://images.pexels.com/photos/2396220/pexels-photo-2396220.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      price: " 3.20",
      description: "A cappuccino is the perfect balance of espresso, steamed milk and foam. This coffee is all about the structure and the even splitting of all elements into equal thirds. An expertly made cappuccino should be rich, but not acidic and have a mildly sweet flavouring from the milk."
  ),
  CoffeeCardModel(
    title: "Espresso",
    subTitle: "With Oat Milk",
    imageUrl: "https://i.pinimg.com/236x/e0/0c/99/e00c996f2c5d1d77e7873eac409bd02d.jpg",
    price: " 5.20",
    description: "Espresso is a concentrated form of coffee brewed with high pressure, hot water and finely ground coffee beans. Espresso is thicker than regular coffee and has a layer of “crema” on top, which results from air bubbles mixing with the coffee's oils."
  ),
  CoffeeCardModel(
    title: "Latte",
    subTitle: "vanilla flavor",
    imageUrl: "https://i.pinimg.com/236x/e3/83/f9/e383f9aba12fcabbffd116323690fb57.jpg",
    price: " 3.20",
    description: "A latte or caffè latte is a milk coffee that is a made up of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top. If you don't drink dairy milk, you can easily swap it for a plant-based alternative like soy, oat or coconut milk."
  ),
  CoffeeCardModel(
    title: "Cortado",
    subTitle: "With Oat Milk",
    imageUrl: "https://i.pinimg.com/236x/64/a9/07/64a9070d8aab5c8264e019b0518c5f1b.jpg",
    price: " 3.20",
    description: "Cortado translates to cut, meaning that the coffee is cut with milk. A cortado coffee is made of equal parts espresso and steamed milk. It is served with a double shot espresso."
  ),
  CoffeeCardModel(
    title: "Lungo",
    subTitle: "With Oat Milk",
    imageUrl: "https://i.pinimg.com/564x/35/aa/9e/35aa9e81089a36f7bed68e5420eb333c.jpg",
    price: " 4.20",
    description: "\“Long shot\” in its most basic sense, is an espresso made with more water than typical (as opposed to a ristretto espresso or coffee, which is made with less hot water than normal). A “typical” recipe for an espresso is about 1:2, or 18 grams of ground coffee to 36 grams of coffee."
  ),
  CoffeeCardModel(
    title: "Flat White",
    subTitle: "With Oat Milk",
    imageUrl: "https://i.pinimg.com/564x/32/ab/5a/32ab5aeda87745d71b0187d775485c77.jpg",
    price: " 5.20",
    description: "A flat white is a blend of micro-foamed milk poured over a single or double shot of espresso. This microfoam is steamed milk infused with air, which creates tiny air bubbles, to create a smooth and velvety texture and creamy taste."
  ),
  CoffeeCardModel(
    title: "Mocha",
    subTitle: "With Oat Milk",
    imageUrl: "https://i.pinimg.com/236x/96/51/51/965151beb59a8cbcac4e4c0fc2ff18ef.jpg",
    price: " 3.20",
    description: "A mocha coffee tastes like a chocolate-y coffee, but this description doesn't do it justice; a mocha is so much more. The bitterness of the espresso shot combined with the sweetness of the chocolate and the creaminess of the milk makes for a silky smooth, sumptuous beverage."
  ),
];
