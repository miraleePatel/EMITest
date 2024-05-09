

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';


import '../../Routes/routes.dart';
import '../Utils/app_colors.dart';
import '../Widgets/custom_widget.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    navigatToRoute();
    super.initState();
  }

  ///
  /// navigate according login users
  ///
  navigatToRoute() async {

    Future.delayed(
      const Duration(seconds: 5),
    ).then((value) async {
      Get.offAllNamed(Routes.EMI_CALCULATE_SCREEN);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: CustomWidgets.text(
            "EMI Calculator", color: AppColors.blueColor,
            fontSize: 17.sp,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
