import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:khabar/Presentation/Screens/Auth/recover_via_email_screen.dart';
import 'package:khabar/Presentation/Screens/Auth/recover_via_otp_screen.dart';
import 'package:khabar/Presentation/Theme/app_colors.dart';
import 'package:khabar/Presentation/Theme/size_extension.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool emailSelected = true;
  bool smsSelected = false;

  String selectedValue = "Email";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Forgot\nPassword",
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: AppColors.bodyText,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              "Don’t worry! it happens. Please select the email or number associated with your account.",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.bodyText,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            ListTile(
              onTap: () {
                selectedValue = "Email";
                setState(() {});
              },
              selected: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 18,
              ),
              selectedTileColor: AppColors.secondaryButton,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              minLeadingWidth: 80,
              leading: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: const EdgeInsets.all(15),
                child: SvgPicture.asset(
                  "assets/svg/mail_outlined.svg",
                  color: Colors.white,
                ),
              ),
              title: Text(
                "via Email:",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.buttonText,
                    ),
              ),
              subtitle: Text(
                "example@youremail.com",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.activeTitle,
                    ),
              ),
              trailing: Radio<String>(
                value: selectedValue,
                groupValue: "Email",
                onChanged: (s) {
                  selectedValue = "Email";
                  setState(() {});
                },
                fillColor: MaterialStateProperty.all(AppColors.primary),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ListTile(
              onTap: () {
                selectedValue = "SMS";
                setState(() {});
              },
              selected: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 18,
              ),
              selectedTileColor: AppColors.secondaryButton,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              minLeadingWidth: 80,
              leading: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: const EdgeInsets.all(15),
                child: SvgPicture.asset(
                  "assets/svg/message_outlined.svg",
                  color: Colors.white,
                ),
              ),
              title: Text(
                "via SMS:",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.buttonText,
                    ),
              ),
              subtitle: Text(
                "+91-987-654-3210",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.activeTitle,
                    ),
              ),
              trailing: Radio<String>(
                value: selectedValue,
                groupValue: "SMS",
                onChanged: (s) {
                  selectedValue = "SMS";
                  setState(() {});
                },
                fillColor: MaterialStateProperty.all(AppColors.primary),
                toggleable: true,
                overlayColor: MaterialStateProperty.all(
                  AppColors.bodyText,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(),
        height: 50,
        width: double.maxFinite,
        margin: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16,
        ),
        child: ElevatedButton(
          onPressed: () {
            if (selectedValue == "Email") {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (_) => const RecoverPassViaEmailScreen(),
                ),
              );
            } else {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (_) => const RecoverAccountViaOTP(),
                ),
              );
            }
          },
          child: Text(
            "Submit",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
