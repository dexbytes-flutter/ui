import 'dart:io';

import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/app_utility/validation.dart';
import 'package:base_flutter_app/src/widgets/bottom_sheet_dynamic_height_card.dart';
import 'package:base_flutter_app/src/widgets/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../all_file_import/app_providers_files_link.dart';
import '../all_file_import/app_values_files_link.dart';
import '../image_res/iconApp.dart';

class EditProfileBottomSheetScreen extends StatefulWidget {

  const EditProfileBottomSheetScreen({Key? key,}) : super(key: key);
  @override
  _EditProfileBottomSheetScreenState createState() => _EditProfileBottomSheetScreenState();
}

class _EditProfileBottomSheetScreenState extends State<EditProfileBottomSheetScreen> {

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

  String phoneNumber = '';
  String countryCode = 'in';
  OverlayEntry? overlayEntry;
  bool isSignInScreen = false;

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
    MainAppBloc mainAppBloc = MainAppBloc();

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

    bottomButton(){
      return Container(
        margin: EdgeInsets.only(left: 17,right: 17,bottom: 15),
        child: CommonButton(
          buttonColor: appColors.appButtonColor,
          buttonName: appString.trans(context, appString.updateDetailsButtonText),
          buttonHeight: 50,
          buttonBorderRadius: 12,
          isBottomMarginRequired: false,
          textStyle: appStyles.commonButtonTitleTextTextStyle(),
          backCallback: (){
            if(_validateFields(isButtonClicked: true)){
              Navigator.of(context).pop();
              Fluttertoast.showToast(msg: appString.trans(context, appString.yourProfileDetailsUpdated),
                  backgroundColor: appColors.textNormalColor7,
                textColor: appColors.textNormalColor,
              );
            }
          },
        ),
      );
    }


    return BottomSheetDynamicHeightCardView(
      cardBackgroundColor: Colors.white,
      topLineShow: true,
      sheetTitle: appString.trans(context, appString.updateProfileDetails),
      sheetTitleStyle: appStyles.titleTextStyle1(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
                child: Text(appString.trans(context, appString.mobileNumberText),
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
              errorStyle: appStyles.errorStyle(fontSize: 12),
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
              errorMsgHeight: 24,
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
              errorStyle: appStyles.errorStyle(fontSize: 12),
              errorMessageStyle:appStyles.errorStyle(fontSize: 9),
              placeHolderTextWidget: Padding(
                padding: const EdgeInsets.only(bottom: 5,left: 2),
                child: Text(appString.trans(context, appString.fullNameText),
                  style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              hintStyle: appStyles.textFieldHintTextStyle(),
              textStyle: appStyles.textFieldTextStyle(),
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
          SizedBox(height: 10,),
          bottomButton(),
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
            buttonName: appString.trans(context, appString.doneText),
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