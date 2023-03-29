import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forecast/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class TexFormFieldBar extends StatelessWidget {
  final double? width;
  final TextInputType? inputType;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? hintText, svgIcon;
  final TextEditingController? controller;
  final bool? haveBorder, obsecureText, showPassIcon, showPrefix;
  final Function()? clickPassIcon;
  final Color? fillColor, borderColor;

  const TexFormFieldBar(
      {super.key,
      this.width,
      this.inputType,
      this.onChanged,
      this.validator,
      this.hintText,
      this.svgIcon,
      this.controller,
      this.haveBorder,
      this.obsecureText,
      this.showPassIcon,
      this.showPrefix,
      this.clickPassIcon,
      this.fillColor,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        controller: controller,
        cursorColor: PalleteColors.black,
        textAlign: TextAlign.left,
        autofocus: false,
        showCursor: true,
        keyboardType: inputType ?? TextInputType.text,
        obscureText: obsecureText ?? false,
        style: GoogleFonts.poppins(
          color: PalleteColors.black,
          fontWeight: FontWeight.w500,
          fontSize: 15.sp,
        ),
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 14,
          ),
          hintText: hintText ?? "",
          hintStyle: GoogleFonts.poppins(
            color: PalleteColors.black,
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
          ),
          filled: true,
          fillColor: fillColor ?? PalleteColors.whiteF7,
          prefixIcon: showPrefix == false
              ? null
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    svgIcon!,
                    width: 17.sp,
                  ),
                ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: haveBorder == true ? borderColor! : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: haveBorder == true ? borderColor! : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: haveBorder == true ? borderColor! : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
