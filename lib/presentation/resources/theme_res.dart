import 'package:flutter/material.dart';
import 'package:portfolio/presentation/resources/color_res.dart';

ThemeData portfolioTheme(bool isDark) {
  return ThemeData(
      primaryColor: ColorRes.primary,
      brightness: isDark ? Brightness.dark : Brightness.light,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: ColorRes.primary,
        onPrimary: ColorRes.secondary,
        background: isDark ? ColorRes.third : ColorRes.secondary,
        brightness: isDark ? Brightness.dark : Brightness.light,
      ));
}
