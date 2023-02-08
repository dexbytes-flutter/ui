class SpecialForYou{
  final String title;
  final String subTitle;
  final String price;
  final String imageUrl;
  SpecialForYou({
   required this.title,
   required this.subTitle,
   required this.price,
   required this.imageUrl
  });
}

final List<SpecialForYou> specialForYouDataList = [

  SpecialForYou(
      title: "5 Coffee Beans You \n Must Try!",
      subTitle: "",
      price: "4.20",
    imageUrl: "https://i.pinimg.com/236x/be/5e/0d/be5e0d63c8543a5d3ce502bf8fc9180c.jpg"
  ),
  SpecialForYou(
      title: "5 Coffee Beans You \n Must Try!",
      subTitle: "",
      price: "3.20",
    imageUrl: "https://i.pinimg.com/236x/be/5e/0d/be5e0d63c8543a5d3ce502bf8fc9180c.jpg"
  ),
  SpecialForYou(
      title: "5 Coffee Beans You \n Must Try!",
      subTitle: "",
      price: "3.25",
    imageUrl: "https://i.pinimg.com/236x/be/5e/0d/be5e0d63c8543a5d3ce502bf8fc9180c.jpg"
  ),
];