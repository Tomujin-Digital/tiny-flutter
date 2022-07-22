import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/config/app_theme.dart';
import 'app/routes/app_pages.dart';
import 'app/services/local_storage.dart';
import 'app/utils/dependency.dart';
import 'app/utils/desktop_scroll_behavior.dart';
import 'firebase_options.dart';
import 'generated/locales.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid || Platform.isIOS) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  /// [@param]

  await initServices();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: DesktopScrollBehavior(),
      initialBinding: DependencyCreator(),
      title: "Tiny",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      translations: AppTranslation(),
      locale: const Locale('eng'),
      theme: AppTheme.lightTheme,
    ),
  );
}

initServices() async {
  await Get.putAsync<LocalStorageService>(() async => LocalStorageService());
}
