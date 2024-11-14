 import 'package:get_it/get_it.dart';

import '../../service/manager/product_service_manager.dart';

/// Product container for dependency injection
final class ProductContainer {
  const ProductContainer._();

  static final _getIt = GetIt.I;

  ///
  static void setup() {
    _getIt.registerSingleton<ProductNetworkManager>(ProductNetworkManager.base());
  }

  /// read your dependency item for [ProductContainer]
  static T read<T extends Object>() => _getIt<T>();
}
