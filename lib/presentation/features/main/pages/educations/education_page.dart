import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app/app_constant.dart';
import 'package:portfolio/app/extension.dart';
import 'package:portfolio/presentation/resources/asset_res.dart';
import 'package:portfolio/presentation/resources/color_res.dart';
import 'package:portfolio/presentation/resources/string_res.dart';
import 'package:portfolio/presentation/widgets/app_card.dart';
import 'package:portfolio/presentation/widgets/app_text.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.semiBold(
            StringResMain.educationTitle.tr(),
            fontSize: 30,
          ),
          18.height,
          AppCard(
            headerImageAsset: EducationConstant
                .educations[EducationConstant.keyImageEducation],
            title: EducationConstant
                .educations[EducationConstant.keyTitleEducation],
            date: EducationConstant
                .educations[EducationConstant.keyDateEducation],
            desc: EducationConstant
                .educations[EducationConstant.keyMajorEducation],
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
                  "GPA ${EducationConstant.educations[EducationConstant.keyGpaEducation]}",
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
