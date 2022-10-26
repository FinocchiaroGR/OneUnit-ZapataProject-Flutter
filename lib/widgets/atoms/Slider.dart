import 'package:flutter/material.dart';

import 'package:app/styles/colors.dart' as app_color;

class AppSlider extends StatefulWidget {
  final double minValue;
  final double maxValue;
  final double initialValue;
  final int divisions;

  const AppSlider({
    super.key,
    required this.minValue,
    required this.maxValue,
    required this.initialValue,
    required this.divisions,
  });

  @override
  State<AppSlider> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<AppSlider> {
  late double _currentSliderValue;

  @override
  void initState() {
    super.initState();
    _currentSliderValue = widget.initialValue < widget.minValue
        ? widget.minValue
        : widget.initialValue;
  }

  void _onChange(double value) {
    setState(() {
      _currentSliderValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      activeColor: app_color.primary,
      inactiveColor: app_color.shadow,
      min: widget.minValue,
      max: widget.maxValue,
      divisions: widget.divisions,
      label: _currentSliderValue.round().toString(),
      onChanged: _onChange,
    );
  }
}
