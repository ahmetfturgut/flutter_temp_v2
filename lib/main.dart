import 'dart:io';

import 'package:architecture_template/feature/home/view/home_view.dart';
import 'package:architecture_template/product/init/application_initialaze.dart';
import 'package:architecture_template/product/init/product_localization.dart';
import 'package:architecture_template/product/init/state_initialize.dart';
import 'package:architecture_template/product/init/theme/custom_dark_theme.dart';
import 'package:architecture_template/product/init/theme/custom_light_theme.dart';
import 'package:architecture_template/product/navigation/app_router.dart';
import 'package:architecture_template/product/state/view_model/product_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgets/widgets.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();

  await ApplicationInitialize().make();

  runApp(ProductLocalization(child: const StateInitialize(child: _MyApp())));
}

/// [MyHttpOverrides] is a class that overrides the default behavior of the [HttpClient] class.
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final client = super.createHttpClient(context);

    /// [badCertificateCallback] is a callback function that is called when a certificate is not valid.
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  }
}

// Ana uygulama sınıfı
final class _MyApp extends StatelessWidget {
  const _MyApp();

  static final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    context.watch<ProductViewModel>();
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      builder: CustomResponsive.build,
      theme: CustomLightTheme().themeData,
      darkTheme: CustomDarkTheme().themeData,
      themeMode: context.watch<ProductViewModel>().state.themeMode,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
