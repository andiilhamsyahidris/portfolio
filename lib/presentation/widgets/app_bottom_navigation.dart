import 'package:flutter/material.dart';
import 'package:portfolio/app/app_size.dart';
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
    return ClipRRect(
      child: Container(
        width: AppSizeConfig.screenWidth,
        height: 65,
        decoration: BoxDecoration(
            color: ColorRes.secondary,
            border: Border(
              top: BorderSide(color: ColorRes.dividerColor!),
            )),
        child: Row(
          children: [
            TabIcon(
              isActive: currentIndex == 0,
              onPress: onTap,
              selectedIconPath: AppPngAssetsSelected.home,
              unselectedIconPath: AppPngAssetsUnselected.home,
            ),
            TabIcon(
              isActive: currentIndex == 1,
              onPress: onTap,
              selectedIconPath: AppPngAssetsSelected.education,
              unselectedIconPath: AppPngAssetsUnselected.education,
            ),
            TabIcon(
              isActive: currentIndex == 2,
              onPress: onTap,
              selectedIconPath: AppPngAssetsSelected.job,
              unselectedIconPath: AppPngAssetsUnselected.job,
            ),
            TabIcon(
              isActive: currentIndex == 3,
              onPress: onTap,
              selectedIconPath: AppPngAssetsSelected.skill,
              unselectedIconPath: AppPngAssetsUnselected.skill,
            ),
          ],
        ),
      ),
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
  final void Function(int) onPress;

  const TabIcon({
    super.key,
    required this.isActive,
    required this.selectedIconPath,
    required this.onPress,
    required this.unselectedIconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => onPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 22,
                  child: Image.asset(
                    isActive ? selectedIconPath : unselectedIconPath,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
