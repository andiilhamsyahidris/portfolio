import 'package:flutter/material.dart';
import 'package:portfolio/presentation/resources/color_res.dart';

extension PaddingExtension on Widget {
  Widget padAll(double value) => Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );
  Widget padSymmetric({double vertical = 0.0, double horizontal = 0.0}) =>
      Padding(
        padding:
            EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        child: this,
      );

  Widget padOnly(
          {double top = 0.0,
          double left = 0.0,
          double bottom = 0.0,
          double right = 0.0}) =>
      Padding(
        padding:
            EdgeInsets.only(top: top, left: left, bottom: bottom, right: right),
        child: this,
      );
}

extension MarginExtension on Widget {
  Widget marginAll(double value) => Container(
        margin: EdgeInsets.all(value),
        child: this,
      );
  Widget marginSymmetric({double vertical = 0.0, double horizontal = 0.0}) =>
      Container(
        margin:
            EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        child: this,
      );
  Widget marginOnly(
          {double top = 0.0,
          double left = 0.0,
          double bottom = 0.0,
          double right = 0.0}) =>
      Container(
        margin:
            EdgeInsets.only(top: top, left: left, bottom: bottom, right: right),
        child: this,
      );
}

extension VisibleExtension on Widget {
  Widget visible(bool isVisible) => isVisible ? this : const SizedBox.shrink();
}

extension BorderExtension on Widget {
  Widget withBorder({Color color = ColorRes.third, double width = 1.0}) =>
      Container(
        decoration:
            BoxDecoration(border: Border.all(color: color, width: width)),
      );
}
