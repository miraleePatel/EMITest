import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../Utils/app_colors.dart';
import 'custom_widget.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final double? height;
  final double? width;
  final String? text;

  const CustomButton({super.key,this.onTap,this.height,this.width,this.text});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 5.5.h,
        width:width ?? double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
color: AppColors.blueColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: CustomWidgets.text(text!.toUpperCase(),color: AppColors.whiteColor,fontWeight: FontWeight.w300,letterSpacing: 2),
      ),
    );
  }
}


class CustomBorderButton extends StatelessWidget {
  final Function()? onTap;
  final double? height;
  final double? width;
  final String? text;
  const CustomBorderButton({super.key,this.onTap,this.height,this.width,this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height:height?? 5.h,
        width:width?? double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.blueColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: CustomWidgets.text(text!.toUpperCase(),
            color: AppColors.blueColor,
            fontWeight: FontWeight.w300,letterSpacing: 2),
      ),
    );
  }
}
