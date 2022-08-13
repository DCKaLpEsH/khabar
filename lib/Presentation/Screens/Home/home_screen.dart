import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:khabar/Presentation/Screens/Auth/Widgets/auth_text_field.dart';
import 'package:khabar/Presentation/Screens/Home/Pages/HomePage/home_page.dart';
import 'package:khabar/Presentation/Theme/app_colors.dart';
import 'package:khabar/Presentation/Theme/size_extension.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          HomePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.lightBackground,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedLabelStyle: const TextStyle(
          color: AppColors.primary,
        ),
        unselectedLabelStyle: const TextStyle(
          color: AppColors.bodyText,
        ),
        showUnselectedLabels: true,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.bodyText,
        selectedIconTheme: const IconThemeData(
          color: AppColors.primary,
        ),
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0
                ? SvgPicture.asset(
                    "assets/svg/home_filled.svg",
                    color: AppColors.primary,
                  )
                : SvgPicture.asset(
                    "assets/svg/home_outlined.svg",
                  ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1
                ? SvgPicture.asset(
                    "assets/svg/compass_filled.svg",
                    color: AppColors.primary,
                  )
                : SvgPicture.asset(
                    "assets/svg/compass_outlined.svg",
                  ),
            label: "HackerNews",
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2
                ? SvgPicture.asset(
                    "assets/svg/compass_filled.svg",
                    color: AppColors.primary,
                  )
                : SvgPicture.asset(
                    "assets/svg/compass_outlined.svg",
                  ),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 3
                ? SvgPicture.asset(
                    "assets/svg/bookmark_filled.svg",
                    color: AppColors.primary,
                  )
                : SvgPicture.asset(
                    "assets/svg/bookmark_outlined.svg",
                  ),
            label: "Bookmark",
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 4
                ? SvgPicture.asset(
                    "assets/svg/profile_filled.svg",
                    color: AppColors.primary,
                  )
                : SvgPicture.asset(
                    "assets/svg/profile_outlined.svg",
                  ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}



// Material 3 Bottom Nav Bar
// NavigationBar(
//           labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
//           selectedIndex: 0,
//           backgroundColor: AppColors.lightBackground,
//           destinations: [
//             Column(
//               children: [
//                 SvgPicture.asset(
//                   "assets/svg/home_outlined.svg",
//                   color: AppColors.bodyText,
//                 ),
//                 Text(
//                   "Home",
//                   style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                         color: AppColors.bodyText,
//                       ),
//                 ),
//               ],
//             ),
//             Column(
//               children: [
//                 SvgPicture.asset(
//                   "assets/svg/.svg",
//                   color: AppColors.bodyText,
//                 ),
//                 Text(
//                   "Hacker",
//                   style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                         color: AppColors.bodyText,
//                       ),
//                 ),
//               ],
//             ),
//             Column(
//               children: [
//                 SvgPicture.asset(
//                   "assets/svg/compass_outlined.svg",
//                   color: AppColors.bodyText,
//                 ),
//                 Text(
//                   "Explore",
//                   style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                         color: AppColors.bodyText,
//                       ),
//                 ),
//               ],
//             ),
//             Column(
//               children: [
//                 SvgPicture.asset(
//                   "assets/svg/bookmark_outlined.svg",
//                   color: AppColors.bodyText,
//                 ),
//                 Text(
//                   "Bookmark",
//                   style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                         color: AppColors.bodyText,
//                       ),
//                 ),
//               ],
//             ),
//             Column(
//               children: [
//                 SvgPicture.asset(
//                   "assets/svg/profile_outlined.svg",
//                   color: AppColors.bodyText,
//                 ),
//                 Text(
//                   "Profile",
//                   style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                         color: AppColors.bodyText,
//                       ),
//                 ),
//               ],
//             ),
//           ],
//         )
