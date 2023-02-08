import 'dart:convert';
import 'package:base_flutter_app/src/app_utility/app_navigator/app_navigator.dart';
import 'package:base_flutter_app/src/model/signin_model.dart';
import 'package:base_flutter_app/src/widgets/alerts/error_alert.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/helper/local_constant.dart';
import 'package:base_flutter_app/src/model/main_app_state_model.dart';

abstract class MainAppState {
  static MainAppStateModel mainAppStateModel = MainAppStateModel();

  void updateModel({mainAppStateModelTemp}) {
    if (mainAppStateModelTemp != null) {
      mainAppStateModel = mainAppStateModelTemp;
    }
  }

  get loggedInUserAuthToken => getMainAppStateModel.loggedInUserAuth;
/*  SignInModel get loggedInUserDetails =>
      getMainAppStateModel.loggedInUserDetails;*/

  /* UserProfileDetailModel? get loggedInUserProfileDetails =>
      getMainAppStateModel.loggedInUserProfile;*/

  MainAppStateModel get getMainAppStateModel {
    return mainAppStateModel;
  }

  void logOutUser() {
    mainAppStateModel = MainAppStateModel();
  }
}

class MainAppInitStat extends MainAppState {}

class MainAppStateInProgress extends MainAppState {}

class UserAuthState extends MainAppState {
  String? loggedInUserAuth;
  UserAuthState({this.loggedInUserAuth}) {
    getMainAppStateModel.loggedInUserAuth = loggedInUserAuth!;
    updateModel(mainAppStateModelTemp: this.getMainAppStateModel);
  }
  @override
  String toString() => 'ProductAdded { todos: $getMainAppStateModel }';
}

class UserLoggedInDetailState extends MainAppState {
  SignInModel? loggedInUserDetails;
  UserLoggedInDetailState({this.loggedInUserDetails}) {
    // getMainAppStateModel.loggedInUserDetails = loggedInUserDetails;
    updateModel(mainAppStateModelTemp: this.getMainAppStateModel);
  }
  @override
  String toString() => 'ProductAdded { todos: $getMainAppStateModel }';
}

class LoggedInState extends MainAppState {
  bool isLoggedInUser;
  LoggedInState({this.isLoggedInUser = false}) {
    getMainAppStateModel.isLoggedIn = isLoggedInUser;
    updateModel(mainAppStateModelTemp: this.getMainAppStateModel);
  }
  @override
  String toString() => 'ProductAdded { todos: $getMainAppStateModel }';
}

class HomeBottomNavigationBarTapedState extends MainAppState {
  int tapedBottomBarIndex;
  String tapedBottomBarPageId;
  String? statusBarColor;
  HomeBottomNavigationBarTapedState(
      {this.tapedBottomBarIndex = 0,
        this.tapedBottomBarPageId = "",
        this.statusBarColor}) {
    getMainAppStateModel.tapedBottomBarIndex = tapedBottomBarIndex;
    getMainAppStateModel.tapedBottomBarPageId = tapedBottomBarPageId;
    //updateModel(mainAppStateModelTemp: this.getMainAppStateModel);
  }
  @override
  String toString() => 'ProductAdded { todos: $getMainAppStateModel }';
}

class LogOutUserState extends MainAppState {
  BuildContext? context;
  LogOutUserState({this.context}) {
    logOutUser();
  }
}

//Show log out error
class LogOutErrorState extends MainAppState {
  LogOutErrorState(
      {required BuildContext context,
        String? errorMessage,
        String? phone,
        int? code,
        okCallBack}) {
    ErrorAlert(
        context: context,
        message: errorMessage,
        callBackYes: (mContext) {
          if (okCallBack != null) {
            okCallBack();
          }
          else {
            appNavigator.popBackStack(mContext);

            /* else if(){

            }*/
          }
          // appNavigator.popBackStack(context);
          // appNavigator.launchVerificationCodePage(context, userEmail: emailId);
        });
  }
}