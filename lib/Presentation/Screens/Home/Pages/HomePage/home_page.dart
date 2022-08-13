import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:khabar/Presentation/Screens/Home/Pages/HomePage/latest_page.dart';
import 'package:khabar/Presentation/Screens/Home/Pages/HomePage/notification_page.dart';
import 'package:khabar/Presentation/Screens/Home/Pages/HomePage/search_page.dart';
import 'package:khabar/Presentation/Screens/Home/Pages/HomePage/trending_page.dart';
import 'package:khabar/Presentation/Theme/app_navigator.dart';
import 'package:khabar/Presentation/Theme/size_extension.dart';

import '../../../../Theme/app_colors.dart';
import '../../../Auth/Widgets/auth_text_field.dart';
import 'Widgets/custom_search_delegate.dart';
import 'Widgets/latest_section_widget.dart';
import 'Widgets/trending_section_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _searchController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          "assets/svg/logo.svg",
          height: 40,
          width: 80,
        ),
        actions: [
          IconButton(
            onPressed: () {
              push(
                context,
                const NotificationPage(),
              );
            },
            icon: SvgPicture.asset(
              "assets/svg/notification_outlined.svg",
              height: 50,
              width: 50,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              right: 8,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            InkWell(
                onTap: () {
                  push(
                    context,
                    const SearchPage(),
                  );
                },
                child: Container(
                  height: 50,
                  width: double.maxFinite,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.bodyText,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    "Search",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.bodyText,
                        ),
                  ),
                )),
            TrendingSection(
              onPressed: () {
                push(
                  context,
                  const TrendingPage(),
                );
              },
            ),
            const SizedBox(
              height: 8,
            ),
            LatestSection(
              onPressed: () {
                push(
                  context,
                  const LatestPage(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
