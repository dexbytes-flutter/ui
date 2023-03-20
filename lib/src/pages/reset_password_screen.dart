import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/app_utility/validation.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/pages/login_screen.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar.dart';
import 'package:flutter/material.dart';

import '../app_utility/animation/slide_left_route.dart';

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

  bool hideNewPassword = true;
  bool hideConfirmPassword = true;

  void togglePasswordVisibility1() =>
      setState(() => hideNewPassword = !hideNewPassword);
  void togglePasswordVisibility2() =>
      setState(() => hideConfirmPassword = !hideConfirmPassword);

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
      } else if (!Validation().validatePassword(controllers['new_password']?.text ?? "")) {
        setState(() {
          if (isButtonClicked) {
            errorMessages['new_password'] =
                appString.trans(context, appString.mustContain1LetterAndNumber);
          }
        });
        return false;
      } else if (controllers['confirm_password']?.text.trim() == null ||
          controllers['confirm_password']?.text.trim() == '') {
        setState(() {
          if (isButtonClicked) {
            errorMessages['confirm_password'] =
                appString.trans(context, appString.pleaseEnterConfirmPassword);
          }
        });
        return false;
      } else if (!Validation().validatePassword(controllers['confirm_password']?.text ?? "")) {
        setState(() {
          if (isButtonClicked) {
            errorMessages['confirm_password'] =
                appString.trans(context, appString.mustContain1LetterAndNumber);
          }
        });
        return false;
      } else if (controllers['new_password']?.text != controllers['confirm_password']?.text) {
        setState(() {
          if (isButtonClicked) {
            errorMessages['confirm_password'] = appString.trans(context, appString.passwordMustBeSame);
          }
        });
        return false;
      }
      else {
        return true;
      }
    }

    //Check password on change
    _checkPassword(value, fieldName, {onchange = false}) {
      if (Validation().isNotEmpty(value)) {
        setState(() {
          if (value.length >= 8) {
            errorMessages['new_password'] = "";

            if (Validation().validatePassword(controllers[fieldName]!.text.trim())) {
              setState(() {
                errorMessages['new_password'] = "";
              });
            } else {
              setState(() {
                errorMessages[fieldName] = appString.trans(context, appString.mustContain1LetterAndNumber);
              });
              // if (!onchange) {
              //   errorMessages[fieldName] = appString.trans(context, appString.mustContain1LetterAndNumber);
              // }
            }
          } else {
            setState(() {
              errorMessages[fieldName] = appString.trans(context, appString.passwordLengthError);
            });
            /*if (!onchange) {
              errorMessages[fieldName] = appString.trans(context, appString.passwordLengthError);
            }*/
          }
        });
      } else {
        setState(() {
          errorMessages[fieldName] = appString.trans(context, appString.pleaseEnterNewPassword);
         /* if (!onchange) {
            if (fieldName == 'new_password') {
              errorMessages[fieldName] = appString.trans(context, appString.pleaseEnterNewPassword);
            } else if (fieldName == 'confirm_password') {
              errorMessages[fieldName] = appString.trans(context, appString.pleaseEnterConfirmPassword);
            }
          }*/
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
          if (fieldName == 'confirm_password') {
            errorMessages[fieldName] =
                appString.trans(context, appString.pleaseEnterConfirmPassword);
          }
        });
      }
    }

    //Visibility icons
    Widget visibilityOffIcon = Icon(
      Icons.visibility_off,
      color: appColors.buttonBgColor,
      size: 20,
    );
    Widget visibilityOnIcon = Icon(
      Icons.visibility,
      color: appColors.grey,
      size: 20,
    );

    // Screen title
    Widget screenTitle(){
      return Padding(
        padding: const EdgeInsets.only(top: 30,left: 20,right: 20),
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
                  hintText: appString.trans(context, appString.newPasswordHintText),
                  hintStyle: appStyles.textFieldHintTextTextStyle(),
                  contentPadding: EdgeInsets.all(10).copyWith(top: 18),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(15),
                    child: iconApps.iconImage(
                        imageUrl: iconApps.passwordIcon,
                        iconSize: Size(10, 10),
                        imageColor: appColors.buttonBgColor),
                  ),
                  suffixIcon: IconButton(
                    icon: hideNewPassword ? visibilityOffIcon : visibilityOnIcon,
                    onPressed: togglePasswordVisibility1,
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
                errorMsgHeight: 24,
                autoFocus: false,
                obscureText: hideNewPassword,
                errorLeftRightMargin: 0,
                maxCharLength: 8,
                capitalization: CapitalizationText.sentences,
                cursorColor: appColors.textColor,
                textInputAction: TextInputAction.next,
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
            SizedBox(height: 10,),
            // Confirm password field
            Container(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              width: MediaQuery.of(context).size.width,
              child: CommonTextFieldWithError(
                decoration: InputDecoration(
                  hintText: appString.trans(context, appString.confirmPasswordHintText),
                  hintStyle: appStyles.textFieldHintTextTextStyle(),
                  contentPadding: EdgeInsets.all(10).copyWith(top: 18),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(15),
                    child: iconApps.iconImage(
                        imageUrl: iconApps.passwordIcon,
                        iconSize: Size(10, 10),
                        imageColor: appColors.buttonBgColor),
                  ),
                  suffixIcon: IconButton(
                    icon: hideConfirmPassword ? visibilityOffIcon : visibilityOnIcon,
                    onPressed: togglePasswordVisibility2,
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
                obscureText: hideConfirmPassword,
                errorLeftRightMargin: 0,
                maxCharLength: 8,
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

          ],
        ),
      );
    }

    return ContainerFirst(
        appBarHeight: 85,
        isOverLayStatusBar: true,
        isSingleChildScrollViewNeed: false,
        contextCurrentView: context,
        appBar: CommonAppBar(
          appBarRowMargin: EdgeInsets.only(top: 35,left: 20,right: 20),
          isHideRightIcon: true,
        ),
        containChild: Column(
          children: [
            screenTitle(),
          ],
        ),
      bottomMenuView: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.only(bottom: 20,right: 20,left: 20),
          child: CommonButton(
            buttonName: appString.trans(context, appString.updatePasswordButtonText),
            buttonHeight: 50,
            buttonBorderRadius: 18,
            isBottomMarginRequired: false,
            textStyle: appStyles.buttonNameStyle(),
            backCallback: () {
              if (_validateFields(isButtonClicked: true)) {
                // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                //   return OtpVerificationScreen(
                //     isSignUpScreen: this.isSignUpScreen,
                //   );
                // }), (route) => false);
                Navigator.push(
                  context,
                  SlideRightRoute(widget: SignInScreen()),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
