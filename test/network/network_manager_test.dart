import 'dart:io';
import 'package:architecture_template/product/init/config/app_environment.dart';
import 'package:architecture_template/product/service/manager/index.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gen/gen.dart';
import 'package:vexana/vexana.dart';

void main() {
  late ProductNetworkManager manager;

  AppEnvironment.general();

  setUp(() {
    manager = ProductNetworkManager.base();
  });

  test('get users items from api', () async {
    final response = await manager.send<User, List<User>>(
      ProductServicePath.posts.value,
      parseModel: User(),
      method: RequestType.GET,
    );

    expect(response.data, isNotNull);
  });

  test('get users items from api with error', () async {
    manager.listenErrorState(
      onErrorStatus: (value) {
        if (value == HttpStatus.unauthorized) {}
        expect(value, isNotNull);
      },
    );
    final response = await manager.send<User, List<User>>(
      ProductServicePath.userV1.value,
      parseModel: User(),
      method: RequestType.GET,
    );

    expect(response.data, null);
  });
}
