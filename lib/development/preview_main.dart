// ignore_for_file: depend_on_referenced_packages

import 'package:architecture_template/product/init/application_initialaze.dart';
import 'package:architecture_template/product/init/theme/custom_dark_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:widgets/widgets.dart';

import '../product/init/product_localization.dart';
import '../product/init/theme/custom_light_theme.dart';
import '../product/navigation/app_router.dart';

Future<void> main() async {
  await ApplicationInitialize().make();
  runApp(
    DevicePreview(
      builder: (context) =>
          ProductLocalization(child: const _MyApp()),
    ),
  );
}

final class _MyApp extends StatelessWidget {
  const _MyApp();
  static final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      builder: CustomResponsive.build,
      theme: CustomLightTheme().themeData,
      darkTheme: CustomDarkTheme().themeData,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
