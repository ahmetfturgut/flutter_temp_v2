import 'package:architecture_template/feature/home/view/home_view.dart';
import 'package:architecture_template/product/init/application_initialaze.dart';
import 'package:architecture_template/product/init/product_localization.dart';
import 'package:architecture_template/product/init/theme/custom_dark_theme.dart';
import 'package:architecture_template/product/init/theme/custom_light_theme.dart';
import 'package:architecture_template/product/navigation/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await ApplicationInitialize().make();
  runApp(ProductLocalization(child: const _MyApp()));
}

final class _MyApp extends StatelessWidget {
  const _MyApp({super.key});
  static final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      theme: CustomLightTheme().themeData,
      darkTheme: CustomDarkTheme().themeData,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
