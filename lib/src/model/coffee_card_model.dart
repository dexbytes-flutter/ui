import 'package:flutter/material.dart';

class CoffeeCardModel{
  final String title;
  final String subTitle;
  final String price;
  final String imageUrl;


  CoffeeCardModel({
    required this.title,
    required this.subTitle,
    required this.imageUrl,
    required this.price,
  });
}

final List<CoffeeCardModel> coffeeCardList = [

  CoffeeCardModel(
      title: "Cappuccino",
      subTitle: "With Oat Milk",
      imageUrl: "https://images.pexels.com/photos/2396220/pexels-photo-2396220.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      price: " 3.20",
  ),
  CoffeeCardModel(
    title: "Espresso",
    subTitle: "With Oat Milk",
    imageUrl: "https://i.pinimg.com/236x/e0/0c/99/e00c996f2c5d1d77e7873eac409bd02d.jpg",
    price: " 5.20",
  ),
  CoffeeCardModel(
    title: "Latte",
    subTitle: "vanilla flavor",
    imageUrl: "https://i.pinimg.com/236x/e3/83/f9/e383f9aba12fcabbffd116323690fb57.jpg",
    price: " 3.20",
  ),
  CoffeeCardModel(
    title: "Cortado",
    subTitle: "With Oat Milk",
    imageUrl: "https://i.pinimg.com/236x/64/a9/07/64a9070d8aab5c8264e019b0518c5f1b.jpg",
    price: " 3.20",
  ),
  CoffeeCardModel(
    title: "Lungo",
    subTitle: "With Oat Milk",
    imageUrl: "https://i.pinimg.com/564x/35/aa/9e/35aa9e81089a36f7bed68e5420eb333c.jpg",
    price: " 4.20",
  ),
  CoffeeCardModel(
    title: "Flat White",
    subTitle: "With Oat Milk",
    imageUrl: "https://i.pinimg.com/564x/32/ab/5a/32ab5aeda87745d71b0187d775485c77.jpg",
    price: " 5.20",
  ),
  CoffeeCardModel(
    title: "Mocha",
    subTitle: "With Oat Milk",
    imageUrl: "https://i.pinimg.com/236x/96/51/51/965151beb59a8cbcac4e4c0fc2ff18ef.jpg",
    price: " 3.20",
  ),
];
