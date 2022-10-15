import 'package:flutter/material.dart';

extension MediaQueryValues on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double get horizontalPadding => MediaQuery.of(this).size.width * .05;
  double get verticalPadding => MediaQuery.of(this).size.height * .025;
}
