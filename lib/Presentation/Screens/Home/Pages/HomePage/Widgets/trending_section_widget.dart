// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:khabar/Presentation/Screens/Selection/select_category.dart';
import 'package:khabar/Presentation/Theme/app_colors.dart';
import 'package:khabar/Presentation/Theme/size_extension.dart';
import 'package:khabar/Presentation/Widgets/app_list_tile.dart';

import 'section_widget.dart';

class TrendingSection extends StatelessWidget {
  const TrendingSection({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionWidget(
          title: "Trending",
          onPressed: onPressed,
          trailing: "See All",
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            "assets/png/News Images.png",
            height: 200,
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          "Europe",
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: AppColors.bodyText,
              ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          "Russian warship: Moskva sinks in Black Sea",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.black,
              ),
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage(
                "assets/png/bbc news.png",
              ),
              radius: 20,
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              "BBC News",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColors.bodyText,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
            ),
            SizedBox(
              width: 12.w,
            ),
            SvgPicture.asset(
              "assets/svg/time.svg",
              color: AppColors.bodyText,
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              "4h ago",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColors.bodyText,
                  ),
            )
          ],
        ),
      ],
    );
  }
}
