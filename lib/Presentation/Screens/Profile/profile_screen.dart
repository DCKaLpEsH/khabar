import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khabar/Presentation/Screens/Auth/Widgets/auth_text_field.dart';
import 'package:khabar/Presentation/Screens/Home/home_screen.dart';
import 'package:khabar/Presentation/Screens/Selection/select_country.dart';
import 'package:khabar/Presentation/Theme/size_extension.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProfileView();
  }
}

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late TextEditingController userNameController;
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Fill your Profile",
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Center(
          child: Column(
            children: [
              const _Spacer(),
              const CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/png/author_image.png",
                ),
                radius: 70,
              ),
              const _Spacer(),
              AuthenticationTextField(
                controller: userNameController,
                validator: (s) {},
                label: "Username",
                suffix: const SizedBox.shrink(),
              ),
              const _Spacer(),
              AuthenticationTextField(
                controller: fullNameController,
                validator: (s) {},
                label: "Full Name",
                suffix: const SizedBox.shrink(),
              ),
              const _Spacer(),
              AuthenticationTextField(
                controller: emailController,
                validator: (s) {},
                label: "Email Address",
                suffix: const SizedBox.shrink(),
              ),
              const _Spacer(),
              AuthenticationTextField(
                controller: phoneController,
                validator: (s) {},
                label: "Phone Number",
                suffix: const SizedBox.shrink(),
              ),
              const _Spacer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBarButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            CupertinoPageRoute(
              builder: (context) => const HomeScreen(),
            ),
            ((route) => false),
          );
        },
        label: "Next",
      ),
    );
  }
}

class _Spacer extends StatelessWidget {
  const _Spacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 30,
    );
  }
}
