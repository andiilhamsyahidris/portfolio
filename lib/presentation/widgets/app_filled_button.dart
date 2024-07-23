import 'package:flutter/material.dart';
import 'package:portfolio/presentation/resources/color_res.dart';
import 'package:portfolio/presentation/widgets/app_text.dart';

class AppFilledButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final Color borderColor;
  final String text;
  final double radius;
  final double borderWidth;
  final VoidCallback onTap;

  const AppFilledButton({
    super.key,
    required this.color,
    required this.text,
    required this.onTap,
    this.textColor = ColorRes.secondary,
    this.borderColor = ColorRes.third,
    this.radius = 0.0,
    this.borderWidth = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onTap,
      style: FilledButton.styleFrom(
        backgroundColor: color,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        side: BorderSide(
          width: borderWidth,
          color: borderColor,
        ),
      ),
      child: AppText(text, color: textColor),
    );
  }
}
