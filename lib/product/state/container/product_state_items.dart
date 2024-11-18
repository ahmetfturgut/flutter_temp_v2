import 'package:architecture_template/product/service/manager/product_service_manager.dart';
import 'package:architecture_template/product/state/container/product_state_container.dart';
import 'package:architecture_template/product/state/view_model/product_view_model.dart';

/// [ProductStateItems] is a class that contains the instances of the feature.
final class ProductStateItems {
  const ProductStateItems._();

  /// [productNetworkManager] is an instance of [ProductNetworkManager].
  static ProductNetworkManager get productNetworkManager =>
      ProductContainer.read<ProductNetworkManager>();

  /// [productViewModel] is an instance of [ProductViewModel].
  static ProductViewModel get productViewModel =>
      ProductContainer.read<ProductViewModel>();
}
