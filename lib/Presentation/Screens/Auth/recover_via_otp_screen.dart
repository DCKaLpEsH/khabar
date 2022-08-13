import 'package:flutter/material.dart';
import 'package:khabar/Presentation/Screens/Auth/Widgets/auth_text_field.dart';
import 'package:khabar/Presentation/Theme/size_extension.dart';

import '../../Theme/app_colors.dart';

class RecoverAccountViaOTP extends StatefulWidget {
  const RecoverAccountViaOTP({Key? key}) : super(key: key);

  @override
  State<RecoverAccountViaOTP> createState() => _RecoverAccountViaOTPState();
}

class _RecoverAccountViaOTPState extends State<RecoverAccountViaOTP> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

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
              "Don’t worry! it happens. Please enter the address associated with your account.",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.bodyText,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: AuthenticationTextField(
                    controller: _controller,
                    validator: (s) {
                      return null;
                    },
                    label: "",
                    suffix: const SizedBox.shrink(),
                  ),
                ),
                SizedBox(
                  width: 60,
                  height: 60,
                  child: AuthenticationTextField(
                    controller: _controller,
                    validator: (s) {
                      return null;
                    },
                    label: "",
                    suffix: const SizedBox.shrink(),
                  ),
                ),
                SizedBox(
                  width: 60,
                  height: 60,
                  child: AuthenticationTextField(
                    controller: _controller,
                    validator: (s) {
                      return null;
                    },
                    label: "",
                    suffix: const SizedBox.shrink(),
                  ),
                ),
                SizedBox(
                  width: 60,
                  height: 60,
                  child: AuthenticationTextField(
                    controller: _controller,
                    validator: (s) {
                      return null;
                    },
                    label: "",
                    suffix: const SizedBox.shrink(),
                  ),
                ),
                SizedBox(
                  width: 60,
                  height: 60,
                  child: AuthenticationTextField(
                    controller: _controller,
                    validator: (s) {
                      return null;
                    },
                    label: "",
                    suffix: const SizedBox.shrink(),
                  ),
                ),
              ],
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
            child: Text(
              "Submit",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
            onPressed: () {}),
      ),
    );
  }
}
