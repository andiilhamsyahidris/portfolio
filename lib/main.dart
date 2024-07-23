import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app/app_injection.dart';
import 'package:portfolio/app/portfolio.dart';
import 'package:portfolio/presentation/resources/language_res.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await initAppModule();
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
