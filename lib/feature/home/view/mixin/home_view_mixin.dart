import 'package:architecture_template/feature/home/view/home_view.dart';
import 'package:architecture_template/product/service/login_service.dart';
import 'package:architecture_template/product/service/manager/index.dart';
import 'package:architecture_template/product/state/container/index.dart';
import 'package:flutter/material.dart';

mixin HomeViewMixin on State<HomeView> {
  late final LoginService loginService;
  late final ProductNetworkErrorManager productNetworkErrorManager;

  @override
  void initState() {
    super.initState();
    loginService = LoginService(ProductStateItems.productNetworkManager);
    productNetworkErrorManager = ProductNetworkErrorManager(context);
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: productNetworkErrorManager.handleError,
    );
  }
}
