import 'package:flutter/material.dart';
import '../all_file_import/app_values_files_link.dart';
import 'expansion_tile_widget.dart';

class FaqExpansionTileWidget extends StatefulWidget {
  final void Function(bool)? onCardClickCallBack;
  final String? title;
  final String? subTitle;
  final TextStyle? titleTextStyle;
  final TextStyle? subTitleTextStyle;
  final Widget? trailingIcon;
  final List<Widget> children;
  final bool initiallyExpanded;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const FaqExpansionTileWidget({Key? key,
    this.onCardClickCallBack,
    this.title,
    this.subTitle = "",
    this.trailingIcon,
    this.children = const [],
    this.titleTextStyle,
    this.subTitleTextStyle,
    this.initiallyExpanded = false,
    this.margin,
    this.padding,


  }) : super(key: key);

  @override
  State<FaqExpansionTileWidget> createState() => _FaqExpansionTileWidgetState();
}

class _FaqExpansionTileWidgetState extends State<FaqExpansionTileWidget> {
  late  num itemCount = 1;

  @override
  Widget build(BuildContext context) {

    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);

    return ExpansionTileWidget(
        initiallyExpanded: widget.initiallyExpanded,
        maintainState: true,
        onExpansionChanged:(z){
          widget.onCardClickCallBack?.call(z);
        },
        // leading: Icon(cdm.icon,color: Colors.white),
        title: Text("${widget.title}",
          style: widget.titleTextStyle ?? appStyles.aboutTitleTextStyle(),
        ),
        subtitle: Text("${widget.subTitle}",
          style: widget.subTitleTextStyle ?? appStyles.aboutTitleTextStyle(),
        ),
        trailing: Padding(
          padding: widget.padding ?? EdgeInsets.zero,
          child: widget.trailingIcon,
        ),
        children: widget.children
    );
  }
}

