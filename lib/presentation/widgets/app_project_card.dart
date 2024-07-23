import 'package:flutter/material.dart';
import 'package:portfolio/app/app_size.dart';
import 'package:portfolio/app/extension.dart';
import 'package:portfolio/presentation/resources/color_res.dart';
import 'package:portfolio/presentation/widgets/app_text.dart';

class AppProjectCard extends StatelessWidget {
  final double radius;
  const AppProjectCard({
    super.key,
    this.radius = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorRes.secondary,
      width: AppSizeConfig.screenWidth - 50,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Placeholder(
            fallbackHeight: getScreenHeight(200),
          ).marginOnly(bottom: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.medium(
                "Title Project",
                fontSize: 16,
              ),
              AppText.light(
                "August 2022",
                color: ColorRes.textColorDark,
              ),
            ],
          ).marginOnly(bottom: 16.0),
          AppText("Deskripsi Project")
        ],
      ).padAll(12.0),
    ).borderRadiusAll(radius);
  }
}
