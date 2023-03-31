import 'dart:ui' as ui;

import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomRangeSlider extends StatefulWidget {
  final Color inActiveTrackColor;
  final Color activeTrackColor;
  final double trackHeight;
  final double min;
  final double max;
  final int? assetImageHeight;
  final int? assetImageWidth;
  final int? divisions;
  final Function(double)? onValueChangeCallback;
  final RangeValues values;
  final RangeLabels labels;
  final rangeSliderOnChangeCallback;
  const CustomRangeSlider({
    Key? key,
    required this.inActiveTrackColor,
    required this.activeTrackColor,
    required this.trackHeight,
    required this.min,
    required this.max,
    this.divisions,
    this.assetImageHeight = 50,
    this.assetImageWidth = 60,
    this.onValueChangeCallback,
    required this.values,
    required this.labels,
    required this.rangeSliderOnChangeCallback
  }) : super(key: key);

  @override
  State<CustomRangeSlider> createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
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
          activeTrackColor: widget.activeTrackColor,
          inactiveTrackColor: widget.inActiveTrackColor,
          thumbColor: widget.activeTrackColor,
          activeTickMarkColor: widget.activeTrackColor,
          inactiveTickMarkColor: appColors.appTransColor,
          overlayShape: SliderComponentShape.noOverlay,
          trackHeight: widget.trackHeight,
          rangeThumbShape: const RoundRangeSliderThumbShape(enabledThumbRadius: 10,disabledThumbRadius: 10,pressedElevation: 0),
          trackShape: CustomTrackShape(),
          overlayColor: appColors.appTransColor,
          thumbShape: const RoundSliderThumbShape(
              enabledThumbRadius: 8,disabledThumbRadius: 8,
              pressedElevation: 0
          )),
      child: RangeSlider(
        onChanged: widget.rangeSliderOnChangeCallback,
        values: widget.values,
        min: widget.min,
        max: widget.max,
        labels: widget.labels,
        divisions: widget.divisions,
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {

  @override
  void paint(
      PaintingContext context,
      Offset offset, {
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required Animation<double> enableAnimation,
        required TextDirection textDirection,
        required Offset thumbCenter,
        Offset? secondaryOffset,
        bool isDiscrete = false,
        bool isEnabled = false,
        double additionalActiveTrackHeight = 0,
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
    // If the slider [SliderThemeData.trackHeight] is less than or equal to 0,
    // then it makes no difference whether the track is painted or not,
    // therefore the painting can be a no-op.
    if (sliderTheme.trackHeight == null || sliderTheme.trackHeight! <= 0) {
      return;
    }

    // Assign the track segment paints, which are leading: active and
    // trailing: inactive.
    final ColorTween activeTrackColorTween = ColorTween(begin: sliderTheme.disabledActiveTrackColor, end: sliderTheme.activeTrackColor);
    final ColorTween inactiveTrackColorTween = ColorTween(begin: sliderTheme.disabledInactiveTrackColor, end: sliderTheme.inactiveTrackColor);
    final Paint activePaint = Paint()..color = activeTrackColorTween.evaluate(enableAnimation)!;
    final Paint inactivePaint = Paint()..color = inactiveTrackColorTween.evaluate(enableAnimation)!;
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

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );
    final Radius trackRadius = Radius.circular(trackRect.height / 2);
    final Radius activeTrackRadius = Radius.circular((trackRect.height + additionalActiveTrackHeight) / 2);

    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        trackRect.left,
        (textDirection == TextDirection.ltr) ? trackRect.top - (additionalActiveTrackHeight / 2): trackRect.top,
        thumbCenter.dx,
        (textDirection == TextDirection.ltr) ? trackRect.bottom + (additionalActiveTrackHeight / 2) : trackRect.bottom,
        topLeft: (textDirection == TextDirection.ltr) ? activeTrackRadius : trackRadius,
        bottomLeft: (textDirection == TextDirection.ltr) ? activeTrackRadius: trackRadius,
      ),
      leftTrackPaint,
    );
    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        thumbCenter.dx,
        (textDirection == TextDirection.rtl) ? trackRect.top - (additionalActiveTrackHeight / 2) : trackRect.top,
        trackRect.right,
        (textDirection == TextDirection.rtl) ? trackRect.bottom + (additionalActiveTrackHeight / 2) : trackRect.bottom,
        topRight: (textDirection == TextDirection.rtl) ? activeTrackRadius : trackRadius,
        bottomRight: (textDirection == TextDirection.rtl) ? activeTrackRadius : trackRadius,
      ),
      rightTrackPaint,
    );

    final bool showSecondaryTrack = (secondaryOffset != null) &&
        ((textDirection == TextDirection.ltr)
            ? (secondaryOffset.dx > thumbCenter.dx)
            : (secondaryOffset.dx < thumbCenter.dx));

    if (showSecondaryTrack) {
      final ColorTween secondaryTrackColorTween = ColorTween(begin: sliderTheme.disabledSecondaryActiveTrackColor, end: sliderTheme.secondaryActiveTrackColor);
      final Paint secondaryTrackPaint = Paint()..color = secondaryTrackColorTween.evaluate(enableAnimation)!;
      if (textDirection == TextDirection.ltr) {
        context.canvas.drawRRect(
          RRect.fromLTRBAndCorners(
            thumbCenter.dx,
            trackRect.top,
            secondaryOffset.dx,
            trackRect.bottom,
            topRight: trackRadius,
            bottomRight: trackRadius,
          ),
          secondaryTrackPaint,
        );
      } else {
        context.canvas.drawRRect(
          RRect.fromLTRBAndCorners(
            secondaryOffset.dx,
            trackRect.top,
            thumbCenter.dx,
            trackRect.bottom,
            topLeft: trackRadius,
            bottomLeft: trackRadius,
          ),
          secondaryTrackPaint,
        );
      }
    }
  }

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