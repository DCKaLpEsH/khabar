import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khabar/Presentation/Screens/Auth/login_screen.dart';
import 'package:khabar/Presentation/Theme/app_colors.dart';
import 'package:khabar/Presentation/Theme/size_extension.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: PageView.builder(
              controller: _controller,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Expanded(
                      flex: 8,
                      child: Image.asset(
                        "assets/png/onboarding_${index + 1}.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Lorem Ipsum is simply dummy",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  SmoothPageIndicator(
                    effect: const WormEffect(
                      dotColor: AppColors.placeholder,
                      activeDotColor: AppColors.primary,
                    ),
                    count: 3,
                    controller: _controller,
                    onDotClicked: (dot) {},
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 50,
                    width: 85,
                    child: TextButton(
                      onPressed: () {
                        if (_controller.page != 0) {
                          _controller.animateToPage(
                            (_controller.page! - 1).toInt(),
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      child: Text(
                        "Back",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.darkBody,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  SizedBox(
                    height: 50,
                    width: 85,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_controller.page == 2) {
                          Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                              builder: (_) => const LoginScreen(),
                            ),
                          );
                        } else {
                          _controller.animateToPage(
                            (_controller.page! + 1).toInt(),
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.decelerate,
                          );
                        }
                      },
                      child: Text(
                        "Next",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
