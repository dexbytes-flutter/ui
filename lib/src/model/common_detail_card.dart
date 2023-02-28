class CommonDetailCardModel{

  final String? icon;
  final String? title;
  final String subTitle;

  CommonDetailCardModel({
    this.icon,
    this.title,
    required this.subTitle
  });
}

final List<CommonDetailCardModel> commonDetailCardList = [
  CommonDetailCardModel(
    icon: 'assets/images/mobile_icon.svg',
    title: "Phone Number",
    subTitle: "1234125792",
  ),CommonDetailCardModel(
    icon: 'assets/images/email_icon.svg',
    title: "Primary email",
    subTitle: "johndoe@gmail.com",
  ),CommonDetailCardModel(
    icon: 'assets/images/email_icon.svg',
    title: "Secondary email",
    subTitle: "abcdehq@email.com",
  ),

];