
import 'package:all_flutter_gives/FlutterWeb/services/api.dart';
import 'package:all_flutter_gives/FlutterWeb/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ApiService());
}