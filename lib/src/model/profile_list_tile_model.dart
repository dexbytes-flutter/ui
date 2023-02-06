class ProfileListTileModel{
  final String profileListTileIcon;
  final String profileListTileTitle;
  ProfileListTileModel({
    required this.profileListTileIcon,
    required this.profileListTileTitle
  });
}

final List<ProfileListTileModel> profileItemListTile = [
  ProfileListTileModel(
    profileListTileIcon: "assets/images/order_icon.svg",
    profileListTileTitle: "My order",
  ),
  ProfileListTileModel(
    profileListTileIcon: "assets/images/payment_icon.svg",
    profileListTileTitle: "Payment methods",
  ),
  ProfileListTileModel(
    profileListTileIcon: "assets/images/notification_icon1.svg",
    profileListTileTitle: "Notifications",
  ),
  ProfileListTileModel(
    profileListTileIcon: "assets/images/write_us.svg",
    profileListTileTitle: "Write to Us",
  ),
  ProfileListTileModel(
    profileListTileIcon: "assets/images/logout_icon.svg",
    profileListTileTitle: "Log out",
  ),
];