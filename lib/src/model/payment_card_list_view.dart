import 'dart:ui';

import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';

class PaymentCardListViewModel{

  final String balanceAmount;
  final String nameOnCard;
  final String ccvNumber;
  final int cardNumber;
  final String cardTypeLogo;
  final Color? logoColor;

  PaymentCardListViewModel({
    required this.balanceAmount,
    required this.nameOnCard,
    required this.ccvNumber,
    required this.cardNumber,
    required this.cardTypeLogo,
    this.logoColor
  });
}

final List<PaymentCardListViewModel> paymentCardDetailList = [
  PaymentCardListViewModel(
      balanceAmount: "72,200",
      nameOnCard: "Yona Angelina",
      ccvNumber: "04/23",
      cardNumber: 1257,
      cardTypeLogo: "https://www.cloudnext.uk/assets/img/payments/xmastercard.png.pagespeed.ic.j1MZS5x4kP.png",
    logoColor: null
  ),
  PaymentCardListViewModel(
      balanceAmount: "54,620",
      nameOnCard: "Yona Angelina",
      ccvNumber: "05/23",
      cardNumber: 7423,
      cardTypeLogo: "https://agenciatgm.com/wp-content/uploads/2020/07/visa-logo.png",
    logoColor: appColors.white
  ),
];