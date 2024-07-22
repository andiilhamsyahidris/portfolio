import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app/extension.dart';
import 'package:portfolio/presentation/resources/color_res.dart';
import 'package:portfolio/presentation/resources/string_res.dart';
import 'package:portfolio/presentation/widgets/app_text.dart';

class AppFilledButton extends StatelessWidget {
  final Color color;
  final String text;
  final double radius;
  final VoidCallback onTap;

  const AppFilledButton({
    super.key,
    required this.color,
    required this.text,
    required this.onTap,
    this.radius = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onTap,
      style: FilledButton.styleFrom(
        backgroundColor: ColorRes.third,
      ),
      child: AppText(StringResHome.contactMeTitle.tr()),
    ).borderRadiusAll(radius);
  }
}
