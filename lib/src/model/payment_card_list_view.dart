class PaymentCardListViewModel{

  final String balanceAmount;
  final String nameOnCard;
  final String ccvNumber;
  final int cardNumber;
  final String cardTypeLogo;

  PaymentCardListViewModel({
    required this.balanceAmount,
    required this.nameOnCard,
    required this.ccvNumber,
    required this.cardNumber,
    required this.cardTypeLogo
  });
}

final List<PaymentCardListViewModel> paymentCardDetailList = [
  PaymentCardListViewModel(
      balanceAmount: "72,200",
      nameOnCard: "Yona Angelina",
      ccvNumber: "04/23",
      cardNumber: 1257,
      cardTypeLogo: "assets/images/mastercard_icon.svg"
  ),
  PaymentCardListViewModel(
      balanceAmount: "54,620",
      nameOnCard: "Yona Angelina",
      ccvNumber: "05/23",
      cardNumber: 7423,
      cardTypeLogo: "assets/images/mastercard_icon.svg"
  ),
  /*
  PaymentCardListViewModel(
      balanceAmount: "54,620",
      nameOnCard: "Yona Angelina",
      ccvNumber: "05/23",
      cardNumber: 7423,
      cardTypeLogo: "assets/images/mastercard_icon.svg"
  ),
  PaymentCardListViewModel(
      balanceAmount: "54,620",
      nameOnCard: "Yona Angelina",
      ccvNumber: "05/23",
      cardNumber: 7423,
      cardTypeLogo: "assets/images/mastercard_icon.svg"
  ),*/
];