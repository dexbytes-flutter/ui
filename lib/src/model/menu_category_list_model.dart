class MenuDataModel{
  final String listIcon;
  final String listTitle;
  MenuDataModel({
    required this.listIcon,
    required this.listTitle
  });
}

final List<MenuDataModel> categoryDataList = [
      MenuDataModel(
        listTitle: "Hot coffee",
        listIcon: 'assets/images/hot_drinks.svg',
      ),
      MenuDataModel(
          listTitle : "Cold coffee",
          listIcon : 'assets/images/cold_drink.svg'
      ),
      MenuDataModel(
        listTitle: "Hot chocolate",
        listIcon: 'assets/images/hot_chocolate.svg'
      ),
      MenuDataModel(
          listTitle : "Frappes",
          listIcon: 'assets/images/frappe.svg'
      ),
      MenuDataModel(
      listTitle : "Smoothies",
      listIcon : 'assets/images/smoothies.svg'
      ),
      MenuDataModel(
      listTitle : "Milkshakes",
      listIcon : 'assets/images/milkshake.svg'
      ),
];


class MenuGridCardModel{
  final String title;
  final String subTitle;
  final String description;
  final String imageUrl;
  final String price;

  MenuGridCardModel({
    required this.title,
    required this.subTitle,
    required this.imageUrl,
    required this.description,
    required this.price
  });
}
final List<MenuGridCardModel> menuGridCardList = [

  MenuGridCardModel(
    title: "Caramel",
    subTitle: "Macchiato",
    imageUrl: "https://emilylaurae.com/wp-content/uploads/2022/10/Caramel-macchiato-4.jpg",
    description: "The caramel syrup will naturally mix with the espresso a bit, so don't worry about that layer tasting too strong. There will also be some syrup at the bottom of the drink, so you won't be left with a bitter taste in your mouth",
    price: "4.00",
  ),
  MenuGridCardModel(
    title: "Vanilla",
    subTitle: "Latte",
    imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxX755Qjtnruk62Dmh-hVtgIMkyqf8Il0K-dGKTqpEkZ99OLhxngOXGKVkR7WLHHH4prE&usqp=CAU",
    description: "A vanilla latte is an amazing take on the classic latte. The vanilla latte is made by combining robust espresso, steamed milk and is flavored with homemade vanilla syrup that is super easy to make.",
    price: "3.00"
  ),
  MenuGridCardModel(
    title: "Traditional",
    subTitle: "Cappuccino",
    imageUrl: "https://images.pexels.com/photos/2396220/pexels-photo-2396220.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    description: "The cappuccino is a classic espresso and milk drink. A common misconception is that it follows the rule of thirds: one-third espresso, one-third steamed milk and one-third foamed milk.",
    price: "3.20"
  ),
  MenuGridCardModel(
    title: "White Chocolate",
    subTitle: "Mocha",
    imageUrl: "https://mommakesdinner.com/wp-content/uploads/2022/11/Toasted-white-chocolate-mocha.jpg",
    description: "A smooth blend of white chocolate, steamed milk and espresso, generously topped with whipped cream, our white chocolate mocha is a tall glass of creamy deliciousness.",
    price: "4.20"
  ),
  MenuGridCardModel(
    title: "Caramel",
    subTitle: "Macchiato",
    imageUrl: "https://emilylaurae.com/wp-content/uploads/2022/10/Caramel-macchiato-4.jpg",
    description: "The caramel syrup will naturally mix with the espresso a bit, so don't worry about that layer tasting too strong. There will also be some syrup at the bottom of the drink, so you won't be left with a bitter taste in your mouth",
    price: "4.00",
  ),
  MenuGridCardModel(
      title: "Vanilla",
      subTitle: "Latte",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxX755Qjtnruk62Dmh-hVtgIMkyqf8Il0K-dGKTqpEkZ99OLhxngOXGKVkR7WLHHH4prE&usqp=CAU",
      description: "A vanilla latte is an amazing take on the classic latte. The vanilla latte is made by combining robust espresso, steamed milk and is flavored with homemade vanilla syrup that is super easy to make.",
      price: "3.00"
  ),
  MenuGridCardModel(
      title: "Traditional",
      subTitle: "Cappuccino",
      imageUrl: "https://images.pexels.com/photos/2396220/pexels-photo-2396220.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      description: "The cappuccino is a classic espresso and milk drink. A common misconception is that it follows the rule of thirds: one-third espresso, one-third steamed milk and one-third foamed milk.",
      price: "3.20"
  ),
  MenuGridCardModel(
      title: "White Chocolate",
      subTitle: "Mocha",
      imageUrl: "https://mommakesdinner.com/wp-content/uploads/2022/11/Toasted-white-chocolate-mocha.jpg",
      description: "A smooth blend of white chocolate, steamed milk and espresso, generously topped with whipped cream, our white chocolate mocha is a tall glass of creamy deliciousness.",
      price: "4.20"
  ),
];