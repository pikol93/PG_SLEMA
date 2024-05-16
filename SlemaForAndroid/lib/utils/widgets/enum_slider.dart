import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class EnumSlider<T extends Enum> extends StatefulWidget {
  final List<T> values;
  final T initialValue;
  final void Function(T) onValueChanged;

  const EnumSlider({
    super.key,
    required this.values,
    required this.initialValue,
    required this.onValueChanged,
  });

  @override
  State<StatefulWidget> createState() => EnumSliderState<T>();
}

class EnumSliderState<T extends Enum> extends State<EnumSlider<T>> with Logger {
  late T _lastValue;
  late double _currentSliderPosition;

  @override
  void initState() {
    super.initState();
    _lastValue = widget.initialValue;
    _currentSliderPosition = _fromVariant(widget.initialValue);
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderPosition,
      divisions: widget.values.length - 1,
      onChanged: _onChanged,
    );
  }

  double _fromVariant(T variant) {
    int index = -1;
    for (int i = 0; i < widget.values.length; i++) {
      if (widget.values[i] == variant) {
        index = i;
        break;
      }
    }

    if (index == -1) {
      return 0.0;
    }

    return index / (widget.values.length - 1);
  }

  T _toVariant(double value) {
    final index =
        min((value * widget.values.length).floor(), widget.values.length - 1);
    return widget.values[index];
  }

  void _onChanged(double value) {
    logger.debug(
        "on enum slider changed: $value ${_toVariant(value)} ${_fromVariant(_toVariant(value))}");
    T variant = _toVariant(value);
    if (_lastValue == variant) {
      return;
    }

    _lastValue = variant;
    widget.onValueChanged(variant);

    setState(() {
      _currentSliderPosition = value;
    });
  }
}
