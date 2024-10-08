import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app/app_constant.dart';
import 'package:portfolio/app/app_size.dart';
import 'package:portfolio/app/extension.dart';
import 'package:portfolio/presentation/features/main/pages/home/home_viewmodel.dart';
import 'package:portfolio/presentation/resources/asset_res.dart';
import 'package:portfolio/presentation/resources/color_res.dart';
import 'package:portfolio/presentation/resources/route_res.dart';
import 'package:portfolio/presentation/resources/string_res.dart';
import 'package:portfolio/presentation/widgets/app_card.dart';
import 'package:portfolio/presentation/widgets/app_filled_button.dart';
import 'package:portfolio/presentation/widgets/app_text.dart';
import 'package:stacked/stacked.dart';

class Homepage extends StackedView<HomeViewModel> {
  const Homepage({super.key});

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(AppPngAssets.photo),
                  radius: 42,
                ).marginOnly(bottom: 16.0),
                AppText.semiBold(
                  '${StringResHome.greetingTitle.tr()} Andi Ilhamsyah Idris',
                  fontSize: 30,
                  overflow: TextOverflow.clip,
                ).marginOnly(bottom: 21.0),
                AppText.medium(
                  "A Mobile Developer based in Jakarta, Indonesia",
                  overflow: TextOverflow.clip,
                  fontSize: 20,
                ).marginOnly(bottom: 18.0),
                AppText(
                  StringResHome.introduceTitle.tr(),
                  overflow: TextOverflow.clip,
                ).onFlexible(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppFilledButton(
                      color: ColorRes.third,
                      text: StringResHome.contactMeTitle.tr(),
                      radius: 8.0,
                      onTap: () => viewModel.sendEmail(),
                    ),
                    21.width,
                    AppFilledButton(
                        color: ColorRes.secondary,
                        textColor: ColorRes.third,
                        text: StringResHome.seeMyWorkTitle.tr(),
                        radius: 8.0,
                        onTap: () => Navigator.of(context)
                            .pushNamed(AppRoutes.mainRoute)),
                  ],
                ).marginSymmetric(vertical: 18.0),
              ],
            ),
          ).marginSymmetric(
            vertical: 34,
            horizontal: 18,
          ),
          Container(
            color: ColorRes.primary,
            width: AppSizeConfig.screenWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.medium(
                  StringResHome.latestProjectTitle.tr(),
                  fontSize: 18,
                ).marginOnly(bottom: 24.0),
                SizedBox(
                  height: getScreenHeight(400),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final data = ProjectConstant.projects[index];
                      return SizedBox(
                        width: AppSizeConfig.screenWidth - 50,
                        child: AppCard(
                          headerImageAsset:
                              data[ProjectConstant.keyImageProject],
                          title: data[ProjectConstant.keyTitleProject],
                          date: data[ProjectConstant.keyDateProject],
                          desc: data[ProjectConstant.keyDescProject],
                          colorCard: ColorRes.secondary,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => 12.width,
                    itemCount: ProjectConstant.projects.length,
                  ),
                ),
              ],
            ).padSymmetric(horizontal: 16.0, vertical: 36.0),
          )
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
