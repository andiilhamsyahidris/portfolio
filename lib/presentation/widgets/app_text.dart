import 'package:flutter/material.dart';
import 'package:portfolio/presentation/resources/font_res.dart';

// ignore: must_be_immutable
class AppText extends StatelessWidget {
  String data;
  FontWeight? fontWeight = AppFontWeight.regular;
  TextAlign? textAlign;
  int? maxLines;
  double? fontSize;
  TextOverflow? overflow;
  Color? color;

  AppText(this.data,
      {super.key,
      this.textAlign,
      this.maxLines,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.overflow = TextOverflow.ellipsis});

  AppText.medium(this.data,
      {super.key,
      this.color,
      this.fontSize,
      this.textAlign,
      this.fontWeight = AppFontWeight.medium,
      this.overflow = TextOverflow.ellipsis});

  AppText.semiBold(this.data,
      {super.key,
      this.color,
      this.fontSize,
      this.textAlign,
      this.fontWeight = AppFontWeight.semiBold,
      this.overflow = TextOverflow.ellipsis});

  AppText.bold(this.data,
      {super.key,
      this.color,
      this.fontSize,
      this.textAlign,
      this.fontWeight = AppFontWeight.bold,
      this.overflow = TextOverflow.ellipsis});

  AppText.light(this.data,
      {super.key,
      this.color,
      this.fontSize,
      this.textAlign,
      this.fontWeight = AppFontWeight.light,
      this.overflow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: true,
      overflow: overflow,
      style: TextStyle(
        fontWeight: fontWeight,
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
