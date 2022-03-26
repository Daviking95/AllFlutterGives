import 'package:all_flutter_gives/FlutterMockTesting/core/services/api.dart';
import 'package:all_flutter_gives/FlutterMockTesting/core/viewmodels/cart_model.dart';
import 'package:all_flutter_gives/FlutterMockTesting/core/viewmodels/product_list_model.dart';
import 'package:get_it/get_it.dart';

GetIt dependencyAssembler = GetIt.instance;

void setupDependencyAssembler() {
  dependencyAssembler.registerLazySingleton(() => API());
  dependencyAssembler.registerFactory(() => ProductListModel());
  dependencyAssembler.registerFactory(() => CartModel());
}
