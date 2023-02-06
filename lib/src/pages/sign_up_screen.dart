import 'dart:io';

import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../all_file_import/app_utils_files_link.dart';
import '../app_utility/validation.dart';
import '../widgets/country_code_picker.dart';
import 'otp_verification_screen.dart';

class SignUpScreen extends StatefulWidget {
  final bool isSignInScreen;
  const SignUpScreen({
    Key? key,this.isSignInScreen = false,
  }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  Map<String, TextEditingController> controllers = {
    'phone': new TextEditingController(),
    'name': new TextEditingController(),
  };

  Map<String, FocusNode> focusNodes = {
    'phone': new FocusNode(),
    'name': new FocusNode(),
  };

  Map<String, String> errorMessages = {
    'phone': "",
    'name': "",
  };

  bool hideNewPassword = true;
  String phoneNumber = '';
  String countryCode = 'in';
  OverlayEntry? overlayEntry;
  bool isSignInScreen = false;
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

    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);

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
              errorMessages[fieldName] = appString.trans(context,appString.correctPhone);
            }
          });
        }
      } else {
        setState(() {
          if (!onchange) {
            errorMessages[fieldName] = appString.trans(context,appString.phoneNumber);
          }
        });
      }
    }

    //Check full name field
    checkFullName(value, fieldName, {onchange = false}) {
      if (Validation().isNotEmpty(value.trim())) {
        if (Validation().validateNameField(value.trim())) {
        setState(() {
          errorMessages[fieldName] = '';
        });
        } else {
          setState(() {
            if (!onchange) {
              errorMessages[fieldName] = appString.trans(context, appString.fullNameValidError);
              // errorMessages[fieldName] = "Please correct enter password";
            }
          });
        }
      } else {
        setState(() {
          if (!onchange) {
            if (fieldName == 'name') {
              errorMessages[fieldName] = appString.trans(context, appString.fullNameError);
              // errorMessages[fieldName] = "Please enter password";
            }
          }
        });
      }
    }

    // Validate fields
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
            errorMessages['phone'] = appString.trans(context, appString.correctPhone);
            // errorMessages['phone'] = "Invalid mobile number";
          }
        });
        return false;
      } else if (controllers['name']?.text == null ||
          controllers['name']?.text == '') {
        setState(() {
          if (isButtonClicked) {
            errorMessages['name'] = appString.trans(context, appString.fullNameError);
            // errorMessages['password'] = "Please enter name";
          }
        });
        return false;
      } else if (!Validation().validateNameField(controllers['name']?.text ?? "")) {
        setState(() {
          if (isButtonClicked) {
            errorMessages['name'] = appString.trans(context, appString.fullNameValidError);
            // errorMessages['password'] = "Please enter name";
          }
        });
        return false;
      } else {
        return true;
      }
    }

    // Background Image widget
    Widget backgroundImage() {
      return ShaderMask(
        shaderCallback: (bound) =>LinearGradient(
          colors: [Colors.black.withOpacity(0.48),Colors.black.withOpacity(0.30)],
          begin:Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bound),
        blendMode: BlendMode.dstATop,
        child: CachedNetworkImage(
          height: MediaQuery.of(context).size.height/1,
          width: MediaQuery.of(context).size.width,
          // imageUrl: "https://www.butteredsideupblog.com/wp-content/uploads/2021/04/How-to-Make-a-Mocha-Latte-65.jpg",
          imageUrl: "https://markieskitchen.com/wp-content/uploads/2022/07/iced-mocha-latte-2.jpg",
          fit:BoxFit.cover,
        ),
      );
    }

    // Welcome title widget
    Widget welcomeTitleWidget(){
      return Container(
        margin: EdgeInsets.only(top: appDimens.heightFullScreen()/18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Welcome", style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
            Text("Sign up for your favorite coffee", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),)
          ],
        ),
      );
    }

    // Center view widget
    Widget centerView(){
      return Positioned(top: appDimens.heightFullScreen()/4.5,
          left: 10,
          right: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Mobile number textfield
              Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.only(
                  left: 20,right: 20,
                ),
                width: MediaQuery.of(context).size.width,
                child: CommonTextFieldWithError(
                  placeHolderTextWidget: Padding(
                    padding: const EdgeInsets.only(bottom: 5,left: 2),
                    child: Text("Mobile Number",
                      style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  maxCharLength: 10,
                  textInputAction: TextInputAction.done,
                  focusNode: focusNodes['phone'],
                  isShowBottomErrorMsg: true,
                  errorText: errorMessages['phone']?.toString()??'',
                  errorMessages: errorMessages['phone']?.toString()??'',
                  controllerT: controllers['phone'],
                  borderRadius: 15,
                  inputHeight: 50,
                  errorLeftRightMargin: 0,
                  errorMsgHeight: 24,
                  autoFocus: false,
                  cursorColor: Colors.grey,
                  enabledBorderColor: Colors.brown.shade400.withOpacity(0.7),
                  focusedBorderColor:   Colors.brown.shade400.withOpacity(0.7),
                  backgroundColor: Colors.brown.shade400.withOpacity(0.7),
                  borderStyle: BorderStyle.none,
                  inputKeyboardType: InputKeyboardTypeWithError.number,
                  hintText: appString.trans(context, appString.mobileNumberHintText),
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade200,
                  ),
                  textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  inputFieldPrefixIcon: CountryPicker(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 4.6,
                        top: 10,
                        bottom: 10,
                        right: 10
                    ),
                    initialSelection: countryCode,
                    onChanged: (value){
                      print("$value");
                      countryCode = value.dialCode!;
                    },
                    onInit: (value){
                      print("$value");
                      countryCode = value!.dialCode!;
                    },
                  ),
                  contentPadding: EdgeInsets.only(left: 25),
                  onTextChange: (value) {
                    checkMobileNumber(value, onchange: true, fieldName: 'phone');
                  },
                  onEndEditing: (value) {
                    checkMobileNumber(value, fieldName: 'phone');
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                ),
              ),

              // Full name field
              Container(
                padding: EdgeInsets.only(
                  left: 20,right: 20,
                ),
                width: MediaQuery.of(context).size.width,
                child: CommonTextFieldWithError(
                  focusNode: focusNodes['name'],
                  isShowBottomErrorMsg: true,
                  errorMessages: errorMessages['name']?.toString()??'',
                  controllerT: controllers['name'],
                  borderRadius: 12,
                  inputHeight: 50,
                  errorMsgHeight: 22,
                  autoFocus: false,
                  errorLeftRightMargin: 0,
                  maxCharLength: 16,
                  capitalization: CapitalizationText.sentences,
                  cursorColor: Colors.grey,
                  enabledBorderColor: Colors.brown.shade400.withOpacity(0.7),
                  focusedBorderColor: Colors.brown.shade400.withOpacity(0.7),
                  backgroundColor: Colors.brown.shade400.withOpacity(0.7),
                  textInputAction: TextInputAction.done,
                  borderStyle: BorderStyle.none,
                  inputKeyboardType: InputKeyboardTypeWithError.text,
                  hintText: appString.trans(context, appString.fullNameHintText),
                  errorStyle: appStyles.errorStyle(fontSize: 10),
                  errorMessageStyle:appStyles.errorStyle(fontSize: 9),
                  placeHolderTextWidget: Padding(
                    padding: const EdgeInsets.only(bottom: 5,left: 2),
                    child: Text("Full Name",
                      style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade200,
                  ),
                  textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  contentPadding: EdgeInsets.only(left: 15,right: 15),
                  onTextChange: (value) {
                    checkFullName(value, 'name', onchange: false, );
                  },
                  onEndEditing: (value) {
                    checkFullName(value, 'name', onchange: false, );
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },
                ),
              ),

              // Sign up button
              Container(
                margin: EdgeInsets.only(
                  top: appDimens.heightFullScreen()/30,
                  left: MediaQuery.of(context).size.width/17,
                  right: MediaQuery.of(context).size.width/17,
                ),
                child: CommonButton(
                  buttonColor: appColors.appButtonColor,
                  buttonName: "Sign Up",
                  buttonHeight: 50,
                  buttonBorderRadius: 12,
                  isBottomMarginRequired: false,
                  textStyle: TextStyle(fontSize:16, fontWeight: FontWeight.w700,color: Colors.grey.shade200 ),
                  backCallback: (){
                    if(_validateFields(isButtonClicked: true)){
                      Navigator.push(
                        context,
                        SlideRightRoute(
                            widget: OtpVerificationScreen(
                              isSignInScreen: this.isSignInScreen,
                            )
                        ),
                      );
                      /*Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                        return OtpVerificationScreen(
                          isSignInScreen: this.isSignInScreen,
                        );
                      }), (route) => false);*/
                    }
                  },
                ),
              ),
            ],
          )
      );
    }


    return ContainerFirst(
      appBarHeight: -1,
      isOverLayStatusBar: true,
      appBackgroundColor: Colors.white,
      statusBarColor: Colors.white,
      contextCurrentView: context,
      containChild: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          backgroundImage(),
          Positioned(
              top: 25,
              child: welcomeTitleWidget()),
          centerView(),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: RichText(
                  text: TextSpan(
                      text: "Have an account?",
                      style: TextStyle(color: Color(0xFF54321E).withOpacity(0.8), fontSize: 13,fontWeight: FontWeight.w600
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: " Sign In",
                          style: TextStyle(color: Color(0xFF54321E), fontSize: 13.5, fontWeight: FontWeight.w900),
                        )
                      ]
                  ),
                ),
              ),
            ),
          )
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