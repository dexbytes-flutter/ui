import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/app_utility/validation.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar.dart';
import 'package:base_flutter_app/src/widgets/basic_view_container/container_first.dart';
import 'package:base_flutter_app/src/widgets/common_text_field_with_error.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
            }
          });
        }
      } else {
        setState(() {
          if (!onchange) {
            errorMessages[fieldName] = appString.trans(context,appString.pleaseEnterCorrectEmail);
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
      } else if (controllers['password']?.text == null ||
          controllers['password']?.text == '') {
        setState(() {
          if (isButtonClicked) {
            errorMessages['password'] = appString.trans(context, appString.pleaseEnterPassword);
          }
        });
        return false;
      } else if (!Validation().validateEmail(controllers['password']?.text ?? "")) {
        setState(() {
          if (isButtonClicked) {
            errorMessages['password'] = appString.trans(context, appString.pleaseEnterCorrectPassword);
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
              colors: [appColors.appTransColor.withOpacity(0.30),appColors.appBgColorJungleGreen],
              begin:Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(bound),
            blendMode: BlendMode.darken,
            child: CachedNetworkImage(
              height: appDimens.heightFullScreen()/2.4,
              width: appDimens.widthFullScreen(),
              imageUrl: "http://lh3.ggpht.com/-LBkmHsPl3XU/TmMb5-qgdiI/AAAAAAAAQHA/eu3yiXNXKPU/rice-terraces-8%25255B2%25255D.jpg?imgmax=800",
              fit:BoxFit.fill,
            ),
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
                  checkPassword(value, 'password', onchange: true, );
                },
                onEndEditing: (value) {
                  checkPassword(value, 'password', onchange: true, );
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
              ),
            ),

            // Login button
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 10,
                      left: 20,
                      right: 20,
                    ),
                    padding: EdgeInsets.only(right: 80),
                    child: CommonButton(
                      buttonName: appString.trans(context, appString.loginText),
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
                ),
                Container(
                  margin: EdgeInsets.only(left: 10,right: 20),
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
              ],
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
      );
    }

    return ContainerFirst(
      appBarHeight: -1,
      isOverLayStatusBar: true,
      appBackgroundColor: Colors.white,
      statusBarColor: Colors.white,
      contextCurrentView: context,
      containChild: Column(
        children: [
          backgroundImage(),
          bottomView()
        ],
      ),
    );;
  }
}
