import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_bloc/common/ui/app_colors.dart';

class AppTextStyles {
  static final _text = TextStyle(
    fontStyle: FontStyle.normal,
    color: AppColors.textPrimary,
    fontSize: 14.sp,
  );

  static TextStyle light = _text.copyWith(
    fontWeight: FontWeight.w300,
  );

  static TextStyle regular = _text.copyWith(
    fontWeight: FontWeight.normal,
  );

  static TextStyle medium = _text.copyWith(
    fontWeight: FontWeight.w500,
  );

  static TextStyle bold = _text.copyWith(
    fontWeight: FontWeight.bold,
  );
}
