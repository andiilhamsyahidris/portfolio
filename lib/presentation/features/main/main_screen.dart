import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app/app_size.dart';
import 'package:portfolio/app/extension.dart';
import 'package:portfolio/presentation/features/main/main_viewmodel.dart';
import 'package:portfolio/presentation/features/main/pages/educations/education_page.dart';
import 'package:portfolio/presentation/features/main/pages/experiences/experience_page.dart';
import 'package:portfolio/presentation/features/main/pages/home/home_page.dart';
import 'package:portfolio/presentation/features/main/pages/skills/skill_page.dart';
import 'package:portfolio/presentation/resources/color_res.dart';
import 'package:portfolio/presentation/resources/string_res.dart';
import 'package:portfolio/presentation/widgets/app_bottom_navigation.dart';
import 'package:portfolio/presentation/widgets/app_text.dart';
import 'package:stacked/stacked.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => MainViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            leading: AppText.semiBold(
              StringResMain.portfolioTitle.tr(),
              fontSize: 24.0,
            ).padAll(12.0),
            leadingWidth: getScreenWidth(200),
            backgroundColor: ColorRes.secondary,
            scrolledUnderElevation: 0,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(2.0),
              child: Container(
                height: 1.5,
                color: ColorRes.dividerColor,
              ),
            ),
            actions: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: AppText.light(
                      "Jakarta, Indonesia",
                      fontSize: 10,
                    ).padAll(8.0),
                  ),
                  Flexible(
                    child: AppText.medium(
                      "6:18:31 pm",
                      fontSize: 10,
                    ).padSymmetric(horizontal: 8.0),
                  )
                ],
              ),
            ],
          ),
          body: getViewForIndex(viewModel.currentIndex),
          bottomNavigationBar: AppBottomNavigation(
            currentIndex: viewModel.currentIndex,
            onTap: viewModel.setIndex,
          ),
        );
      },
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const Homepage();
      case 1:
        return const EducationPage();
      case 2:
        return const ExperiencePage();
      case 3:
        return const SkillPage();
      default:
        return Container();
    }
  }
}
