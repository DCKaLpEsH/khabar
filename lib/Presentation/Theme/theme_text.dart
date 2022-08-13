import 'package:flutter/material.dart';
import 'package:khabar/Presentation/Theme/size_extension.dart';

class ThemeText {
  const ThemeText._();

  static getLightTextTheme() => TextTheme(
        displayLarge: _displayLarge,
        displayMedium: _displayMedium,
        displaySmall: _displaySmall,
        bodyLarge: _bodyLarge,
        bodyMedium: _bodyMedium,
        bodySmall: _bodySmall,
        titleSmall: _bodyXSmall,
      );
  static getDarkTextTheme() => TextTheme(
        displayLarge: _displayLargeDark,
        displayMedium: _displayMediumDark,
        displaySmall: _displaySmallDark,
        bodyLarge: _bodyLargeDark,
        bodyMedium: _bodyMediumDark,
        bodySmall: _bodySmallDark,
        titleSmall: _bodyXSmallDark,
      );

  static TextStyle? get _displayLarge => TextStyle(
        fontFamily: "Poppins",
        fontSize: 48.sp,
        color: Colors.black,
      );

  static TextStyle? get _displayMedium => TextStyle(
        fontSize: 42.sp,
        color: Colors.black,
      );

  static TextStyle? get _displaySmall => TextStyle(
        fontSize: 24.sp,
        color: Colors.black,
      );
  //
  static TextStyle? get textL => TextStyle(
        fontSize: 24.sp,
        color: Colors.black,
      );
  //
  static TextStyle? get _bodyLarge => TextStyle(
        color: Colors.black,
        fontSize: 20.sp,
      );
  //
  static TextStyle? get _bodyMedium => TextStyle(
        color: Colors.black,
        fontSize: 16.sp,
      );
  //
  static TextStyle? get _bodySmall => TextStyle(
        color: Colors.black,
        fontSize: 14.sp,
      );
  //
  static TextStyle? get _bodyXSmall => TextStyle(
        color: Colors.black,
        fontSize: 13.sp,
      );

  //! Dark Text Theme
  static TextStyle? get _displayLargeDark => TextStyle(
        fontSize: 48.sp,
        color: Colors.white,
      );

  static TextStyle? get _displayMediumDark => TextStyle(
        fontSize: 42.sp,
        color: Colors.white,
      );

  static TextStyle? get _displaySmallDark => TextStyle(
        fontSize: 24.sp,
        color: Colors.white,
      );
  //
  static TextStyle? get textLDark => TextStyle(
        fontSize: 24.sp,
        color: Colors.white,
      );
  //
  static TextStyle? get _bodyLargeDark => TextStyle(
        color: Colors.white,
        fontSize: 20.sp,
      );
  //
  static TextStyle? get _bodyMediumDark => TextStyle(
        color: Colors.white,
        fontSize: 16.sp,
      );
  //
  static TextStyle? get _bodySmallDark => TextStyle(
        color: Colors.white,
        fontSize: 14.sp,
      );
  //
  static TextStyle? get _bodyXSmallDark => TextStyle(
        color: Colors.white,
        fontSize: 13.sp,
      );
  // static TextStyle? get => _poppinsTextTheme.
  // static TextStyle? get => _poppinsTextTheme.
  // static TextStyle? get => _poppinsTextTheme.
}
