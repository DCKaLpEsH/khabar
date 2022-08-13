// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:khabar/Presentation/Theme/app_colors.dart';
import 'package:khabar/Presentation/Theme/size_extension.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.newsProvider,
    required this.ago,
    required this.newsProviderImagePath,
  }) : super(key: key);
  final String imagePath;
  final String title;
  final String subtitle;
  final String newsProvider;
  final String ago;
  final String newsProviderImagePath;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset(
          imagePath,
          fit: BoxFit.fill,
          height: 150,
          width: 100,
        ),
      ),
      minLeadingWidth: 100,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: AppColors.bodyText,
            ),
      ),
      subtitle: Column(
        children: [
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(newsProviderImagePath),
                radius: 20,
              ),
              SizedBox(
                width: 4.w,
              ),
              Text(
                newsProvider,
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
                "$ago ago",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppColors.bodyText,
                    ),
              )
            ],
          )
        ],
      ),
    );
  }
}
