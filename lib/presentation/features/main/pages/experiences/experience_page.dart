import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app/app_constant.dart';
import 'package:portfolio/app/extension.dart';
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
          ListView.separated(
            shrinkWrap: true,
            controller: ScrollController(keepScrollOffset: false),
            itemBuilder: (context, index) {
              final data = ExperienceConstant.experiences[index];
              return AppCard(
                headerImageAsset: data[ExperienceConstant.keyImageExperience],
                title: data[ExperienceConstant.keyPositionExperience],
                date: data[ExperienceConstant.keyDateExperience],
                desc: data[ExperienceConstant.keyCompanyExperience],
                children: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppText(
                      data[ExperienceConstant.keyDescExperience],
                      overflow: TextOverflow.clip,
                      color: ColorRes.textColorDark,
                    ),
                  ],
                ).marginOnly(bottom: 16.0, left: 10.0, right: 10.0),
              );
            },
            separatorBuilder: (context, index) => 12.height,
            itemCount: ExperienceConstant.experiences.length,
          ),
        ],
      ).marginSymmetric(vertical: 34, horizontal: 18),
    );
  }
}
