import 'package:get_it/get_it.dart';
import 'package:talenty_app/core/config/config.dart';
import 'package:talenty_app/core/enums/env.dart';
import 'package:talenty_app/core/services/auth_services.dart';
import 'package:talenty_app/core/services/db_services.dart';
import 'package:talenty_app/core/services/file_picker.dart';
import 'package:talenty_app/core/services/local_storage_services.dart';
import 'package:talenty_app/core/services/notification_services.dart';
import 'core/services/api_services.dart';

GetIt locator = GetIt.instance;

setupLocator(Env env) async {
  locator.registerSingleton(Config(env));
  locator.registerSingleton(LocalStorageService());
  locator.registerSingleton(NotificationsService());
  locator.registerSingleton(ApiService());
  locator.registerLazySingleton<DatabaseService>(() => DatabaseService());
  locator.registerSingleton<AuthService>(AuthService());
  locator.registerLazySingleton(() => FilePickerService());
}
