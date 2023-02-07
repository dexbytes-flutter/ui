import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWithSwitchIcon extends StatefulWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final void Function(bool)? onChange;
  final bool? value;
  const TextWithSwitchIcon(
      {Key? key,
        this.text = "",
        this.fontSize = 18,
        this.onChange,
        this.value,
        this.color = Colors.black,
        this.fontWeight = FontWeight.w800})
      : super(key: key);

  @override
  State<TextWithSwitchIcon> createState() => _TextWithSwitchIconState();
}

class _TextWithSwitchIconState extends State<TextWithSwitchIcon> {
  bool globalNotifications = false;
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    InputDecorationTheme inputDecorationTheme =
    Theme.of(context).inputDecorationTheme.copyWith();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Text(widget.text,
              style: textTheme.bodyText1?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              )
          ),
        ),
        Transform.scale(
          scale: 0.75,
          child: CupertinoSwitch(
            activeColor: appColors.textColor,
            value: widget.value ?? isSwitched,
            onChanged: widget.onChange ?? (bool value) {
              setState(() {
                isSwitched = value;
              });
            },
          ),
        )
      ],
    );
  }
}