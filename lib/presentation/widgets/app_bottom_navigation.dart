import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/presentation/extensions/extension.dart';
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
        width: double.infinity,
        height: 65,
        color: ColorRes.secondary,
        child: Row(
          children: [
            TabIcon(
              isActive: currentIndex == 0,
              onPress: () => onTap,
              selectedIconPath: '',
              unselectedIconPath: '',
            ),
            TabIcon(
              isActive: currentIndex == 1,
              onPress: () => onTap,
              selectedIconPath: '',
              unselectedIconPath: '',
            ),
            TabIcon(
              isActive: currentIndex == 2,
              onPress: () => onTap,
              selectedIconPath: '',
              unselectedIconPath: '',
            ),
            TabIcon(
              isActive: currentIndex == 3,
              onPress: () => onTap,
              selectedIconPath: '',
              unselectedIconPath: '',
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
  final VoidCallback onPress;

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
        onTap: onPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 5,
              width: isActive ? 24 : 0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorRes.primary,
              ),
            ),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 22,
                  child: SvgPicture.asset(
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
