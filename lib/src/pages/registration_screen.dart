import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/app_utility/validation.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/pages/login_screen.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'otp_verification_page.dart';
import 'verification_code_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  Map<String, TextEditingController> controllers = {
    'name': new TextEditingController(),
    'email': new TextEditingController(),
    'password': new TextEditingController(),
  };

  Map<String, FocusNode> focusNodes = {
    'name': new FocusNode(),
    'email': new FocusNode(),
    'password': new FocusNode(),
  };

  Map<String, String> errorMessages = {
    'name': "",
    'email': "",
    'password': "",
  };

  bool hidePassword = true;
  OverlayEntry? overlayEntry;
  bool isSignUpScreen = false;
  void togglePasswordVisibility1() =>
      setState(() => hidePassword = !hidePassword);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);

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

    //Check full name field
    checkFullName(value, fieldName, {onchange = false}) {
      if (Validation().isNotEmpty(value.trim())) {
        if (Validation().validateNameField(value.trim())) {
          setState(() {
            errorMessages[fieldName] = '';
          });
        }
        else {
          setState(() {
            if (!onchange) {
              errorMessages[fieldName] = appString.trans(context,appString.pleaseEnterFullName);
            } else{
              setState(() {
                errorMessages[fieldName] = "";
              });
            }
          });
        }
      } else {
        setState(() {
          if (!onchange) {
            if (fieldName == 'name'){
              errorMessages[fieldName] = appString.trans(context,appString.pleaseEnterCorrectName);
            }
          }else{
            setState(() {
              errorMessages[fieldName] = appString.trans(context,appString.pleaseEnterFullName);
            });
          }
        });
      }
    }

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
      if (controllers['name']?.text == null ||
          controllers['name']?.text == '') {
        setState(() {
          if (isButtonClicked) {
            errorMessages['name'] = appString.trans(context, appString.pleaseEnterFullName);
          }
        });
        return false;
      } else if (!Validation().validateNameField(controllers['name']?.text ?? "")) {
        setState(() {
          if (isButtonClicked) {
            errorMessages['name'] = appString.trans(context, appString.pleaseEnterCorrectName);
          }
        });
        return false;
      } else if (controllers['email']?.text == null ||
          controllers['email']?.text == '') {
        setState(() {
          if (isButtonClicked) {
            errorMessages['email'] = appString.trans(context, appString.pleaseEnterEmail);
          }
        });
        return false;
      } else if (!Validation().validateEmail(controllers['email']?.text ?? "")) {
        setState(() {
          if (isButtonClicked) {
            errorMessages['email'] = appString.trans(context, appString.pleaseEnterCorrectEmail);
          }
        });
        return false;
      } else if (controllers['password']?.text == null ||
          controllers['password']?.text == '') {
        setState(() {
          if (isButtonClicked) {
            errorMessages['password'] = appString.trans(context, appString.pleaseEnterPassword);
          }
        });
        return false;
      } else if (!Validation().validatePassword(controllers['password']?.text ?? "")) {
        setState(() {
          if (isButtonClicked) {
            errorMessages['password'] = appString.trans(context, appString.mustContain1LetterAndNumber);
          }
        });
        return false;
      } else {
        return true;
      }
    }

    // Background Image widget
    Widget backgroundImage() {
      return Stack(
        children: [
          ShaderMask(
            shaderCallback: (bound) =>LinearGradient(
              colors: [
                appColors.appBgColorJungleGreen,
                appColors.appTransColor,
              ],
              begin:Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(bound),
            blendMode: BlendMode.dstIn,
            child: CachedNetworkImage(
              height: appDimens.heightFullScreen()/2.60,
              width: appDimens.widthFullScreen(),
              imageUrl: "http://lh3.ggpht.com/-LBkmHsPl3XU/TmMb5-qgdiI/AAAAAAAAQHA/eu3yiXNXKPU/rice-terraces-8%25255B2%25255D.jpg?imgmax=800",
              // imageUrl: "https://cdn.pixabay.com/photo/2016/11/14/02/51/rice-plantation-1822444__340.jpg",
              fit:BoxFit.fill,
            ),
          ),
          /*CommonAppBar(
            leftIconMargin: EdgeInsets.only(top: 22,left: 20),
            isHideRightIcon: true,
            title: "Bali Indonesia",
          ),*/
          Positioned(
            bottom: 15,
            left: 20,
            right: 20,
            child: Text(appString.trans(context, appString.registerText),
                style: appStyles.registerTextTextStyle(fontWeight: FontWeight.w700)
            ),
          ),
        ],
      );
    }

    // Center view widget
    Widget bottomView(){
      return Container(
        color: appColors.appBgColorJungleGreen,
        padding: EdgeInsets.only(top: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // User name field
            Container(
              padding: EdgeInsets.only(
                left: 20,right: 20,
              ),
              width: MediaQuery.of(context).size.width,
              child: CommonTextFieldWithError(
                decoration: InputDecoration(
                  hintText: appString.trans(context, appString.fullNameHintText),
                  hintStyle: appStyles.textFieldHintTextTextStyle(),
                  contentPadding: EdgeInsets.all(10).copyWith(top: 18),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(15),
                    child: iconApps.iconImage(
                        imageUrl: iconApps.userIcon,
                        iconSize: Size(15, 15),
                        imageColor: appColors.buttonBgColor),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: appColors.appBgColor1.withOpacity(0.30),
                        width: 1.5),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: appColors.appBgColor1.withOpacity(0.30),
                        width: 1.5
                    ),
                  ),
                ),
                focusNode: focusNodes['name'],
                isShowBottomErrorMsg: true,
                errorMessages: errorMessages['name']?.toString()??'',
                controllerT: controllers['name'],
                inputHeight: 50,
                errorMsgHeight: 22,
                autoFocus: false,
                errorLeftRightMargin: 0,
                maxCharLength: 25,
                capitalization: CapitalizationText.sentences,
                cursorColor: appColors.textColor,
                textInputAction: TextInputAction.next,
                borderStyle: BorderStyle.none,
                inputKeyboardType: InputKeyboardTypeWithError.text,
                errorStyle: appStyles.errorStyle(fontSize: 10),
                errorMessageStyle:appStyles.errorStyle(fontSize: 9),
                hintStyle: appStyles.textFieldHintTextTextStyle(),
                textStyle: appStyles.textFieldTextTextStyle(),
                onTextChange: (value) {
                  checkFullName(value, 'name', onchange: true);
                },
                onEndEditing: (value) {
                  checkFullName(value, 'name', onchange: true, );
                  FocusScope.of(context).requestFocus(focusNodes["email"]);
                },
              ),
            ),

            // Email field
            Container(
              padding: EdgeInsets.only(
                left: 20,right: 20,
              ),
              width: MediaQuery.of(context).size.width,
              child: CommonTextFieldWithError(
                decoration: InputDecoration(
                  hintText: appString.trans(context, appString.emailIdHintText),
                  hintStyle: appStyles.textFieldHintTextTextStyle(),
                  contentPadding: EdgeInsets.all(10).copyWith(top: 18),
                  prefixIcon: Padding(
                    padding:EdgeInsets.all(8).copyWith(top: 11),
                    child: iconApps.iconImage(
                        imageUrl: iconApps.emailIcon,
                        iconSize: Size(5, 5),
                        imageColor: appColors.buttonBgColor),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: appColors.appBgColor1.withOpacity(0.30),
                        width: 1.5),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: appColors.appBgColor1.withOpacity(0.30),
                        width: 1.5
                    ),
                  ),
                ),
                focusNode: focusNodes['email'],
                isShowBottomErrorMsg: true,
                errorMessages: errorMessages['email']?.toString()??'',
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
                errorMessageStyle:appStyles.errorStyle(fontSize: 9),
                textStyle: appStyles.textFieldTextTextStyle(),
                onTextChange: (value) {
                  checkEmail(value, 'email', onchange: true, );
                },
                onEndEditing: (value) {
                  checkEmail(value, 'email', onchange: true, );
                  FocusScope.of(context).requestFocus(focusNodes["password"]);
                },
              ),
            ),

            // password field
            Container(
              padding: EdgeInsets.only(
                left: 20,right: 20,
              ),
              width: MediaQuery.of(context).size.width,
              child: CommonTextFieldWithError(
                decoration: InputDecoration(
                  hintText: appString.trans(context, appString.passwordHintText),
                  hintStyle:  appStyles.textFieldHintTextTextStyle(),
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
                    borderSide: BorderSide(color: appColors.appBgColor1.withOpacity(0.30),
                        width: 1.5),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: appColors.appBgColor1.withOpacity(0.30),
                        width: 1.5
                    ),
                  ),
                ),
                focusNode: focusNodes['password'],
                isShowBottomErrorMsg: true,
                errorMessages: errorMessages['password']?.toString()??'',
                controllerT: controllers['password'],
                inputHeight: 50,
                errorMsgHeight: 22,
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
                errorMessageStyle:appStyles.errorStyle(fontSize: 9),
                textStyle: appStyles.textFieldTextTextStyle(),
                onTextChange: (value) {
                  checkPassword(value, 'password', onchange: true, );
                },
                onEndEditing: (value) {
                  checkPassword(value, 'password', onchange: true, );
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
              ),
            ),

            // Register button
            Container(
              margin: EdgeInsets.only(
                top: 10,
                left: 20,
                right: 20,
              ),
              child: CommonButton(
                buttonName: appString.trans(context, appString.registerText),
                buttonHeight: 50,
                buttonBorderRadius: 18,
                isBottomMarginRequired: false,
                textStyle: appStyles.buttonNameStyle(),
                backCallback: (){
                  if(_validateFields(isButtonClicked: true)){
                    Navigator.push(
                    context, SlideRightRoute(
                        widget: OtpVerificationScreen()
                    ),);
                  }
                },
              ),
            ),
            SizedBox(height: 15,),
            Text(appString.trans(context, appString.orRegisterWithText),
              style: appStyles.registerWithTextStyle(),
            ),
            SizedBox(height: 15,),
            // Sign in with online options
            Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(15).copyWith(left: 30,right: 30),
                    decoration: BoxDecoration(
                        color: appColors.appBgColor2.withOpacity(0.70),
                        borderRadius: BorderRadius.circular(20)
                    ),
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
                    padding: EdgeInsets.all(15).copyWith(left: 30,right: 30),
                    decoration: BoxDecoration(
                        color: appColors.appBgColor2.withOpacity(0.70),
                        borderRadius: BorderRadius.circular(20)
                    ),
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
                    padding: EdgeInsets.all(15).copyWith(left: 30,right: 30),
                    decoration: BoxDecoration(
                        color: appColors.appBgColor2.withOpacity(0.70),
                        borderRadius: BorderRadius.circular(20)
                    ),
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
            SizedBox(height: 25,),
            RichText(
              text: TextSpan(
                  text: appString.trans(context, appString.alreadyHaveAccountText),
                  style: appStyles.alreadyHaveAccountTextStyle(),
                  children: <InlineSpan>[
                    WidgetSpan(
                        child: SizedBox(width: 5,)
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = () {
                        Navigator.of(context).pop();
                      },
                      text: appString.trans(context, appString.loginHereText),
                      style: appStyles.alreadyHaveAccountTextStyle(
                          texColor: appColors.buttonBgColor, fontSize: 14.5, fontWeight: FontWeight.w700
                      ),
                    )
                  ]
              ),
            ),
            SizedBox(height: 15,),
          ],
        ),
      );
    }

    return ContainerFirst(
      appBarHeight: 85,
      isOverLayStatusBar: true,
      isOverLayAppBar: true,
      appBar: CommonAppBar(
        appBarRowMargin: EdgeInsets.only(top: 50,left: 20,right: 20),
        isHideRightIcon: true,
      ),
      contextCurrentView: context,
      isSingleChildScrollViewNeed: false,
      containChild: Column(
        children: [
          backgroundImage(),
          bottomView(),
        ],
      ),
    );
  }
  onPressCallback() {
    removeOverlay();
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  //for keyboard done button
  showOverlay(BuildContext context) {
    if (overlayEntry != null) return;
    OverlayState overlayState = Overlay.of(context)!;
    overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          right: 0.0,
          left: 0.0,
          child: InputDoneView(
            onPressCallback: onPressCallback,
            buttonName: "Done",
          ));
    });

    overlayState.insert(overlayEntry!);
  }

  removeOverlay() {
    if (overlayEntry != null) {
      overlayEntry!.remove();
      overlayEntry = null;
    }
  }
}