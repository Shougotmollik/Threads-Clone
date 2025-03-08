import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:theadsclone/routes/route_names.dart';
import 'package:theadsclone/routes/routes.dart';
import 'package:theadsclone/services/storage_service.dart';
import 'package:theadsclone/theme/app_theme.dart';

class ThreadCloneApp extends StatelessWidget {
  const ThreadCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Threads Clone',
      theme: darkTheme,
      getPages: Routes.pages,
      initialRoute: StorageService.userSession != null
          ? RouteNames.mainNavBarScreen
          : RouteNames.loginScreen,
      defaultTransition: Transition.noTransition,
    );
  }
}
