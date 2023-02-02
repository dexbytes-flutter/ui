class MenuDataModel{
  final String listIcon;
  final String listTitle;
  final List<MenuGridCardModel> gridItemList;
  MenuDataModel({
    required this.listIcon,
    required this.listTitle,
    required this.gridItemList,
  });
}

final List<MenuDataModel> categoryDataList = [
      MenuDataModel(
        listTitle: "Hot coffee",
        listIcon: 'assets/images/hot_drinks.svg',
        gridItemList: [
          MenuGridCardModel(
            title: "Cappuccino",
            subTitle: "The Spruce Eats",
            imageUrl: "https://images.pexels.com/photos/2396220/pexels-photo-2396220.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
            description: "It’s an iced coffee drink made from fresh espresso and frothed milk, and it combines the refreshment of a cold coffee with the robust flavor of a double espresso.",
            price: "4.00",
          ),
          MenuGridCardModel(
              title: "Espresso",
              subTitle: "A Couple Cook",
              imageUrl: "https://cafe1820.com/wp-content/uploads/2020/03/espresso-P3VSFDV-scaled.jpg",
              description: "espresso is a concentrated form of coffee brewed with high pressure, hot water and finely ground coffee beans. Espresso is thicker than regular coffee and has a layer of “crema” on top, which results from air bubbles mixing with the coffee’s oils.",
              price: "3.00"
          ),
         /* MenuGridCardModel(
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
          ),*/
        ]
      ),
      MenuDataModel(
          listTitle : "Cold coffee",
          listIcon : 'assets/images/cold_drink.svg',
        gridItemList: [
          MenuGridCardModel(
            title: "Pistachio Cream",
            subTitle: "Cold Brew",
            imageUrl: "https://www.mashed.com/img/gallery/we-tried-the-new-pistachio-cream-cold-brew-it-will-chase-your-winter-blues-away/l-intro-1672933969.jpg",
            description: "Cold brew coffee is usually made by steeping coffee in water for a number of hours at cold or ambient (room) temperature. This slow, low temp brew makes cold brew taste very different from hot brewing the same type of coffee beans: mild chocolate and mellow, low acidity fruits are common flavor notes.",
            price: "4.00",
          ),
          MenuGridCardModel(
            title: "Chocolate Cream",
            subTitle: "Cold Brew",
            imageUrl: "https://masalaandchai.com/wp-content/uploads/2022/06/cropped-Chocolate-Cream-Cold-Foam-Starbucks.jpg",
            description: "Chocolate Cream Cold Brew is coffee mixed with a combination of chocolate malt powder, vanilla syrup, cream, and milk for a sweet pick-me-up to your day. Try my Iced Sugar Cookie Latte for another cold caffeinated beverage.",
            price: "4.00",
          ),
        ]
      ),
      MenuDataModel(
        listTitle: "Bagels",
        listIcon: 'assets/images/bagels.png',
        gridItemList: [
          MenuGridCardModel(
            title: "Plain Bagels",
            subTitle: "No egg",
            imageUrl: "https://www.becomebetty.com/wp-content/uploads/2017/05/20170425_063402-1024x768.jpg",
            description: "This classic Plain Bagel has a lovely golden crust, shiny and hard on the surface, with a glossy appearance unmarred by any topping. Anything that is added to a plain bagel automatically removes its claim to the name, “plain!”",
            price: "4.00",
          ),

          MenuGridCardModel(
              title: "Egg bagels",
              subTitle: "Made with egg yolks",
              imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Bagel_with_sesame_3.jpg/800px-Bagel_with_sesame_3.jpg",
              description: "The egg bagel is a bagel that is made with egg yolks or whole eggs in addition to the standard dough that contains water, salt, flour, and yeast. The egg gives the bagels a yellow tint that distinguishes them from other bagels.",
              price: "4.20"
          ),
        ]
      ),
      MenuDataModel(
          listTitle : "Donuts",
          listIcon: 'assets/images/donut.svg',
        gridItemList: [
          MenuGridCardModel(
            title: "Yeast Doughnuts",
            subTitle: "Completely delicious",
            imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCEYEizH65ZJFijwbVSQ-6-oLdKcLzKcKAHg&usqp=CAU",
            description: "a small cake of sweetened or, sometimes, unsweetened dough fried in deep fat, typically shaped like a ring or, when prepared with a filling, a ball. anything shaped like a thick ring; an annular object; toroid.",
            price: "4.00",
          ),
          MenuGridCardModel(
              title: "Glazed Yeast Doughnuts",
              subTitle: "Bigger bolder baking",
              imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxX755Qjtnruk62Dmh-hVtgIMkyqf8Il0K-dGKTqpEkZ99OLhxngOXGKVkR7WLHHH4prE&usqp=CAU",
              description: "Doughnuts are a kind of ring-shaped snack food popular in many countries, which are usually deep fried from flour doughs. After being fried, doughnuts can be spread with chocolate or icing on top, covered with powdered sugar or fruit, or glazed with sugar icing.",
              price: "3.00"
          ),
        ]
      ),
      MenuDataModel(
      listTitle : "Sandwiches",
      listIcon : 'assets/images/breakfast_sandwitch.svg',
        gridItemList: [
          MenuGridCardModel(
            title: "Grilled Chicken Sandwich",
            subTitle: "Consists of boneless",
            imageUrl: "https://jamjarkitchen.com/wp-content/uploads/2021/06/DSC_0075-1.jpg",
            description: "A chicken sandwich is a sandwich that typically consists of boneless, skinless chicken breast or thigh served between slices of bread, on a bun, or on a roll. Variations on the \"chicken sandwich\" include the chicken burger, chicken on a bun, chickwich, hot chicken, or chicken salad sandwich.",
            price: "4.00",
          ),
          MenuGridCardModel(
              title: "Seafood Sandwich",
              subTitle: "A fish sandwich",
              imageUrl: "https://assets.epicurious.com/photos/57ab9c195dc5a16b3e65cb58/6:4/w_1998,h_1332,c_limit/lobster-roll-BA-081016.jpg",
              description: "A fish sandwich is, most generally, any kind of sandwich made with fish. The term is frequently used to describe food made with breaded, fried fish, which are commonly found in fast food venues.",
              price: "3.00"
          ),
        ]
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
/*
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
];*/
