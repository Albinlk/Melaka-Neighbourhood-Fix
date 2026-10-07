import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle get headlineLarge => GoogleFonts.publicSans(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        height: 36 / 28,
        color: AppColors.onSurface,
      );

  static TextStyle get headlineMedium => GoogleFonts.publicSans(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        height: 28 / 22,
        color: AppColors.onSurface,
      );

  static TextStyle get titleLarge => GoogleFonts.publicSans(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 24 / 18,
        color: AppColors.onSurface,
      );

  static TextStyle get bodyLarge => GoogleFonts.publicSans(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        height: 26 / 17,
        color: AppColors.onSurface,
      );

  static TextStyle get bodyMedium => GoogleFonts.publicSans(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        height: 22 / 15,
        color: AppColors.onSurface,
      );

  static TextStyle get labelLarge => GoogleFonts.publicSans(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 20 / 14,
        letterSpacing: 0.1,
        color: AppColors.onSurface,
      );

  static TextStyle get labelSmall => GoogleFonts.publicSans(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 16 / 12,
        color: AppColors.onSurface,
      );
}
