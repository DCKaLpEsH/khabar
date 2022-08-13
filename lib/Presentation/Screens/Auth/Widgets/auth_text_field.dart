// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:khabar/Presentation/Theme/app_colors.dart';

class AuthenticationTextField extends StatelessWidget {
  const AuthenticationTextField({
    Key? key,
    required this.controller,
    required this.validator,
    required this.label,
    required this.suffix,
    this.obscureText,
    this.fillColor,
    this.onSubmit,
  }) : super(key: key);

  final TextEditingController controller;
  final String? Function(String?) validator;
  final String label;
  final Widget suffix;
  final bool? obscureText;
  final Color? fillColor;
  final Function(String)? onSubmit;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      obscuringCharacter: "*",
      validator: validator,
      onFieldSubmitted: onSubmit,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.bodyText,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.errorDark,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.bodyText,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        filled: true,
        fillColor:
            fillColor ?? Theme.of(context).inputDecorationTheme.fillColor,
        label: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: label,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.bodyText,
                    ),
              ),
              TextSpan(
                text: label.isEmpty ? "" : " *",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.errorDark,
                    ),
              ),
            ],
          ),
        ),
        suffixIcon: suffix,
        suffixIconConstraints: const BoxConstraints.tightFor(
          height: 30,
          width: 30,
        ),
      ),
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
