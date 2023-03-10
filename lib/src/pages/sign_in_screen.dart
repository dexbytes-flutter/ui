import 'dart:io';

import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/app_utility/validation.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/pages/sign_up_screen.dart';
import 'package:base_flutter_app/src/widgets/basic_view_container/container_first.dart';
import 'package:base_flutter_app/src/widgets/country_code_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'otp_verification_screen.dart';

class SignInScreen extends StatefulWidget {
  final bool isSignInScreen;
  const SignInScreen({
    Key? key,
    this.isSignInScreen = false,
  }) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

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
  bool isSignUpScreen = true;

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
            Text("Sign in to continue", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),)
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
                  hintText: "Mobile number",
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

              // Password field
              Container(
                padding: EdgeInsets.only(
                  left: 20,right: 20,
                ),
                width: MediaQuery.of(context).size.width,
                child: CommonTextFieldWithError(
                  focusNode: focusNodes['password'],
                  isShowBottomErrorMsg: true,
                  errorMessages: errorMessages['password']?.toString()??'',
                  controllerT: controllers['password'],
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
                  inputKeyboardType: InputKeyboardTypeWithError.email,
                  obscureText: hideNewPassword,
                  hintText: appString.trans(context, appString.password),
                  errorStyle: appStyles.errorStyle(fontSize: 10),
                  errorMessageStyle:appStyles.errorStyle(fontSize: 9),
                  placeHolderTextWidget: Padding(
                    padding: const EdgeInsets.only(bottom: 5,left: 2),
                    child: Text("Password",
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
                  inputFieldSuffixIcon: Padding(
                    padding: EdgeInsets.only(right: 12,),
                    child: IconButton(
                      icon:
                      hideNewPassword ? visibilityOffIcon : visibilityOnIcon,
                      onPressed: togglePasswordVisibility1,
                    ),
                  ),
                  inputFieldPrefixIcon: Container(
                    margin: EdgeInsets.all(15),
                    child: iconApps.iconImage(
                        imageUrl: iconApps.passwordIcon,
                        iconSize: Size(20, 20),
                        imageColor: Colors.grey.shade300),
                  ),
                  onTextChange: (value) {
                    checkPassword(value, 'password', onchange: false, );
                  },
                  onEndEditing: (value) {
                    checkPassword(value, 'password', onchange: false, );
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },
                ),
              ),

              // Sign in with online options
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 20,right: 10),
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        // color: appColors.textNormalColor.withOpacity(0.6),
                        color: Colors.brown.shade400.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          iconApps.iconImage(
                              imageUrl: iconApps.googleIcon,
                              iconSize: Size(20, 20),
                              imageColor: Colors.grey.shade300),
                          SizedBox(width: 5,),
                          Text("Google",style: TextStyle(color: Colors.grey.shade200),)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 10,right: 20),
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.brown.shade400.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          iconApps.iconImage(
                              imageUrl: iconApps.facebookIcon,
                              iconSize: Size(25, 25),
                              imageColor: Colors.grey.shade300),
                          Text("Facebook", style: TextStyle(color: Colors.grey.shade200),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // Login button
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height/30,
                  left: MediaQuery.of(context).size.width/17,
                  right: MediaQuery.of(context).size.width/17,
                ),
                child: CommonButton(
                  buttonColor: Color(0xFF54321E),
                  buttonName: "Log In",
                  buttonHeight: 50,
                  buttonBorderRadius: 12,
                  isBottomMarginRequired: false,
                  textStyle: TextStyle(fontSize:14, fontWeight: FontWeight.w700,color: Colors.grey.shade200 ),
                  backCallback: (){
                    if(_validateFields(isButtonClicked: true)){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                        return OtpVerificationScreen(
                          isSignInScreen: true,
                        );
                      }), (route) => false);
                    }
                  },
                ),
              ),

              // Forgot password text
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Center(
                    child: GestureDetector(
                      onTap: (){
                      /*  Navigator.push(
                          context,
                          SlideRightRoute(
                              widget: SignUpScreen()),
                        );*/
                      },
                      child: RichText(
                        text: TextSpan(
                            text: "Forgot Password?",
                            style: TextStyle(color: Color(0xFF54321E).withOpacity(0.8), fontSize: 14,fontWeight: FontWeight.w600
                            ),
                        ),
                      ),
                    ),
                  )
              )
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
                   Navigator.push(
                    context,
                    SlideRightRoute(
                        widget: SignUpScreen()),
                  );
                },
                child: RichText(
                  text: TextSpan(
                      text: "Don't have an account?",
                      style: TextStyle(color: Color(0xFF54321E).withOpacity(0.8), fontSize: 13,fontWeight: FontWeight.w600
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: " Join us",
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
