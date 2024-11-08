
import 'package:flutter/material.dart';

import '../../service/manager/product_service_manager.dart';
import '../container/product_state_items.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ProductNetworkManager get productNetworkManager =>
      ProductStateItems.productNetworkManager;

}
