
import 'package:architecture_template/product/state/container/product_state_container.dart';

import '../../service/manager/product_service_manager.dart';
final class ProductStateItems {
  const ProductStateItems._();

  static ProductNetworkManager get productNetworkManager =>
      ProductContainer.read<ProductNetworkManager>();

}
