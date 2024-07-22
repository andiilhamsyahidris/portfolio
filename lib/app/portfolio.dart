import 'package:flutter/material.dart';
import 'package:portfolio/presentation/features/main/main_screen.dart';
import 'package:portfolio/presentation/resources/theme_res.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      theme: portfolioTheme(false),
      home: const MainScreen(),
    );
  }
}
