// Flutter imports:
import 'dart:async';
import 'dart:developer';

import 'package:app_links/app_links.dart';
// Package imports:

import 'package:flutter/foundation.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// Project imports:

import 'package:quiz_app/router/router.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // LocaleSettings.useDeviceLocale();

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  final appLinks = AppLinks();
  appLinks.allUriLinkStream.listen((uri) {
    log(uri.toString(), name: 'AppLinks');
  });

  runApp(
    const ProviderScope(
      child: MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    FlutterNativeSplash.remove();

    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Nanco',
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            FormBuilderLocalizations.delegate,
          ],
          themeMode: ThemeMode.light,
          // theme: NancoTheme.light(),
          // locale: TranslationProvider.of(context).flutterLocale,
          // supportedLocales: AppLocaleUtils.supportedLocales,
          routerConfig: router,
          // builder: (context, child) {
          //   return UpgradeAlert(
          //     upgrader: Upgrader(
          //       languageCode: 'ja',
          //       countryCode: 'ja',
          //       showLater: false,
          //       showIgnore: false,
          //       showReleaseNotes: false,
          //       shouldPopScope: () => false,
          //       // debugLogging: true,
          //       appcastConfig:
          //           AppcastConfiguration(supportedOS: ['ios', 'android'], url: 'https://staging.nanco.io/appcast.xml'),
          //     ),
          //     navigatorKey: router.routerDelegate.navigatorKey,
          //     child: child,
          //   );
          // },
        );
      },
    );
  }
}
