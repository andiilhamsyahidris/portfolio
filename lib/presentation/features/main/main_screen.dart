import 'package:flutter/material.dart';
import 'package:portfolio/presentation/features/main/main_viewmodel.dart';
import 'package:portfolio/presentation/features/main/pages/educations/education_page.dart';
import 'package:portfolio/presentation/features/main/pages/experiences/experience_page.dart';
import 'package:portfolio/presentation/features/main/pages/home/home_page.dart';
import 'package:portfolio/presentation/features/main/pages/skills/skill_page.dart';
import 'package:portfolio/presentation/widgets/app_bottom_navigation.dart';
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
