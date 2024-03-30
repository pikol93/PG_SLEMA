import 'package:flutter/material.dart';

class LineSliderTickMarkShape extends SliderTickMarkShape {
  LineSliderTickMarkShape({
    this.tickMarkRadius,
    required this.tickMarkHeight,
    this.tickMarkOffsets,
  });

  final List<double>?
      tickMarkOffsets; //https://github.com/flutter/flutter/issues/62567
  int tickMarkOffsetIndex = 0;
  final double tickMarkHeight;
  final double? tickMarkRadius;

  @override
  Size getPreferredSize({
    required SliderThemeData sliderTheme,
    required bool isEnabled,
  }) {
    assert(sliderTheme.trackHeight != null);
    return Size.fromRadius(tickMarkRadius ?? sliderTheme.trackHeight! / 4);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required TextDirection textDirection,
    required Offset thumbCenter,
    required bool isEnabled,
  }) {
    Color? begin;
    Color? end;
    switch (textDirection) {
      case TextDirection.ltr:
        final bool isTickMarkRightOfThumb = center.dx > thumbCenter.dx;
        begin = isTickMarkRightOfThumb
            ? sliderTheme.disabledInactiveTickMarkColor
            : sliderTheme.disabledActiveTickMarkColor;
        end = isTickMarkRightOfThumb
            ? sliderTheme.inactiveTickMarkColor
            : sliderTheme.activeTickMarkColor;
        break;
      case TextDirection.rtl:
        final bool isTickMarkLeftOfThumb = center.dx < thumbCenter.dx;
        begin = isTickMarkLeftOfThumb
            ? sliderTheme.disabledInactiveTickMarkColor
            : sliderTheme.disabledActiveTickMarkColor;
        end = isTickMarkLeftOfThumb
            ? sliderTheme.inactiveTickMarkColor
            : sliderTheme.activeTickMarkColor;
        break;
    }
    final Paint paint = Paint()
      ..color = ColorTween(begin: begin, end: end).evaluate(enableAnimation)!;

    final double tickMarkRadius = getPreferredSize(
          isEnabled: isEnabled,
          sliderTheme: sliderTheme,
        ).width /
        2;
    if (tickMarkRadius > 0) {
      context.canvas.drawRRect(
          RRect.fromLTRBR(
            center.dx + (tickMarkOffsets?[tickMarkOffsetIndex] ?? 0) - 1,
            center.dy - tickMarkHeight / 2,
            center.dx + (tickMarkOffsets?[tickMarkOffsetIndex++] ?? 0) + 1,
            center.dy + tickMarkHeight / 2,
            const Radius.circular(20),
          ),
          paint);
    }

    if (tickMarkOffsetIndex == (tickMarkOffsets?.length ?? 0)) {
      tickMarkOffsetIndex = 0;
    }
  }
}
