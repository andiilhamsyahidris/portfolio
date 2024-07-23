import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app/app_size.dart';
import 'package:portfolio/presentation/features/main/main_screen.dart';
import 'package:portfolio/presentation/resources/theme_res.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizeConfig.init(context);
    return MaterialApp(
      title: 'Portfolio',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: portfolioTheme(false),
      home: const MainScreen(),
    );
  }
}
