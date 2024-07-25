import 'package:flutter/material.dart';
import 'package:portfolio/presentation/resources/color_res.dart';
import 'package:portfolio/presentation/resources/language_res.dart';

extension FlexExpandExtension on Widget {
  Widget onFlexible() => Flexible(child: this);
  Widget onExpanded() => Expanded(child: this);
}

extension EmptySpace on num {
  SizedBox get height => SizedBox(height: toDouble());
  SizedBox get width => SizedBox(width: toDouble());
}

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

extension BorderRadiusExtension on Widget {
  Widget borderRadiusAll(double value) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(value))),
        child: this,
      );

  Widget borderRadiusVertical({double top = 0.0, double bottom = 0.0}) =>
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
          top: Radius.circular(top),
          bottom: Radius.circular(bottom),
        )),
        child: this,
      );

  Widget borderRadiusHorizontal({double left = 0.0, double right = 0.0}) =>
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(
          left: Radius.circular(left),
          right: Radius.circular(right),
        )),
        child: this,
      );

  Widget borderRadiusOnly(
          {double topLeft = 0.0,
          double topRight = 0.0,
          double bottomLeft = 0.0,
          double bottomRight = 0.0}) =>
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeft),
              topRight: Radius.circular(topRight),
              bottomLeft: Radius.circular(bottomLeft),
              bottomRight: Radius.circular(bottomRight)),
        ),
        child: this,
      );
}

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.bahasa:
        return bahasa;
      case LanguageType.english:
        return english;
    }
  }
}
