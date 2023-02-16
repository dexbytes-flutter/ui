import 'dart:io';

import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/app_utility/validation.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar.dart';
import 'package:base_flutter_app/src/widgets/basic_view_container/container_first.dart';
import 'package:base_flutter_app/src/widgets/country_code_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  Map<String, TextEditingController> controllers = {
    'phone': new TextEditingController(),
    'password': new TextEditingController(),
  };

  Map<String, FocusNode> focusNodes = {
    'phone': new FocusNode(),
    'password': new FocusNode(),
  };

  Map<String, String> errorMessages = {
    'phone': "",
    'password': "",
  };

  bool hideNewPassword = true;
  String phoneNumber = '';
  String countryCode = 'in';
  OverlayEntry? overlayEntry;
  bool isSignUpScreen = false;
  void togglePasswordVisibility1() =>
      setState(() => hideNewPassword = !hideNewPassword);

  @override
  void initState() {
    // TODO: implement initState
    focusNodes['phone']!.addListener(() {
      if (Platform.isIOS) {
        bool hasFocus = focusNodes['phone']!.hasFocus;
        if (hasFocus)
          showOverlay(context);
        else
          removeOverlay();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controllers['phone']?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    //Check phone field
    checkMobileNumber(value, {fieldName,onchange = false}) {
      if (Validation().isNotEmpty(value.trim())) {
        String mobile = value.trim();
        mobile = mobile.trim().toString().replaceAll(" ", '');
        phoneNumber = mobile.trim().toString().replaceAll(" ", '');
        if (Validation().validatePhoneNumber(mobile)) {
          setState(() {
            errorMessages[fieldName] = '';
          });
        }
        else {
          setState(() {
            if (!onchange) {
              errorMessages[fieldName] = appString.trans(context,appString.phoneNumber);
            }
          });
        }
      } else {
        setState(() {
          if (!onchange) {
            errorMessages[fieldName] = appString.trans(context,appString.correctPhone);
          }
        });
      }
    }

    //Check password field
    checkPassword(value, fieldName, {onchange = false}) {
      if (Validation().isNotEmpty(value.trim())) {
        setState(() {
          if (Validation().validatePassword(value.trim())) {
            errorMessages[fieldName] = '';
          } else {
            if (!onchange) {
              errorMessages[fieldName] = appString.trans(context, appString.enterCorrectPassword);
              // errorMessages[fieldName] = "Please correct enter password";
            }
          }
        });
      } else {
        setState(() {
          if (!onchange) {
            if (fieldName == 'name') {
              errorMessages[fieldName] = appString.trans(context, appString.enterPassword1);
              // errorMessages[fieldName] = "Please enter password";
            }
          }
        });
      }
    }


    // Validation on button click
    bool _validateFields({isButtonClicked = false}) {
      if (controllers['phone']?.text == null ||
          controllers['phone']?.text == '') {
        setState(() {
          if (isButtonClicked) {
            errorMessages['phone'] = appString.trans(context, appString.phoneNumber);
            // errorMessages['phone'] = "Please enter mobile number";
          }
        });
        return false;
      } else if (!Validation().validatePhoneNumber(controllers['phone']?.text ?? "")) {
        setState(() {
          if (isButtonClicked) {
            errorMessages['phone'] = appString.trans(context, appString.enterCorrectPassword);
            // errorMessages['phone'] = "Invalid mobile number";
          }
        });
        return false;
      } else if (controllers['password']?.text == null ||
          controllers['password']?.text == '') {
        setState(() {
          if (isButtonClicked) {
            errorMessages['password'] = appString.trans(context, appString.pleaseEnterPassword);
            // errorMessages['password'] = "Please enter name";
          }
        });
        return false;
      } else if (!Validation().validatePassword(controllers['password']?.text ?? "")) {
        setState(() {
          if (isButtonClicked) {
            errorMessages['password'] = appString.trans(context, appString.enterPassword);
            // errorMessages['password'] = "Please enter name";
          }
        });
        return false;
      } else {
        return true;
      }
    }

    Widget visibilityOffIcon = Icon(
      Icons.visibility_off,
      color: Colors.grey.shade300,
      size: 25,
    );

    Widget visibilityOnIcon = Icon(
      Icons.visibility,
      color:  Colors.grey.shade300,
      size: 25,
    );

    // Background Image widget
    Widget backgroundImage() {
      return ShaderMask(
        shaderCallback: (rectangle) =>LinearGradient(
          colors: [appColors.black.withOpacity(0.30),appColors.appBgColorJungleGreen.withOpacity(0.30)],
          begin:Alignment.bottomCenter,
          end: Alignment.topCenter,
        ).createShader(Rect.fromLTRB(0, 0, rectangle.width, rectangle.height)),
        blendMode: BlendMode.darken,
        child: Stack(
          children: [
            CachedNetworkImage(
              height: MediaQuery.of(context).size.height/2.8,
              width: MediaQuery.of(context).size.width,
              imageUrl: "https://i.pinimg.com/originals/b8/11/1e/b8111ed58cad6e9dfeab5a02d13fec86.jpg",
              fit:BoxFit.fill,
            ),
            CommonAppBar(
              leftIconMargin: EdgeInsets.only(top: 22,left: 20),
              isHideRightIcon: true,
              title: "Bali Indonesia",
            ),
            Positioned(
              top: 190,
              left: 20,
              child: Text(appString.trans(context, appString.registerText),
                  style: appStyles.registerTextTextStyle(fontWeight: FontWeight.w700)),
            ),

          ],
        ),
      );

      /*ShaderMask(
        shaderCallback: (bound) =>LinearGradient(
          colors: [appColors.appBgColorJungleGreen.withOpacity(0.50),appColors.appBgColorJungleGreen.withOpacity(0.60)],
          begin:Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bound),
        blendMode: BlendMode.darken,
        child: CachedNetworkImage(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          imageUrl: "https://lh3.ggpht.com/-LBkmHsPl3XU/TmMb5-qgdiI/AAAAAAAAQHA/eu3yiXNXKPU/rice-terraces-8%25255B2%25255D.jpg?imgmax=800",
          fit:BoxFit.cover,
        ),
      );*/
    }

    // Center view widget
    Widget bottomView(){
      return ShaderMask(
        shaderCallback: (rectangle) =>LinearGradient(
          colors: [appColors.appBgColorJungleGreen.withOpacity(0.45),appColors.appBgColorJungleGreen.withOpacity(0.30)],
          begin:Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(Rect.fromLTRB(0, rectangle.top, rectangle.right, rectangle.height)),
        blendMode: BlendMode.dstOver,
        child: Container(
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
                  maxCharLength: 16,
                  capitalization: CapitalizationText.sentences,
                  cursorColor: appColors.textColor,
                  textInputAction: TextInputAction.done,
                  borderStyle: BorderStyle.none,
                  inputKeyboardType: InputKeyboardTypeWithError.text,
                  errorStyle: appStyles.errorStyle(fontSize: 10),
                  errorMessageStyle:appStyles.errorStyle(fontSize: 9),
                  hintStyle: appStyles.textFieldHintTextTextStyle(),
                  textStyle: appStyles.textFieldTextTextStyle(),
                  onTextChange: (value) {
                    checkPassword(value, 'name', onchange: false, );
                  },
                  onEndEditing: (value) {
                    checkPassword(value, 'name', onchange: false, );
                    FocusScope.of(context).requestFocus(new FocusNode());
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
                      padding: EdgeInsets.all(15),
                      child: iconApps.iconImage(
                          imageUrl: iconApps.emailIcon,
                          iconSize: Size(8, 10),
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
                  maxCharLength: 16,
                  capitalization: CapitalizationText.sentences,
                  cursorColor: appColors.textColor,
                  textInputAction: TextInputAction.done,
                  borderStyle: BorderStyle.none,
                  inputKeyboardType: InputKeyboardTypeWithError.email,
                  errorStyle: appStyles.errorStyle(fontSize: 10),
                  errorMessageStyle:appStyles.errorStyle(fontSize: 9),
                  textStyle: appStyles.textFieldTextTextStyle(),
                  onTextChange: (value) {
                    checkPassword(value, 'email', onchange: false, );
                  },
                  onEndEditing: (value) {
                    checkPassword(value, 'email', onchange: false, );
                    FocusScope.of(context).requestFocus(new FocusNode());
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
                  errorLeftRightMargin: 0,
                  maxCharLength: 16,
                  capitalization: CapitalizationText.sentences,
                  cursorColor: appColors.textColor,
                  textInputAction: TextInputAction.done,
                  borderStyle: BorderStyle.none,
                  inputKeyboardType: InputKeyboardTypeWithError.password,
                  errorStyle: appStyles.errorStyle(fontSize: 10),
                  errorMessageStyle:appStyles.errorStyle(fontSize: 9),
                  textStyle: appStyles.textFieldTextTextStyle(),
                  onTextChange: (value) {
                    checkPassword(value, 'password', onchange: false, );
                  },
                  onEndEditing: (value) {
                    checkPassword(value, 'password', onchange: false, );
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
                  textStyle: TextStyle(fontSize:14, fontWeight: FontWeight.w500,color: appColors.textNormalColor1),
                  backCallback: (){
                    if(_validateFields(isButtonClicked: true)){
                      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                      //   return OtpVerificationScreen(
                      //     isSignUpScreen: this.isSignUpScreen,
                      //   );
                      // }), (route) => false);
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
        ),
      );
    }

    return ContainerFirst(
      appBarHeight: -1,
      isOverLayStatusBar: true,
      appBackgroundColor: Colors.white,
      statusBarColor: Colors.white,
      contextCurrentView: context,
      containChild: Column(
        // alignment: Alignment.bottomCenter,
        children: [
          // backgroundImage(),
          // Positioned(
          //     top: 145,
          //     left: 20,
          //     child: Text(appString.trans(context, appString.registerText),
          //       style: appStyles.registerTextTextStyle()),
          // ),
          // bottomView()
          backgroundImage(),
          bottomView()
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