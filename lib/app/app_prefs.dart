import 'package:portfolio/app/extension.dart';
import 'package:portfolio/presentation/resources/language_res.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String prefsKeyLang = "prefs_key_lang";

class AppPreferences {
  final SharedPreferences _preferences;

  AppPreferences(this._preferences);

  Future<String> getAppLanguage() async {
    String? language = _preferences.getString(prefsKeyLang);

    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.bahasa.getValue();
    }
  }

  Future<void> setLanguageChanged(String language) async {
    await _preferences.setString(prefsKeyLang, language);
  }
}
