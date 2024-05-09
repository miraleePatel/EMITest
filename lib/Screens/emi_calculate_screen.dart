

import 'dart:math';

import 'package:emi_app/Utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../Controller/emi_calculate_controller.dart';
import '../Routes/routes.dart';
import '../Utils/constants.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/custom_textformfield_widget.dart';
import '../Widgets/custom_widget.dart';
import '../generated/assets.dart';

class EMICalculateScreen extends StatefulWidget {
  const EMICalculateScreen({super.key});

  @override
  State<EMICalculateScreen> createState() => _EMICalculateScreenState();
}

class _EMICalculateScreenState extends State<EMICalculateScreen> {
  EMICalculateController eMICalculateController = Get.put(
      EMICalculateController());
  double loanValue = 0;
  double interestValue = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,

          title: CustomWidgets.text(
              "EMI Calculator", color: AppColors.titleTextColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400),
          centerTitle: true,
          elevation: 1,
        ),

        /// bottom button
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [



              /// RESET btn
              CustomBorderButton(
                width: 43.w,
                height: 5.5.h,
                onTap: () {
                  eMICalculateController.loanController.clear();
                  eMICalculateController.intrestController.clear();
                  eMICalculateController.periodController.clear();
                  setState(() {
                    loanValue = 0;
                    interestValue = 5;
                  });


                },
                text: "RESET",
              ),

              /// Calculate btn
              CustomButton(
                onTap: () {
                  if(eMICalculateController.loanController.text.isEmpty){
                    errorSnackBar(message: "Please Enter Loan Amount");
                  }
                  else if( eMICalculateController.intrestController.text.isEmpty){
                    errorSnackBar(message: "Please Enter Interest Rate");

                  }
                  else if(eMICalculateController.periodController.text.isEmpty){
                    errorSnackBar(message: "Please Enter Month Period");
                  }

                  else{
                    int n = int.parse(eMICalculateController.periodController.text) * 12;
                    double r = (double.parse(eMICalculateController.intrestController.text) / 100) / 12;
                    eMICalculateController.monthlyEMI = (double.parse(eMICalculateController.loanController.text) * r * pow(1 + r, n)) / (pow(1 + r, n) - 1);
                    eMICalculateController.totalPayment = eMICalculateController.monthlyEMI * n;

                    print("...........Monthly EMI:.........${eMICalculateController.monthlyEMI}");
                    print("...........Total Payment:..............${eMICalculateController.totalPayment}");

                    Get.toNamed(Routes.EMI_DETAILS_SCREEN,arguments: [eMICalculateController.monthlyEMI.toDouble(),
                      eMICalculateController.totalPayment.toDouble()]);
                  }
                },
                height: 5.5.h,
            width: 43.w,
                text: "Calculate",
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Form(
            key: eMICalculateController.formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2.h,),
              
                  /// Menu Button List
                  Container(
                    height: 5.h,
                    width: double.infinity,
                    color: AppColors.menuBgColor,
                    alignment: Alignment.center,
                    child: ListView.separated(
                      itemCount: eMICalculateController.titleList.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Obx(() {
                          return GestureDetector(
                            onTap: () {
                              eMICalculateController.currentIndex.value = index;
                            },
                            child: Container(
                              // margin: EdgeInsets.all(10),
                              width: 20.w,
                              // padding: EdgeInsets.only(left: 20,right: 20),
                              alignment: Alignment.center,
                              child:
                              CustomWidgets.text(
                                  eMICalculateController.titleList[index].title
                                      .toString(), fontWeight: FontWeight.w400,
                                  color: eMICalculateController.currentIndex
                                      .value == index ?
                                  AppColors.blackColor : AppColors
                                      .unSelectedTextColor
                              ),
                            ),
                          );
                        });
                      },
                      separatorBuilder: (context, index) {
                        return VerticalDivider(
                          color: AppColors.dividerColor,
                          width: 2.w,
                        );
                      },
              
                    ),
                  ),
              
                  /// Loan
                  SizedBox(height: 2.h,),
                  CustomWidgets.text("Loan Amount", color: AppColors
                      .unSelectedTextColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 11.sp),
                  SizedBox(height: 1.h,),
                  Container(
                    height:10.h,
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                     fit: StackFit.loose,
                      children: [
                        Container(
                          height: 5.5.h,
                          width: double.infinity,
                          child: CustomTextFormfieldWidget(
                            controller: eMICalculateController.loanController,
                            imageName: Assets.assetsRs,
                            keyboardType: TextInputType.number,
                            suffixtext1: "",
                            suffixtext2: "",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: SfSlider(
                            min: 0.0,
                            max: 200.0,
                            // value: eMICalculateController.loanValue.value,
                            value: loanValue,
                            interval: 25,
                            showDividers: false,
                            showTicks: true,
                            showLabels: true,
                            activeColor: AppColors.sliderFillColor,
                            inactiveColor: AppColors.sliderColor,
                            onChanged: (dynamic value) {
                              setState(() {
                                loanValue = value;

                                var n = value.roundToDouble() * 100000;
                                eMICalculateController.loanController.text = n.toString();
                              });
                            },
                          ),
                        ),

                      ],
                    ),
                  ),


                  /// Interest
                  ///

                  /// Loan
                  SizedBox(height: 2.h,),
                  CustomWidgets.text("Interest Rate", color: AppColors
                      .unSelectedTextColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 11.sp),
                  SizedBox(height: 1.h,),
                  Container(
                    height:10.h,
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      fit: StackFit.loose,
                      children: [
                        Container(
                          height: 5.5.h,
                          width: double.infinity,
                          child: CustomTextFormfieldWidget(
                            controller: eMICalculateController.intrestController,
                            imageName: Assets.assetsInterest,
                            keyboardType: TextInputType.number,
                            suffixtext1: "",
                            suffixtext2: "",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: SfSlider(
                            min: 5.0,
                            max: 20.0,
                            // value: eMICalculateController.loanValue.value,
                            value: interestValue,
                            interval: 2.5,
                            showDividers: false,
                            showTicks: true,
                            showLabels: true,
                            activeColor: AppColors.sliderFillColor,
                            inactiveColor: AppColors.sliderColor,
                            onChanged: (dynamic value) {
                              setState(() {
                                interestValue = value;
                                var n = num.parse(value.toStringAsFixed(2));
                                eMICalculateController.intrestController.text = n.toString();
                              });
                            },
                          ),
                        ),

                      ],
                    ),
                  ),

                  ///
                  SizedBox(height: 2.h,),
                  CustomWidgets.text("Period", color: AppColors
                      .unSelectedTextColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 11.sp),
                  SizedBox(height: 1.h,),
                  Container(
                    height: 5.5.h,
                    width: double.infinity,
                    child: CustomTextFormfieldWidget(
                      controller: eMICalculateController.periodController,
                      imageName: Assets.assetsInterest,
                      keyboardType: TextInputType.number,
                      suffixtext1: "Year",
                      suffixtext2: "Month",
                    ),
                  ),


                  /// Note
                  SizedBox(height: 2.h,),
                  RichText(
                    text: new TextSpan(
                      text: 'Note : ',
                      style:GoogleFonts.poppins(fontWeight: FontWeight.w500,color: AppColors.blackColor,fontSize: 12.sp,),
                      children: <TextSpan>[
                        new TextSpan(
                            text: ' Based on your input, Loan Calculator will calculate final loan amount & principal amount.',
                            style: GoogleFonts.poppins(color: AppColors.unSelectedTextColor,fontSize: 10.sp)),

                      ],
                    ),
                  ),
                  
                  /// ads Banner
                  SizedBox(height: 3.h,),
                  Container(
                    height: 13.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.unSelectedTextColor)
                        
                    ),
                    alignment: Alignment.center,
                    child: CustomWidgets.text("Ads Banner",color: AppColors.unSelectedTextColor,fontSize: 15.sp),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
