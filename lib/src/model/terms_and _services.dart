
class TermsAndServicesModel{
  final String title;
  final String subTitle;

  TermsAndServicesModel({
    required this.title,
    required this.subTitle
  });
}

final List<TermsAndServicesModel> termsAndServicesList = [

  TermsAndServicesModel(
      title: "YOUR AGREEMENT",
      subTitle: "By using this Site you agree to be bound by and to comply with these Terms and Conditions."
          "If you do not agree to these Terms and Conditions please do not use this site. "
          "\n\nPLEASE NOTE: We reserve the right at our sole discretion to change, modify or otherwise alter these Terms and Conditions periodically. "
          "Your continued use of the Site following the posting of changes and /or modifications will constitute your acceptance of the revised Terms and conditions and the reasonableness of these standards for notice of changes. "
          "For your information, this page was last updated as of the date at the top of these terms and conditions."
  ),
  TermsAndServicesModel(
      title: "PRIVACY",
      subTitle: "Please review our Privacy Policy. which also governs your visit to this Site, to understand our practices."
  ),

];