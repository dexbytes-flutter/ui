import 'package:flutter/material.dart';
import 'package:base_flutter_app/src/all_file_import/app_providers_files_link.dart';

class AppNavigator {
  //SignUpScreen
  void launchSignUpPage(BuildContext context, {bool canBackArrow = false}) {
    /*Navigator.push(
      context,
      SlideRightRoute(widget: SignUpPage()),
    );*/
  }

  void launchDashBoardScreen(BuildContext context) {
    // Navigator.pushAndRemoveUntil(
    //     context,
    //     SlideRightRoute(widget: DashboardScreen()),
    //     ModalRoute.withName("dashBoardScreen"));
  }

  Future<void> launchLogOutAndSign(BuildContext context) async {
    MainAppBloc mainAppBloc = MainAppBloc();
    mainAppBloc.add(LogOutEvent(context: context));
  }

  //SignInScreen
  void launchSignInPage(BuildContext context,
      {String userEmail = "", bool canBackArrow = false}) {
  //   Navigator.push(
  //     context,
  //     SlideRightRoute(
  //         widget: SignInPage(
  //       userEmailId: userEmail,
  //       canBackArrow: canBackArrow,
  //     )),
  //   );
  }

  //SignInScreen
  void launchVerificationCodePage(BuildContext context,
      {String userEmail = ""}) {
    // Navigator.push(
    //   context,
    //   SlideRightRoute(
    //       widget: VerificationCodePage(
    //     userEmailId: userEmail,
    //   )),
    // );
  }

  void popBackStack(BuildContext context) {
    Navigator.pop(context);
  }
}

AppNavigator appNavigator = AppNavigator();
