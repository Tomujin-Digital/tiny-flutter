import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pocket_tomyo/app/config/app_theme.dart';

import 'app/routes/app_pages.dart';
import 'app/services/local_storage.dart';
import 'app/utils/dependency.dart';
import 'generated/locales.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize the app services
  await initServices();
  runApp(
    GetMaterialApp(
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
  // await Hive.initFlutter();
}
