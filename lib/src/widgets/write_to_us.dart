import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/values/app_string.dart';
import 'package:base_flutter_app/src/values/app_style.dart';
import 'package:flutter/material.dart';

import '../values/app_color.dart';
import 'appbar/appbar_with_left_icon_title.dart';

class WriteToUs extends StatefulWidget {
  const WriteToUs({Key? key}) : super(key: key);

  @override
  State<WriteToUs> createState() => _WriteToUsState();
}

class _WriteToUsState extends State<WriteToUs> {

  TextEditingController writeUsTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    //Write us text field
    Widget writeToUsTextField (){
      return Container(
        padding: EdgeInsets.only(
          left: 20,right: 20
        ),
        child: CommonTextFieldWithError(
          // focusNode: focusNodes['name'],
          isShowBottomErrorMsg: true,
          // errorMessages: errorMessages['name']?.toString()??'',
          controllerT: writeUsTextFieldController,
          maxLines: 15,
          borderRadius: 12,
          inputHeight: 330,
          errorMsgHeight: 22,
          autoFocus: false,
          errorLeftRightMargin: 0,
          maxCharLength: 16,
          capitalization: CapitalizationText.sentences,
          cursorColor: Colors.grey,
          enabledBorderColor: appColors.white,
          focusedBorderColor: appColors.white,
          backgroundColor: appColors.white,
          textInputAction: TextInputAction.done,
          borderStyle: BorderStyle.none,
          inputKeyboardType: InputKeyboardTypeWithError.multiLine,
          hintText: appString.trans(context, appString.writeToUsText),
          errorStyle: appStyles.errorStyle(fontSize: 10),
          errorMessageStyle:appStyles.errorStyle(fontSize: 9),
          hintStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
          textStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          contentPadding: EdgeInsets.all(15),
          onTextChange: (value) {

          },
          onEndEditing: (value) {
          },
        ),
      );
    }

    // Send button
    Widget sendButton(){
      return Container(
        padding: EdgeInsets.only(
            left: 125,right: 125
        ),
        child: CommonButton(
          buttonColor: appColors.appButtonColor,
          buttonName: "Send",
          buttonHeight: 50,
          buttonBorderRadius: 12,
          isBottomMarginRequired: false,
          textStyle: TextStyle(fontSize:16, fontWeight: FontWeight.w700,color: Colors.grey.shade200 ),
          backCallback: (){
            /*if(_validateFields(isButtonClicked: true)){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                    return OtpVerificationScreen(
                      isSignInScreen: this.isSignInScreen,
                    );
                  }), (route) => false);
                }*/
          },
        ),
      );
    }

      return ContainerFirst(
          contextCurrentView: context,
          appBarHeight: 48,
          appBar: CommonAppBarWithLeftIconTitle(
            title:"Write to Us",
          ),
          containChild: Column(
            children: [
              writeToUsTextField(),
              SizedBox(height: 5,),
              sendButton()
            ],
          )
      );
    }
  }
