import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:khabar/Presentation/Screens/Auth/login_screen.dart';
import 'package:khabar/Presentation/Theme/app_colors.dart';
import 'package:khabar/Presentation/Theme/size_extension.dart';

import '../../../BLoC/Authentication/Signup/signup_bloc.dart';
import 'Widgets/auth_text_field.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(),
      child: const SignupScreen(),
    );
  }
}

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  Color pwdColor = Colors.white;
  Color usernameColor = Colors.white;
  bool obscure = true;
  bool checkboxSelected = false;
  final _signupFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello!",
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Form(
              key: _signupFormKey,
              child: Column(
                children: [
                  AuthenticationTextField(
                    controller: _usernameController,
                    fillColor: usernameColor,
                    suffix: IconButton(
                      color: AppColors.bodyText,
                      onPressed: () {
                        _usernameController.clear();
                      },
                      icon: const Icon(
                        Icons.close,
                      ),
                    ),
                    label: "Username",
                    validator: (value) {
                      if (value!.length > 5) {
                        usernameColor = Colors.white;
                        setState(() {});
                        return null;
                      }
                      usernameColor = AppColors.errorLight;
                      setState(() {});
                      return "Enter a valid Username";
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  AuthenticationTextField(
                    controller: _passwordController,
                    obscureText: obscure,
                    fillColor: pwdColor,
                    suffix: IconButton(
                      color: AppColors.bodyText,
                      onPressed: () {
                        obscure = !obscure;
                        setState(() {});
                      },
                      icon: SvgPicture.asset(
                        obscure
                            ? "assets/svg/eye_closed.svg"
                            : "assets/svg/eye_open.svg",
                      ),
                    ),
                    label: "Password",
                    validator: (value) {
                      if (value!.length > 5) {
                        pwdColor = AppColors.lightBackground;
                        setState(() {});
                        return null;
                      }
                      pwdColor = AppColors.errorLight;
                      setState(() {});
                      return "Enter a valid Password";
                    },
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: checkboxSelected,
                  onChanged: (val) {
                    checkboxSelected = !checkboxSelected;
                    setState(() {});
                  },
                  checkColor: Colors.white,
                ),
                Text(
                  "Remember Me",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.bodyText,
                      ),
                ),
                const Spacer(),
              ],
            ),
            SizedBox(
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (_signupFormKey.currentState!.validate()) {
                    context.read<SignupBloc>().add(
                          SignupWithEmailEvent(
                            email: _usernameController.text,
                            password: _passwordController.text,
                          ),
                        );
                  }
                },
                child: Text(
                  "Sign Up",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                        fontSize: 17.sp,
                      ),
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Center(
              child: Text(
                "or continue with",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.bodyText,
                    ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/svg/facebook.svg",
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          "Facebook",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppColors.bodyText,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.button,
                      fixedSize: const Size(200, 45),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/svg/google.svg",
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          "Google",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppColors.bodyText,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.button,
                      fixedSize: const Size(200, 45),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Already have an account? ",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.bodyText,
                          ),
                    ),
                    TextSpan(
                        text: " Log In",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (_) => const LoginScreen(),
                              ),
                            );
                          }),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
          ],
        ),
      ),
    );
  }
}
