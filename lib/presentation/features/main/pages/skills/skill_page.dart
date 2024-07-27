import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/app/extension.dart';
import 'package:portfolio/presentation/resources/asset_res.dart';
import 'package:portfolio/presentation/resources/color_res.dart';
import 'package:portfolio/presentation/resources/string_res.dart';
import 'package:portfolio/presentation/widgets/app_text.dart';

class SkillPage extends StatefulWidget {
  const SkillPage({super.key});

  @override
  State<SkillPage> createState() => _SkillPageState();
}

class _SkillPageState extends State<SkillPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.semiBold(
            StringResMain.skillTitle.tr(),
            fontSize: 30,
          ),
          18.height,
          Card(
            color: ColorRes.primary,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: ColorRes.secondary,
                      child: SvgPicture.asset(
                        width: 16,
                        AppSvgAssets.flutterLogo,
                      ),
                    ),
                    12.width,
                    AppText.medium("Flutter Developer Expert", fontSize: 16),
                  ],
                ).padAll(12),
                Divider(
                  height: 2,
                  color: ColorRes.dividerColor,
                ),
                AppText(
                  StringResSkill.descSkill.tr(),
                  overflow: TextOverflow.clip,
                ).padAll(12),
                AppText.medium(StringResSkill.certifiedByTitle.tr()).padAll(12),
                Stack(
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
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText.medium(
                            "Dicoding",
                            color: ColorRes.secondary,
                          ),
                          AppText(
                            "Desc Company",
                            color: ColorRes.secondary,
                            overflow: TextOverflow.clip,
                          )
                        ],
                      ).padAll(12),
                    ),
                  ],
                ).padAll(12)
              ],
            ),
          ),
        ],
      ).marginSymmetric(vertical: 34, horizontal: 18),
    );
  }
}
