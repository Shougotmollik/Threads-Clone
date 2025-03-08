import 'package:get/get.dart';
import 'package:theadsclone/routes/route_names.dart';
import 'package:theadsclone/views/auth/login_screen.dart';
import 'package:theadsclone/views/auth/sign_up_screen.dart';
import 'package:theadsclone/views/main_nav_Screen/home_screen/home_screen.dart';
import 'package:theadsclone/views/main_nav_Screen/main_nav_bar_screen.dart';

class Routes {
  static final pages = [
    GetPage(
      name: RouteNames.homeScreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: RouteNames.loginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: RouteNames.signUpScreen,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: RouteNames.mainNavBarScreen,
      page: () => MainNavBarScreen(),
    ),
  ];
}
