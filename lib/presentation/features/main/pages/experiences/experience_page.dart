import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app/extension.dart';
import 'package:portfolio/presentation/resources/asset_res.dart';
import 'package:portfolio/presentation/resources/color_res.dart';
import 'package:portfolio/presentation/resources/string_res.dart';
import 'package:portfolio/presentation/widgets/app_card.dart';
import 'package:portfolio/presentation/widgets/app_text.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({super.key});

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.semiBold(
            StringResMain.experienceTitle.tr(),
            fontSize: 30,
          ),
          18.height,
          AppCard(
            headerImageAsset: "",
            title: "Title Project",
            date: "August 2022",
            desc: "Deskripsi Project",
            children: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: ColorRes.secondary,
                  child: Image.asset(
                    AppPngAssets.trophy,
                    width: 12,
                  ),
                ),
                8.width,
                AppText.light(
                  "August 2022",
                  color: ColorRes.textColorDark,
                ),
              ],
            ).marginOnly(bottom: 16.0, left: 10.0, right: 10.0),
          ),
        ],
      ).marginSymmetric(vertical: 34, horizontal: 18),
    );
  }
}
