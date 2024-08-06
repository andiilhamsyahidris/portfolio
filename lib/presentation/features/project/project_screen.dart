import 'package:flutter/material.dart';
import 'package:portfolio/app/app_size.dart';
import 'package:portfolio/presentation/features/project/project_viewmodel.dart';
import 'package:portfolio/presentation/resources/color_res.dart';
import 'package:stacked/stacked.dart';

class ProjectScreen extends StackedView<ProjectViewModel> {
  const ProjectScreen({super.key});

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return Container();
      default:
        return Container();
    }
  }

  @override
  Widget builder(
      BuildContext context, ProjectViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorRes.secondary,
        scrolledUnderElevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(
            getScreenHeight(12),
          ),
          child: TabBar(
            tabs: [
              Tab(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  ProjectViewModel viewModelBuilder(BuildContext context) => ProjectViewModel();
}
