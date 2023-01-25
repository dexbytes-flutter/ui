class CoffeeModel{
  final String title;
  final int id;

  CoffeeModel({
    this.title = "",
    required this.id
  });
}

 List<CoffeeModel> coffeeNameList = [
  CoffeeModel(title: "Cappuccino",id: 0),
  CoffeeModel(title: "Espresso",id: 1),
  CoffeeModel(title: "Latte",id: 2),
  CoffeeModel(title: "Cortado",id: 3),
  CoffeeModel(title: "Lungo", id: 4),
  CoffeeModel(title: "Flat White", id: 5),
  CoffeeModel(title: "Mocha", id: 6),
];