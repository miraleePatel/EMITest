import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../Utils/app_colors.dart';
import '../Widgets/custom_widget.dart';

class EMIDetailsScreen extends StatefulWidget {
  const EMIDetailsScreen({super.key});

  @override
  State<EMIDetailsScreen> createState() => _EMIDetailsScreenState();
}

class _EMIDetailsScreenState extends State<EMIDetailsScreen> {

  double monthlyEMI = Get.arguments[0];
  double totalPayment = Get.arguments[1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: CustomWidgets.text(
            "EMI Details", color: AppColors.titleTextColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400),
        automaticallyImplyLeading: true,
        centerTitle: true,
        elevation: 1,
      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [
            SizedBox(height: 3.h,),
            CustomWidgets.text("Monthly EMI...........${num.parse(monthlyEMI.toStringAsFixed(2)).toString()}"),
            SizedBox(height: 3.h,),
            CustomWidgets.text("Total Payment........${num.parse(totalPayment.toStringAsFixed(2)).toString()}"),
          ],
        ),
      ),
    );
  }
}
