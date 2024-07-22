import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app/extension.dart';
import 'package:portfolio/presentation/resources/color_res.dart';
import 'package:portfolio/presentation/resources/string_res.dart';
import 'package:portfolio/presentation/widgets/app_filled_button.dart';
import 'package:portfolio/presentation/widgets/app_text.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: AppText.semiBold(
              '${StringResHome.greetingTitle.tr()} Andi Ilhamsyah Idris',
            ).padOnly(bottom: 12.0),
          ),
          Flexible(
            child: AppText.medium(
              "A Mobile Developer based in Jakarta, Indonesia",
            ).padOnly(bottom: 12.0),
          ),
          Flexible(
            child: AppText(StringResHome.introduceTitle.tr()),
          ),
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppFilledButton(
                  color: ColorRes.third,
                  text: StringResHome.contactMeTitle.tr(),
                  radius: 8.0,
                  onTap: () {},
                ),
                AppFilledButton(
                  color: ColorRes.secondary,
                  text: StringResHome.seeMyWorkTitle.tr(),
                  radius: 8.0,
                  onTap: () {},
                ),
              ],
            ),
          ).padSymmetric(vertical: 12.0),
        ],
      ).marginSymmetric(
        vertical: 12,
        horizontal: 8,
      ),
    );
  }
}
