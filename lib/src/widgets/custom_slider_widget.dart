import 'dart:ui' as ui;

import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomSlider extends StatefulWidget {
  // final String? assetImage;
  // final LinearGradient linearGradient;
  final Color inActiveTrackColor;
  final Color activeTrackColor;
  final double trackHeight;
  final double min;
  final double max;
  final int? assetImageHeight;
  final int? assetImageWidth;
  final int? divisions;
  final Function(double)? onValueChangeCallback;
  final double? value;

  const CustomSlider({
    Key? key,
    // this.assetImage,
    // required this.linearGradient,
    required this.inActiveTrackColor,
    required this.activeTrackColor,
    required this.trackHeight,
    required this.min,
    required this.max,
    this.divisions,
    this.assetImageHeight = 50,
    this.assetImageWidth = 60,
    this.onValueChangeCallback,
    this.value
  }) : super(key: key);

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  // double intValue = 0;
  ui.Image? customImage;

 /* Future<ui.Image> load(String asset) async {
    ByteData data = await rootBundle.load(asset);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: widget.assetImageHeight,
        targetWidth: widget.assetImageWidth);
    ui.FrameInfo frameInfo = await codec.getNextFrame();
    return frameInfo.image;
  }*/

  @override
  void initState() {
    /*load(widget.assetImage!).then((image) {
      setState(() {
        customImage = image;
      });
    });*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
          inactiveTrackColor: widget.inActiveTrackColor,
          activeTrackColor: widget.activeTrackColor,
          trackShape: CustomTrackShape(),
          thumbColor: appColors.buttonBgColor,
          trackHeight: widget.trackHeight,
          overlayShape: SliderComponentShape.noOverlay,
          // overlayColor: Colors.purple.withAlpha(36),
          overlayColor: appColors.appTransColor,
          thumbShape: customImage != null
              ? SliderThumbImage(customImage!)
              : const RoundSliderThumbShape(
            enabledThumbRadius: 5,disabledThumbRadius: 5,
            pressedElevation: 0
          )),
      child: Slider(
        min: widget.min,
        max: widget.max,
        divisions: widget.divisions,
        onChanged: widget.onValueChangeCallback,
        value: widget.value!,
        label: "${widget.value?.toInt()} ${appString.trans(context, appString.personText)}",
      ),
    );
  }
}

class GradientSliderTrackShape extends SliderTrackShape
    with BaseSliderTrackShape {
  LinearGradient? linearGradient;

  GradientSliderTrackShape({this.linearGradient}) {
    linearGradient ??
        const LinearGradient(colors: [
          Colors.black,
          Colors.amber,
        ]);
  }

  @override
  void paint(
      PaintingContext context,
      Offset offset, {
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required Animation<double> enableAnimation,
        required TextDirection textDirection,
        required Offset thumbCenter,
        bool isDiscrete = false,
        bool isEnabled = false,
        double additionalActiveTrackHeight = 2,
      }) {
    assert(context != null);
    assert(offset != null);
    assert(parentBox != null);
    assert(sliderTheme != null);
    assert(sliderTheme.disabledActiveTrackColor != null);
    assert(sliderTheme.disabledInactiveTrackColor != null);
    assert(sliderTheme.activeTrackColor != null);
    assert(sliderTheme.inactiveTrackColor != null);
    assert(sliderTheme.thumbShape != null);
    assert(enableAnimation != null);
    assert(textDirection != null);
    assert(thumbCenter != null);
    assert(isEnabled != null);
    assert(isDiscrete != null);

    if (sliderTheme.trackHeight! <= 0) {
      return;
    }

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );
    final activeGradientRect = Rect.fromLTRB(
      trackRect.left,
      (textDirection == TextDirection.ltr)
          ? trackRect.top - (additionalActiveTrackHeight / 2)
          : trackRect.top,
      thumbCenter.dx,
      (textDirection == TextDirection.ltr)
          ? trackRect.bottom + (additionalActiveTrackHeight / 2)
          : trackRect.bottom,
    );

    final ColorTween activeTrackColorTween = ColorTween(
        begin: sliderTheme.disabledActiveTrackColor,
        end: sliderTheme.activeTrackColor);
    final ColorTween inactiveTrackColorTween = ColorTween(
        begin: sliderTheme.disabledInactiveTrackColor,
        end: sliderTheme.inactiveTrackColor);
    final Paint activePaint = Paint()
      ..shader = linearGradient!.createShader(activeGradientRect)
      ..color = activeTrackColorTween.evaluate(enableAnimation)!;
    final Paint inactivePaint = Paint()
      ..color = inactiveTrackColorTween.evaluate(enableAnimation)!;
    final Paint leftTrackPaint;
    final Paint rightTrackPaint;
    switch (textDirection) {
      case TextDirection.ltr:
        leftTrackPaint = activePaint;
        rightTrackPaint = inactivePaint;
        break;
      case TextDirection.rtl:
        leftTrackPaint = inactivePaint;
        rightTrackPaint = activePaint;
        break;
    }

    final Rect leftTrackSegment = Rect.fromLTRB(
        trackRect.left, trackRect.top, thumbCenter.dx, trackRect.bottom);
    if (!leftTrackSegment.isEmpty)
      context.canvas.drawRect(leftTrackSegment, leftTrackPaint);
    final Rect rightTrackSegment = Rect.fromLTRB(
        thumbCenter.dx, trackRect.top, trackRect.right, trackRect.bottom);
    if (!rightTrackSegment.isEmpty)
      context.canvas.drawRect(rightTrackSegment, rightTrackPaint);
  }
}

class SliderThumbImage extends SliderComponentShape {
  final ui.Image image;

  SliderThumbImage(this.image);
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(0, 0);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow}) {
    var canvas = context.canvas;
    final picWidth = image.width;
    final picHeight = image.height;

    Offset picOffset = Offset(
      (center.dx - (picWidth / 2)),
      (center.dy - (picHeight / 2)),
    );

    Paint paint = Paint()..filterQuality = FilterQuality.high;
    canvas.drawImage(image, picOffset, paint);
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
