import 'package:get_it/get_it.dart';
import 'package:green_app/services/authentication_service.dart';
import 'package:green_app/services/dialog_service.dart';
import 'package:green_app/services/fireStoreService.dart';
import 'package:green_app/services/navigation_service.dart';


GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => FirestoreService());
}
