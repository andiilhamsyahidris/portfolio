import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app/app_injection.dart';
import 'package:portfolio/app/app_prefs.dart';
import 'package:portfolio/app/extension.dart';
import 'package:portfolio/presentation/resources/asset_res.dart';
import 'package:portfolio/presentation/resources/color_res.dart';
import 'package:portfolio/presentation/resources/language_res.dart';

// ignore: must_be_immutable
class AppSwitchLangButton extends StatefulWidget {
  AppSwitchLangButton(this.externalContext, {super.key});

  BuildContext externalContext;

  @override
  State<AppSwitchLangButton> createState() => _AppSwitchLangButtonState();
}

class _AppSwitchLangButtonState extends State<AppSwitchLangButton> {
  List<String> list = [
    bahasaLocal.languageCode.toUpperCase(),
    englishLocal.languageCode.toUpperCase()
  ];
  final AppPreferences _appPreferences = instance<AppPreferences>();
  String? myLang;
  late bool isSelectedID;
  late bool isSelectedEN;

  List<bool> isSelected = [];

  @override
  void initState() {
    appLanguage();
    super.initState();
  }

  void appLanguage() async {
    myLang = await _appPreferences.getAppLanguage();
    switch (myLang) {
      case 'ID':
        setState(() {
          isSelectedID = true;
          isSelectedEN = false;
          isSelected.addAll([isSelectedEN, isSelectedID]);
        });
        break;
      case 'EN':
        setState(() {
          isSelectedEN = true;
          isSelectedID = false;
          isSelected.addAll([isSelectedEN, isSelectedID]);
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: isSelected.isEmpty ? [true, false] : isSelected,
      selectedColor: ColorRes.primary,
      borderRadius: BorderRadius.circular(24),
      constraints: const BoxConstraints(
        minHeight: 40,
        minWidth: 40,
      ),
      onPressed: (int index) async {
        setState(() {
          for (int i = 0; i < isSelected.length; i++) {
            isSelected[i] = i == index;
          }
        });
        if (index == 0) {
          await _appPreferences
              .setLanguageChanged(LanguageType.english.getValue());
          setState(() {
            widget.externalContext.setLocale(englishLocal);
          });
        } else if (index == 1) {
          await _appPreferences
              .setLanguageChanged(LanguageType.bahasa.getValue());
          setState(() {
            widget.externalContext.setLocale(bahasaLocal);
          });
        }
      },
      children: const <Widget>[
        CircleAvatar(
          radius: 8,
          backgroundImage: AssetImage(
            AppPngAssets.enUS,
          ),
        ),
        CircleAvatar(
          radius: 8,
          backgroundImage: AssetImage(
            AppPngAssets.idID,
          ),
        ),
      ],
    );
  }
}
