import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';


class CustomWidgets {
  static Text text(
      String content, {
        Color? color,
        double? fontSize = 12,
        FontWeight? fontWeight = FontWeight.normal,
        int? maxLine,
        double? letterSpacing = 0.0,
        TextAlign? textAlign,
        double? height = 1.7,
        TextOverflow? overflow,
        double? textScaleFactor
      }) {
    return Text(content,
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow,
        textScaleFactor: textScaleFactor,
        style: GoogleFonts.poppins(
          letterSpacing: letterSpacing,
          color: color,
          fontSize: fontSize!.sp,
          fontWeight: fontWeight,
        ));
  }

/*
  static GestureDetector customBack(){
    return  GestureDetector(
        onTap: (){
          Get.back();
        },
        child: Image.asset(Assets.iconsIconBack,height: 5.h,));
  }*/

}