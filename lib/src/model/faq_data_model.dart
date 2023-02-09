class FaqDataModel {
  String? title;
  String? descriptions;

  FaqDataModel({this.title, this.descriptions,});
}

final List<FaqDataModel> faqDrawerlist = [
  FaqDataModel(
    title: 'What is Try and Buy Service?',
    descriptions: "This service entitles you to try out your purchases "
        "at the time of delivery, pay only for what you like and return the rest on-the-spot. Try and "
        "Buy is a paid service, available on most of the products and in 31 "
        "Cities, you can enter pin code on product page to check service availability. "
        "Try and Buy is only available on orders containing &lt;=3 items in cart. "
        "To avail this service min. order value should be Rs.1199 and above.",
  ),
  FaqDataModel(
    title: 'Why are there different prices for the same product? Is it legal?',
    descriptions: "Shoppir is an online marketplace platform that enables independent sellers to sell their products to buyers. "
        "The prices are solely decided by the sellers, and Shoppir does not interfere in the same. "
        "There could be a possibility that the same product is sold by different sellers at different prices."
        " Shoppir rightfully fulfils all legal compliances of onboarding multiple sellers on its forum as it is a marketplace platform.",
  ),
  FaqDataModel(
    title: 'Why will My Cashback not be available on Shoppir?',
    descriptions: "To make your shopping experience easier and simpler,"
        " 'My Cashback' will be replaced by PhonePe. PhonePe wallet can be used on Shoppir and other PhonePe partners."
        " To use your PhonePe balance, you will have to activate/verify your PhonePe account",
  ),
  FaqDataModel(
    title: 'How do I cancel the order, I have placed?',
    descriptions: "Order can be canceled till the same is out for delivery. "
        "Note: This may not be applicable for certain logistics partner. "
        "You would see an option to cancel within 'My Orders' section under the main menu of your App/Website/M-site then select the item or order you want to cancel. In case you are unable to cancel the order from'My Orders' section, "
        "you can refuse it at the time of delivery and refund will be processed into the source account, "
        "if order amount was paid online.",
  ),
  FaqDataModel(
    title: 'How do I create a Return Request?',
    descriptions: 'You can create a Return in three simple steps\n'
        '\n 1.Tap on MyOrders\n'

        '\n 2.Choose the item to be Returned\n'

        '\n 3.Enter details requested and create a return request',
  ),
];