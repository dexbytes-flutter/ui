import 'package:base_flutter_app/src/all_file_import/app_providers_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class CountryPicker extends StatelessWidget {
  final String? text;
  final String? initialSelection;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final void Function(CountryCode)?  onChanged;
  final void Function(CountryCode?)?  onInit;

  const CountryPicker(
      {Key? key,
        this.text,
        this.textStyle,
        this.margin = const EdgeInsets.symmetric(horizontal: 21),
        this.padding = const EdgeInsets.symmetric(horizontal: 21),
        this.initialSelection,
        this.onChanged,
        this.onInit,
      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    appDimens.appDimensFind(context: context);
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.only(top: 0,left:9,right: 0),
      child: Stack(
        children: [
          Padding(
            padding: padding,
            child: VerticalDivider(
              width: 10,
              thickness: 1,
              endIndent: 0,
              indent: 0,
              // color: Colors.grey.withOpacity(0.5),
              color: Colors.grey.shade200,
            ),
          ),
          CountryCodePicker(
            searchDecoration: InputDecoration(
                contentPadding:  EdgeInsets.all(10),
                prefixIcon: Icon(Icons.search,color: Colors.grey,),
                hintText: "Search country code",
                hintStyle: TextStyle(
                  fontSize: 15.5,
                  fontWeight: FontWeight.w400,
                  color: appColors.hintTextColor,//Color(0xff828588),
                ),
                fillColor: AppColors().textFiledColor.withOpacity(0.1),
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.1,color: Colors.grey),
                    borderRadius: BorderRadius.circular(12)),
                enabledBorder:OutlineInputBorder(
                    borderSide: BorderSide(width: 0.1,color: Colors.grey),
                    borderRadius: BorderRadius.circular(12)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.1,color: Colors.grey),
                    borderRadius: BorderRadius.circular(12))
            ),
            dialogSize: Size(appDimens.widthFullScreen()/1.15,appDimens.heightFullScreen()/3.8),
            padding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            initialSelection: initialSelection,
            showCountryOnly: false,
            showFlag: true,
            flagWidth: 20,
            showFlagDialog: true,
            showOnlyCountryWhenClosed: false,
            dialogBackgroundColor:Colors.brown.shade400.withOpacity(0.7),
            dialogTextStyle: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade300),
            closeIcon: Icon(Icons.clear,size: 26,color: Colors.grey.shade200),
            hideSearch: true,
            hideMainText: false,
            textStyle: TextStyle(fontSize: 15,color:Colors.grey.shade300),
            onChanged: onChanged,
            onInit:onInit
            // flagWidth: ,
          ),
        ],
      ),
    );
  }
}
