import 'package:flutter/material.dart';
import 'package:portfolio/app/extension.dart';
import 'package:portfolio/presentation/resources/color_res.dart';
import 'package:portfolio/presentation/widgets/app_text.dart';

class AppCard extends StatelessWidget {
  final String title;
  final String? date;
  final String desc;
  final bool withHeaderImage;
  final String? headerImageAsset;
  final Color colorCard;
  final Widget? children;

  const AppCard({
    super.key,
    required this.title,
    required this.desc,
    this.date,
    this.withHeaderImage = true,
    this.headerImageAsset,
    this.colorCard = ColorRes.primary,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: colorCard,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          withHeaderImage
              ? Stack(
                  children: [
                    const Placeholder(
                      fallbackHeight: 200,
                    ),
                    Container(
                      height: 200,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.black54, Colors.transparent],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter),
                      ),
                    ).borderRadiusVertical(top: 30),
                  ],
                )
              : const SizedBox.shrink(),
          24.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.medium(
                title,
                fontSize: 16,
              ),
              AppText.light(
                date ?? "",
                color: ColorRes.textColorDark,
              ),
            ],
          ).marginOnly(bottom: 16.0, left: 10.0, right: 10.0),
          AppText(desc).marginOnly(bottom: 16.0, left: 10.0, right: 10.0),
          children ?? Container(),
        ],
      ),
    ).borderRadiusAll(30);
  }
}
