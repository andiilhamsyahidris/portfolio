import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app/portfolio.dart';
import 'package:portfolio/presentation/resources/language_res.dart';

void main() async {
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [bahasaLocal, englishLocal],
      path: assetsPathLocalization,
      saveLocale: true,
      startLocale: bahasaLocal,
      fallbackLocale: bahasaLocal,
      child: const PortfolioApp(),
    ),
  );
}
