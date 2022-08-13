import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:khabar/Presentation/Screens/Selection/select_country.dart';
import 'package:khabar/Presentation/Theme/app_colors.dart';
import 'package:khabar/Presentation/Theme/size_extension.dart';

class AuthSuccessWidget extends StatelessWidget {
  const AuthSuccessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
          builder: (context) => const SelectCountryScreen(),
        ),
      );
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/svg/logo.svg",
            ),
            SizedBox(
              height: 25.h,
            ),
            Text(
              "Congratulations!",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.bodyText,
                  ),
            ),
            Text(
              "Your account is ready to use",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
