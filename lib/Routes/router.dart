// ignore_for_file: constant_identifier_Names, prefer_const_constructors


import 'package:emi_app/Routes/routes.dart';
import 'package:emi_app/Screens/emi_calculate_screen.dart';
import 'package:emi_app/Screens/emi_details_screen.dart';
import 'package:get/get.dart';
import '../Screens/splash_screen.dart';


class AppPages {
  static const INITIAL_ROUTE = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: Routes.SPLASH_SCREEN,
      page: () => const SplashScreen(),
    ),
 GetPage(
      name: Routes.EMI_CALCULATE_SCREEN,
      page: () => const EMICalculateScreen(),
    ),GetPage(
      name: Routes.EMI_DETAILS_SCREEN,
      page: () => const EMIDetailsScreen(),
    ),

  ];
}
