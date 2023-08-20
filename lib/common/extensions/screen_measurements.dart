import 'package:flutter/material.dart';

extension ScreenMeasurements on BuildContext {
  double get screenHeight => MediaQuery.sizeOf(this).height;
  double get screenWidth => MediaQuery.sizeOf(this).width;
  Offset get centerOffset => MediaQuery.sizeOf(this).center(Offset.zero);
}
