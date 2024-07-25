import 'package:get_it/get_it.dart';
import 'package:portfolio/app/app_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  instance.registerLazySingleton<AppPreferences>(
    () => AppPreferences(instance()),
  );

  instance.registerLazySingleton(() => DialogService());
  instance.registerLazySingleton(() => SnackbarService());
}
