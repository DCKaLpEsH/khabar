// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:khabar/Presentation/Theme/app_colors.dart';
import 'package:khabar/Presentation/Theme/size_extension.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NotificationCreatedWidget(
              time: "Today, August 7",
            ),
            ...List.generate(
              3,
              (index) => NotificationCardWidget(
                subtitle:
                    "has posted new europe news “Ukraine's President Zele",
                title: "BBC News ",
                imagePath: "assets/png/bbc news.png",
                caption: "14m ago",
                isUser: (index + 1) % 3 == 0 ? true : false,
              ),
            ),
            const NotificationCreatedWidget(
              time: "Yesterday, August 6",
            ),
            ...List.generate(
              6,
              (index) => NotificationCardWidget(
                subtitle:
                    "has posted new europe news “Ukraine's President Zele",
                title: "BBC News ",
                imagePath: "assets/png/bbc news.png",
                caption: "14m ago",
                isUser: (index + 1) % 3 == 0 ? true : false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationCreatedWidget extends StatelessWidget {
  const NotificationCreatedWidget({
    Key? key,
    required this.time,
  }) : super(key: key);
  final String time;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        time,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}

class NotificationCardWidget extends StatelessWidget {
  const NotificationCardWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.caption,
    required this.imagePath,
    this.isUser,
  }) : super(key: key);
  final String title;
  final String subtitle;
  final String caption;
  final String imagePath;
  final bool? isUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFEEF1F4),
          borderRadius: BorderRadius.circular(6),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 14,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  imagePath,
                ),
                radius: 30,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: title,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        TextSpan(
                          text: subtitle,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    caption,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: AppColors.bodyText,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            if (isUser != null && isUser!) ...[
              OutlinedButton.icon(
                icon: const Icon(
                  Icons.add,
                  color: AppColors.primary,
                ),
                label: Text(
                  "Follow",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.primary),
                ),
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xFFEEF1F4),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(
                        color: AppColors.primary,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
// / ListTile(
              // leading: const CircleAvatar(
              //   backgroundImage: AssetImage(
              //     "assets/png/bbc news.png",
              //   ),
              // ),
              // title: Text(
              //   "BBC News",
              //   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              //         fontWeight: FontWeight.bold,
              //       ),
              // ),
              // subtitle: Text(
              //   "has posted new europe news “Ukraine's President Zele",
              //   style: Theme.of(context).textTheme.bodyMedium,
              // ),
//               isThreeLine: true,
              
//             ),