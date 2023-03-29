import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forecast/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class TextNorm extends StatelessWidget {
  final String? label;
  final TextAlign? align;
  final TextOverflow? overflow;
  final bool? medium, semiBold, bold, lowerH;
  final double? fontSize;
  final Color? fontColor;

  const TextNorm(
      {super.key,
      this.label,
      this.align,
      this.overflow,
      this.medium,
      this.semiBold,
      this.bold,
      this.lowerH,
      this.fontSize,
      this.fontColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      label ?? "",
      maxLines: 100,
      textAlign: align ?? TextAlign.center,
      overflow: overflow ?? TextOverflow.ellipsis,
      style: GoogleFonts.poppins(
        height: lowerH == false || lowerH == null ? null : 1.0,
        color: fontColor ?? PalleteColors.black,
        fontWeight: bold == true
            ? FontWeight.w700
            : medium == true
                ? FontWeight.w500
                : semiBold == true
                    ? FontWeight.w600
                    : FontWeight.w400,
        fontSize: fontSize ?? 15.sp,
      ),
    );
  }
}
