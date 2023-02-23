import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/app_utility/validation.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar.dart';
import 'package:flutter/material.dart';

import '../all_file_import/app_utils_files_link.dart';
import 'forgot_password_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  Map<String, TextEditingController> controllers = {
    'new_password': new TextEditingController(),
    'confirm_password': new TextEditingController(),
  };

  Map<String, FocusNode> focusNodes = {
    'new_password': new FocusNode(),
    'confirm_password': new FocusNode(),
  };

  Map<String, String> errorMessages = {
    'new_password': "",
    'confirm_password': "",
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    //Check password field
    checkPassword(value, fieldName, {onchange = false}) {
      if (Validation().isNotEmpty(value.trim())) {
        setState(() {
          if (Validation().validatePassword(value.trim())) {
            errorMessages[fieldName] = '';
          } else {
            if (!onchange) {
              errorMessages[fieldName] = appString.trans(context, appString.pleaseEnterPassword);
              // errorMessages[fieldName] = "Please correct enter password";
            }
          }
        });
      } else {
        setState(() {
          if (!onchange) {
            if (fieldName == 'password') {
              errorMessages[fieldName] = appString.trans(context, appString.pleaseEnterCorrectPassword);
            }
          }
        });
      }
    }

    // Validation on button click
    bool _validateFields({isButtonClicked = false}) {
      if (controllers['new_password']?.text.trim() == null ||
          controllers['new_password']?.text.trim() == '') {
        setState(() {
          if (isButtonClicked) {
            errorMessages['new_password'] =
                appString.trans(context, appString.pleaseEnterNewPassword);
          }
        });
        return false;
      }else if (controllers['confirm_password']?.text.trim() == null ||
          controllers['confirm_password']?.text.trim() == '') {
        setState(() {
          if (isButtonClicked) {
            errorMessages['confirm_password'] =
                appString.trans(context, appString.pleaseEnterConfirmPassword);
          }
        });
        return false;
      } else {
        return true;
      }
    }

    //Check password on change
    _checkPassword(value, fieldName, {onchange = false}) {
      if (Validation().isNotEmpty(value)) {
        setState(() {
          if (value.length >= 6) {
            errorMessages['new_password'] = "";
            errorMessages['confirm_password'] = "";
            if (Validation().onlyNumberAndCharacter(controllers[fieldName]!.text.trim())) {
              if ((controllers['confirm_password']?.text != null &&
                  controllers['confirm_password']?.text != "") &&
                  controllers['new_password']?.text !=
                      controllers['confirm_password']?.text) {
                errorMessages['confirm_password'] = appString.trans(context, appString.passwordMustBeSame);
              } else {
                errorMessages['new_password'] = "";
                errorMessages['confirm_password'] = "";
              }
            } else {
              if (!onchange) {
                errorMessages[fieldName] = appString.trans(
                    context, appString.mustContain1LetterAndNumber);
              }
            }
          } else {
            if (!onchange) {
              errorMessages[fieldName] = appString.trans(
                  context, appString.mustContain1LetterAndNumber);
            }
          }
        });
      } else {
        setState(() {
          if (!onchange) {
            if (fieldName == 'new_password') {
              errorMessages[fieldName] =
                  appString.trans(context, appString.pleaseEnterNewPassword);
            } else if (fieldName == 'confirm_password') {
              errorMessages[fieldName] =
                  appString.trans(context, appString.pleaseEnterConfirmPassword);
            }
          }
        });
      }
    }

    //Check confirm password on change
    _checkConfirmPassword(value, fieldName, {onchange = false}) {
      if (Validation().isNotEmpty(value)) {
        setState(() {
          if ((controllers['confirm_password']?.text != null &&
              controllers['confirm_password']?.text != "") &&
              controllers['new_password']?.text !=
                  controllers['confirm_password']?.text) {
            errorMessages[fieldName] = appString.trans(
                context, appString.passwordMustBeSame);
          } else {
            errorMessages[fieldName] = "";
          }
        });
      } else {
        setState(() {
          if (!onchange) {
            if (fieldName == 'confirm_password') {
              errorMessages[fieldName] =
                  appString.trans(context, appString.pleaseEnterConfirmPassword);
            }
          }
        });
      }
    }


    // Screen title
    Widget screenTitle(){
      return Padding(
        padding: const EdgeInsets.only(top: 80,left: 20,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(appString.trans(context, appString.resetPasswordTitleText),
                style: appStyles.commonTitleStyle(fontSize: 30)),
            SizedBox(height: 15,),
            Text(appString.trans(context, appString.resetPasswordSubTitleText),
                style: appStyles.commonSubTitleTextStyle(fontSize: 15)),
            SizedBox(height: 45,),
            // New password field
            Container(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              width: MediaQuery.of(context).size.width,
              child: CommonTextFieldWithError(
                decoration: InputDecoration(
                  hintText: appString.trans(context, appString.passwordHintText),
                  hintStyle: appStyles.textFieldHintTextTextStyle(),
                  contentPadding: EdgeInsets.all(10).copyWith(top: 18),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(15),
                    child: iconApps.iconImage(
                        imageUrl: iconApps.passwordIcon,
                        iconSize: Size(10, 10),
                        imageColor: appColors.buttonBgColor),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: appColors.appBgColor1.withOpacity(0.30),
                        width: 1.5),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: appColors.appBgColor1.withOpacity(0.30),
                        width: 1.5),
                  ),
                ),
                focusNode: focusNodes['new_password'],
                isShowBottomErrorMsg: true,
                errorMessages: errorMessages['new_password']?.toString() ?? '',
                controllerT: controllers['new_password'],
                inputHeight: 50,
                errorMsgHeight: 22,
                autoFocus: false,
                obscureText: true,
                errorLeftRightMargin: 0,
                maxCharLength: 10,
                capitalization: CapitalizationText.sentences,
                cursorColor: appColors.textColor,
                textInputAction: TextInputAction.done,
                borderStyle: BorderStyle.none,
                inputKeyboardType: InputKeyboardTypeWithError.password,
                errorStyle: appStyles.errorStyle(fontSize: 10),
                errorMessageStyle: appStyles.errorStyle(fontSize: 9),
                textStyle: appStyles.textFieldTextTextStyle(),
                onTextChange: (value) {
                  _checkPassword(value, 'new_password', onchange: true,);
                },
                onEndEditing: (value) {
                  _checkPassword(value, 'new_password', onchange: true,);
                  FocusScope.of(context).requestFocus(focusNodes["confirm_password"]);
                },
              ),
            ),
            SizedBox(height: 5,),

            // Confirm password field
            Container(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              width: MediaQuery.of(context).size.width,
              child: CommonTextFieldWithError(
                decoration: InputDecoration(
                  hintText: appString.trans(context, appString.passwordHintText),
                  hintStyle: appStyles.textFieldHintTextTextStyle(),
                  contentPadding: EdgeInsets.all(10).copyWith(top: 18),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(15),
                    child: iconApps.iconImage(
                        imageUrl: iconApps.passwordIcon,
                        iconSize: Size(10, 10),
                        imageColor: appColors.buttonBgColor),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: appColors.appBgColor1.withOpacity(0.30),
                        width: 1.5),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: appColors.appBgColor1.withOpacity(0.30),
                        width: 1.5),
                  ),
                ),
                focusNode: focusNodes['confirm_password'],
                isShowBottomErrorMsg: true,
                errorMessages: errorMessages['confirm_password']?.toString() ?? '',
                controllerT: controllers['confirm_password'],
                inputHeight: 50,
                errorMsgHeight: 22,
                autoFocus: false,
                obscureText: true,
                errorLeftRightMargin: 0,
                maxCharLength: 10,
                capitalization: CapitalizationText.sentences,
                cursorColor: appColors.textColor,
                textInputAction: TextInputAction.done,
                borderStyle: BorderStyle.none,
                inputKeyboardType: InputKeyboardTypeWithError.password,
                errorStyle: appStyles.errorStyle(fontSize: 10),
                errorMessageStyle: appStyles.errorStyle(fontSize: 9),
                textStyle: appStyles.textFieldTextTextStyle(),
                onTextChange: (value) {
                  _checkConfirmPassword(value, 'confirm_password', onchange: true,);
                },
                onEndEditing: (value) {
                  _checkConfirmPassword(value, 'confirm_password', onchange: true,);
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
              ),
            ),
            SizedBox(height: 140,),
            Container(
              child: CommonButton(
                buttonName: appString.trans(context, appString.updatePasswordButtonText),
                buttonHeight: 50,
                buttonBorderRadius: 18,
                isBottomMarginRequired: false,
                textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: appColors.textNormalColor1),
                backCallback: () {
                  if (_validateFields(isButtonClicked: true)) {
                    // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                    //   return OtpVerificationScreen(
                    //     isSignUpScreen: this.isSignUpScreen,
                    //   );
                    // }), (route) => false);
                  }
                },
              ),
            ),
          ],
        ),
      );
    }

    return ContainerFirst(
        appBarHeight: 56,
        isOverLayStatusBar: true,
        statusBarColor: Colors.white,
        isSingleChildScrollViewNeed: false,
        contextCurrentView: context,
        appBar: CommonAppBar(
          leftIconMargin: EdgeInsets.only(top: 22, left: 20),
          isHideRightIcon: true,
        ),
        containChild: Column(
          children: [
            screenTitle(),
          ],
        )
    );
  }
}
