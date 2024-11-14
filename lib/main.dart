import 'dart:io';

import 'package:architecture_template/product/init/application_initialaze.dart';
import 'package:architecture_template/product/init/product_localization.dart';
import 'package:architecture_template/product/init/theme/custom_dark_theme.dart';
import 'package:architecture_template/product/init/theme/custom_light_theme.dart';
import 'package:architecture_template/product/navigation/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

void main() async {
  // Tüm HTTP istekleri için SSL doğrulamasını devre dışı bırakmak amacıyla MyHttpOverrides'ı kullanıyoruz.
  HttpOverrides.global = MyHttpOverrides();

  // Uygulamanın temel ayarlarını başlatıyoruz.
  await ApplicationInitialize().make();

  // Uygulamayı başlatıyoruz.
  runApp(ProductLocalization(child: const _MyApp()));
}

// SSL doğrulama hatalarını bypass etmek için HttpOverrides sınıfı
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final client = super.createHttpClient(context);
    client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    return client;
  }
}

// Ana uygulama sınıfı
final class _MyApp extends StatelessWidget {
  const _MyApp({super.key});
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
