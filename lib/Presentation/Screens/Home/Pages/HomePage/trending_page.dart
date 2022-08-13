import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:khabar/Presentation/Theme/size_extension.dart';

import '../../../../Theme/app_colors.dart';

class TrendingPage extends StatelessWidget {
  const TrendingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trending",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            ListView.builder(
              itemCount: 10,
              physics: const NeverScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
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
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: AppColors.bodyText,
                                ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
