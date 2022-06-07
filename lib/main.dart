import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pocket_tomyo/app/config/app_theme.dart';

import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      translations: AppTranslation(),
      locale: const Locale('eng'),
      theme: AppTheme.lightTheme,
    ),
  );
}
