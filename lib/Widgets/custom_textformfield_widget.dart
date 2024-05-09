import 'package:emi_app/Widgets/custom_widget.dart';
import 'package:emi_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../Utils/app_colors.dart';

class CustomTextFormfieldWidget extends StatelessWidget {
  final String? imageName;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? suffixtext1;
  final String? suffixtext2;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final double? scale;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final bool? readOnly;
  final bool? obscureText;
  final void Function(String)? onChanged;

  const CustomTextFormfieldWidget(
      {super.key,
      this.imageName,
      this.controller,
      this.validator,
      this.suffixtext1,
      this.suffixtext2,
      this.width,
      this.padding,
      this.scale,
      this.keyboardType,
      this.onTap,
      this.readOnly,
      this.onChanged,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.blackColor,
      cursorHeight: 3.h,
      keyboardType: keyboardType,
      validator: validator,
      onTap: onTap,
      onChanged: onChanged,
      textAlign: TextAlign.start,

      scrollPhysics: NeverScrollableScrollPhysics(),
      style: GoogleFonts.poppins(
          color: AppColors.blackColor,
          fontSize: 10.sp,
          fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        isDense: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        fillColor: AppColors.menuBgColor,
        filled: true,
        suffixIcon: Container(
          width:suffixtext2 != ""? 35.w: 20.w,
          alignment: Alignment.topRight,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                suffixtext2 != ""? Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CustomWidgets.text(suffixtext1!,color: AppColors
                      .unSelectedTextColor),
                ):Container(),
                VerticalDivider(
                  endIndent: 8,
                  indent: 8,
                  color: AppColors.dividerColor,
                  width: 3.w,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child:suffixtext2 != null && suffixtext2  != "" ? CustomWidgets.text(suffixtext2!,color: AppColors.blueColor): Image.asset(
                    imageName!,
                    scale: 2,
                  ),
                ),
                SizedBox(
                  width: 3.w,
                )
              ],
            ),
          ),
        ),
        contentPadding: EdgeInsets.only(top: 1.5.h, bottom: 1.5.h, left: 10),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
