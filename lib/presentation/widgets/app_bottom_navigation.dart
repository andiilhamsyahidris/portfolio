import 'package:flutter/material.dart';
import 'package:portfolio/app/extension.dart';
import 'package:portfolio/presentation/resources/asset_res.dart';
import 'package:portfolio/presentation/resources/color_res.dart';

class AppBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;
  const AppBottomNavigation(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: currentIndex,
      selectedFontSize: 0.0,
      unselectedFontSize: 0.0,
      items: [
        BottomNavigationBarItem(
            icon: TabIcon(
              isActive: currentIndex == 0,
              selectedIconPath: AppPngAssetsSelected.home,
              unselectedIconPath: AppPngAssetsUnselected.home,
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: TabIcon(
              isActive: currentIndex == 1,
              selectedIconPath: AppPngAssetsSelected.education,
              unselectedIconPath: AppPngAssetsUnselected.education,
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: TabIcon(
              isActive: currentIndex == 2,
              selectedIconPath: AppPngAssetsSelected.job,
              unselectedIconPath: AppPngAssetsUnselected.job,
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: TabIcon(
              isActive: currentIndex == 3,
              selectedIconPath: AppPngAssetsSelected.skill,
              unselectedIconPath: AppPngAssetsUnselected.skill,
            ),
            label: ""),
      ],
    ).borderRadiusOnly(
      topLeft: 12,
      topRight: 12,
    );
  }
}

class TabIcon extends StatelessWidget {
  final String selectedIconPath;
  final String unselectedIconPath;
  final bool isActive;

  const TabIcon({
    super.key,
    required this.isActive,
    required this.selectedIconPath,
    required this.unselectedIconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      alignment: WrapAlignment.center,
      children: <Widget>[
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 5,
          width: isActive ? 24 : 0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: ColorRes.third,
          ),
        ),
        8.height,
        Center(
          child: SizedBox(
            width: 22,
            child: Image.asset(
              isActive ? selectedIconPath : unselectedIconPath,
            ),
          ),
        ),
      ],
    );
  }
}
