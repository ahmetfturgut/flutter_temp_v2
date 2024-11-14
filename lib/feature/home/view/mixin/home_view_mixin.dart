import 'package:architecture_template/feature/home/view/home_view.dart';
import 'package:architecture_template/feature/home/view_model/home_view_model.dart';
import 'package:architecture_template/product/service/login_service.dart';
import 'package:architecture_template/product/service/manager/index.dart';
import 'package:architecture_template/product/state/container/index.dart';
import 'package:flutter/material.dart';

import '../../../../product/state/base/base_state.dart';

/// Home view mixin
mixin HomeViewMixin on BaseState<HomeView> {
  late final ProductNetworkErrorManager _productNetworkErrorManager;
  late final HomeViewModel _homeViewModel;

  /// Home view model
  HomeViewModel get homeViewModel => _homeViewModel;

  @override
  void initState() {
    super.initState();
    _productNetworkErrorManager = ProductNetworkErrorManager(context);
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: _productNetworkErrorManager.handleError,
    );

    _homeViewModel = HomeViewModel(
      operationService: LoginService(productNetworkManager),
    );
  }
}
