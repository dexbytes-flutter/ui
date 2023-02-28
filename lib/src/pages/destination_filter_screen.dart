import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/widgets/appbar/home_screen_app_bar.dart';
import 'package:flutter/material.dart';

class DestinationFilterScreen extends StatefulWidget {
  const DestinationFilterScreen({Key? key}) : super(key: key);

  @override
  State<DestinationFilterScreen> createState() => _DestinationFilterScreenState();
}

class _DestinationFilterScreenState extends State<DestinationFilterScreen> {

  Map<String, TextEditingController> controllers = {
    'search': new TextEditingController(),
  };

  Map<String, FocusNode> focusNodes = {
    'search': new FocusNode(),
  };

  Map<String, String> errorMessages = {
    'search': "",
  };

  
  @override
  Widget build(BuildContext context) {

    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);

    final List <String> searchResultViewOptionList = [
      "Vertical Card",
      "Horizontal Card"
    ];

    // Filter search result view option card
    Widget filterSearchResultViewOption(){
      return Container(
        height: 40,
        child: ListView.builder(
            itemCount: searchResultViewOptionList.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context,index){
              return Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: appColors.appBgColor2.withOpacity(0.30)
                ),
                child: Text(searchResultViewOptionList[index],
                style: appStyles.commonSubTitleTextStyle(fontSize: 13),
                ),
              );
            }
        ),
      );
    }
    // Filter pop up dialog
    Future filterPopUpDialog() {
      return showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) {
            return SimpleDialog(
              backgroundColor: appColors.appBgColor2,
              insetPadding: EdgeInsets.all(20),
              contentPadding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              children: [
                    Container(
                      height: appDimens.heightFullScreen() - 425,
                      width: appDimens.widthFullScreen() - 20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(appString.trans(context, appString.viewTitleText),
                            style: appStyles.commonSubTitleTextStyle(fontSize: 15),
                          ),
                          // filterSearchResultViewOption(),
                          Container(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                // fixedSize: Size(250, 50),
                              ),
                              child: Text(
                                "Submit",
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
              ],
            );
          });
    }
    
      // Top search field
      Widget topSearchField() {
        return Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 250,
                child: CommonTextFieldWithError(
                  decoration: InputDecoration(
                    hintText: appString.trans(
                        context, appString.searchTextFieldHintText),
                    hintStyle: appStyles.textFieldHintTextTextStyle(),
                    contentPadding: EdgeInsets.all(10).copyWith(top: 18),
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
                  focusNode: focusNodes["search"],
                  isShowBottomErrorMsg: true,
                  errorMessages: errorMessages['search']?.toString() ?? '',
                  controllerT: controllers['search'],
                  inputHeight: 50,
                  errorMsgHeight: 22,
                  autoFocus: false,
                  errorLeftRightMargin: 0,
                  maxCharLength: 25,
                  capitalization: CapitalizationText.none,
                  cursorColor: appColors.appBgColor1,
                  textInputAction: TextInputAction.done,
                  borderStyle: BorderStyle.none,
                  inputKeyboardType: InputKeyboardTypeWithError.email,
                  errorStyle: appStyles.errorStyle(fontSize: 10),
                  errorMessageStyle: appStyles.errorStyle(fontSize: 9),
                  textStyle: appStyles.textFieldTextTextStyle(),
                  onTextChange: (value) {},
                  onEndEditing: (value) {},
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: appColors.buttonBgColor),
                child: iconApps.iconImage(
                    imageUrl: iconApps.searchIcon,
                    imageColor: appColors.black,
                    iconSize: Size(20, 20)),
              )
            ],
          ),
        );
      }

      // Search result title text with filter button
      Widget titleWithFilterOption(){
        return Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(appString.trans(context, appString.foundText),
                    style: appStyles.commonSubTitleTextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 3,),
                  Text("90+",
                    style: appStyles.commonSubTitleTextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 3,),
                  Text(appString.trans(context, appString.destinationText),
                    style: appStyles.commonSubTitleTextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              GestureDetector(
                onTap: (){
                  filterPopUpDialog();
                },
                child: Container(
                  padding: EdgeInsets.all(8).copyWith(left: 15,right: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: appColors.buttonBgColor),
                  child: iconApps.iconImage(
                      imageUrl: iconApps.filterIcon,
                      imageColor: appColors.black,
                      iconSize: Size(20, 20)),
                ),
              )
            ],
          ),
        );
      }

      return ContainerFirst(
          appBarHeight: 56,
          isOverLayStatusBar: false,
          isSingleChildScrollViewNeed: false,
          contextCurrentView: context,
          appBar: HomeScreenAppBar(
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
          ),
          containChild: Column(
            children: [
              topSearchField(),
              titleWithFilterOption()
            ],
          )
      );
    }
}
