import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/app_utility/validation.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/pages/dashboard_screen.dart';
import 'package:base_flutter_app/src/pages/register_screen.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../all_file_import/app_utils_files_link.dart';
import 'forgot_password_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  Map<String, TextEditingController> controllers = {
    'email': new TextEditingController(),
    'password': new TextEditingController(),
  };

  Map<String, FocusNode> focusNodes = {
    'email': new FocusNode(),
    'password': new FocusNode(),
  };

  Map<String, String> errorMessages = {
    'email': "",
    'password': "",
  };

  bool hidePassword = true;

  void togglePasswordVisibility1() =>
      setState(() => hidePassword = !hidePassword);

  @override
  Widget build(BuildContext context) {
    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);

    //Check email field
    checkEmail(value, fieldName,{onchange = false}) {
      if (Validation().isNotEmpty(value.trim())) {
        if (Validation().validateEmail(value.trim())) {
          setState(() {
            errorMessages[fieldName] = '';
          });
        }
        else {
          setState(() {
            if (!onchange) {
              errorMessages[fieldName] = appString.trans(context,appString.pleaseEnterEmail);
            }else{
              setState(() {
                errorMessages[fieldName] = "";
              });
            }
          });
        }
      } else {
        setState(() {
          if (!onchange) {
            errorMessages[fieldName] = appString.trans(context,appString.pleaseEnterCorrectEmail);
          }else{
            setState(() {
              errorMessages[fieldName] = appString.trans(context,appString.pleaseEnterEmail);
            });
          }
        });
      }
    }

    //Check password field
    checkPassword(value, fieldName, {onchange = false}) {

      if (Validation().isNotEmpty(value)) {
        setState(() {
          if (value.length >= 8) {
            errorMessages['password'] = "";

            if (Validation().validatePassword(controllers[fieldName]!.text.trim())) {
              setState(() {
                errorMessages['password'] = "";
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
          errorMessages[fieldName] = appString.trans(context, appString.pleaseEnterPassword);
          /* if (!onchange) {
            if (fieldName == 'password') {
              errorMessages[fieldName] = appString.trans(context, appString.pleaseEnterNewPassword);
            } else if (fieldName == 'confirm_password') {
              errorMessages[fieldName] = appString.trans(context, appString.pleaseEnterConfirmPassword);
            }
          }*/
        });
      }
    }

    // Validation on button click
    bool _validateFields({isButtonClicked = false}) {
      if (controllers['email']?.text == null ||
          controllers['email']?.text == '') {
        setState(() {
          if (isButtonClicked) {
            errorMessages['email'] =
                appString.trans(context, appString.pleaseEnterEmail);
          }
        });
        return false;
      } else if (!Validation().validateEmail(controllers['email']?.text ?? "")) {
        setState(() {
          if (isButtonClicked) {
            errorMessages['email'] =
                appString.trans(context, appString.pleaseEnterCorrectEmail);
          }
        });
        return false;
      } else if (controllers['password']?.text == null ||
          controllers['password']?.text == '') {
        setState(() {
          if (isButtonClicked) {
            errorMessages['password'] =
                appString.trans(context, appString.pleaseEnterPassword);
          }
        });
        return false;
      } else if (!Validation().validatePassword(controllers['password']?.text ?? "")) {
        setState(() {
          if (isButtonClicked) {
            errorMessages['password'] =
                appString.trans(context, appString.pleaseEnterCorrectPassword);
          }
        });
        return false;
      } else {
        return true;
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

    // Background Image widget
    Widget backgroundImage() {
      return Stack(
        children: [
          ShaderMask(
            shaderCallback: (bound) => LinearGradient(
              colors: [
                appColors.appTransColor.withOpacity(0.10),
                appColors.appBgColorJungleGreen
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(bound),
            blendMode: BlendMode.darken,
            child: CachedNetworkImage(
              height: appDimens.heightFullScreen() / 3.5,
              width: appDimens.widthFullScreen(),
              imageUrl:
                  "https://img.freepik.com/free-photo/beautiful-scenery-emerald-lake-yoho-national-park-british-columbia-canada_181624-6877.jpg?w=2000",
              fit: BoxFit.cover,
            ),
          ),
          CommonAppBar(
            leftIconMargin: EdgeInsets.only(top: 22, left: 20),
            isHideRightIcon: true,
            title: "Bali Indonesia",
          ),
          /*Positioned(
            top: 250,
            left: 20,
            child: Text(appString.trans(context, appString.loginText),
                style: appStyles.registerTextTextStyle()),
          ),*/
        ],
      );
    }

    // Center view widget
    Widget bottomView() {
      return Container(
        color: appColors.appBgColorJungleGreen,
        padding: EdgeInsets.only(top: 15,left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(appString.trans(context, appString.loginText),
                style: appStyles.registerTextTextStyle()),
            SizedBox(height: 15,),
            // Email field
            Container(
              width: MediaQuery.of(context).size.width,
              child: CommonTextFieldWithError(
                decoration: InputDecoration(
                  hintText: appString.trans(context, appString.emailIdHintText),
                  hintStyle: appStyles.textFieldHintTextTextStyle(),
                  contentPadding: EdgeInsets.all(10).copyWith(top: 18),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(15),
                    child: iconApps.iconImage(
                        imageUrl: iconApps.emailIcon,
                        iconSize: Size(8, 10),
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
                focusNode: focusNodes['email'],
                isShowBottomErrorMsg: true,
                errorMessages: errorMessages['email']?.toString() ?? '',
                controllerT: controllers['email'],
                inputHeight: 50,
                errorMsgHeight: 22,
                autoFocus: false,
                errorLeftRightMargin: 0,
                maxCharLength: 25,
                capitalization: CapitalizationText.none,
                cursorColor: appColors.textColor,
                textInputAction: TextInputAction.next,
                borderStyle: BorderStyle.none,
                inputKeyboardType: InputKeyboardTypeWithError.email,
                errorStyle: appStyles.errorStyle(fontSize: 10),
                errorMessageStyle: appStyles.errorStyle(fontSize: 9),
                textStyle: appStyles.textFieldTextTextStyle(),
                onTextChange: (value) {
                  checkEmail(
                    value,
                    'email',
                    onchange: true,
                  );
                },
                onEndEditing: (value) {
                  checkEmail(
                    value,
                    'email',
                    onchange: true,
                  );
                  FocusScope.of(context).requestFocus(focusNodes["password"]);
                },
              ),
            ),

            // password field
            Container(
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
                    suffixIcon: IconButton(
                    icon: hidePassword ? visibilityOffIcon : visibilityOnIcon,
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
                focusNode: focusNodes['password'],
                isShowBottomErrorMsg: true,
                errorMessages: errorMessages['password']?.toString() ?? '',
                controllerT: controllers['password'],
                inputHeight: 50,
                errorMsgHeight: 24,
                autoFocus: false,
                obscureText: hidePassword,
                errorLeftRightMargin: 0,
                maxCharLength: 8,
                capitalization: CapitalizationText.none,
                cursorColor: appColors.textColor,
                textInputAction: TextInputAction.done,
                borderStyle: BorderStyle.none,
                inputKeyboardType: InputKeyboardTypeWithError.password,
                errorStyle: appStyles.errorStyle(fontSize: 10),
                errorMessageStyle: appStyles.errorStyle(fontSize: 9),
                textStyle: appStyles.textFieldTextTextStyle(),
                onTextChange: (value) {
                  checkPassword(
                    value,
                    'password',
                    onchange: true,
                  );
                },
                onEndEditing: (value) {
                  checkPassword(
                    value,
                    'password',
                    onchange: true,
                  );
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
              ),
            ),
            SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  SlideRightRoute(widget: ForgotPasswordScreen()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(appString.trans(context, appString.forgotText),
                    style: appStyles.textFieldHintTextTextStyle(texColor: appColors.buttonBgColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            // Login button
            Container(
              child: CommonButton(
                buttonName: appString.trans(context, appString.loginText),
                buttonHeight: 50,
                buttonBorderRadius: 18,
                isBottomMarginRequired: false,
                textStyle: appStyles.buttonNameStyle(),
                backCallback: () {
                  if (_validateFields(isButtonClicked: true)) {
                    Navigator.push(
                      context,
                      SlideRightRoute(widget: DashBoardPage()),
                    );
                    // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                    //   return OtpVerificationScreen(
                    //     isSignUpScreen: this.isSignUpScreen,
                    //   );
                    // }), (route) => false);
                  }
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                appString.trans(context, appString.orRegisterWithText),
                style: appStyles.registerWithTextStyle(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            // Sign in with online options
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(15).copyWith(left: 30, right: 30),
                    decoration: BoxDecoration(
                        color: appColors.appBgColor2.withOpacity(0.70),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        iconApps.iconImage(
                            imageUrl: iconApps.appleLogo,
                            iconSize: Size(20, 20),
                            imageColor: appColors.textColor),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15).copyWith(left: 30, right: 30),
                    decoration: BoxDecoration(
                        color: appColors.appBgColor2.withOpacity(0.70),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        iconApps.iconImage(
                            imageUrl: iconApps.googleIcon,
                            iconSize: Size(20, 20),
                            imageColor: appColors.iconColor1),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15).copyWith(left: 30, right: 30),
                    decoration: BoxDecoration(
                        color: appColors.appBgColor2.withOpacity(0.70),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        iconApps.iconImage(
                            imageUrl: iconApps.facebookIcon,
                            iconSize: Size(25, 25),
                            imageColor: appColors.iconColor1),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                    text: appString.trans(context, appString.newUserText),
                    style: appStyles.alreadyHaveAccountTextStyle(),
                    children: <InlineSpan>[
                      WidgetSpan(
                          child: SizedBox(
                        width: 5,
                      )),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              SlideRightRoute(widget: RegisterScreen()),
                            );
                          },
                        text:
                            appString.trans(context, appString.registerHereText),
                        style: appStyles.alreadyHaveAccountTextStyle(
                            texColor: appColors.buttonBgColor,
                            fontSize: 14.5,
                            fontWeight: FontWeight.w700),
                      )
                    ]),
              ),
            ),
            SizedBox(height: 15,)
          ],
        ),
      );
    }

    return ContainerFirst(
      appBarHeight: -1,
      isOverLayStatusBar: true,
      appBackgroundColor: appColors.appBgColorJungleGreen,
      statusBarColor: Colors.white,
      isSingleChildScrollViewNeed: false,
      contextCurrentView: context,
      containChild: ShaderMask(
        shaderCallback: (bound) => LinearGradient(
          colors: [
            appColors.appTransColor.withOpacity(0.30),
            appColors.appBgColorJungleGreen.withOpacity(0.30)
          ],
          begin: Alignment.center,
          end: Alignment.bottomCenter,
        ).createShader(bound),
        blendMode: BlendMode.darken,
        child: Column(
          children: [
            backgroundImage(),
            bottomView()
          ],
        ),
      ),
    );
  }
}
