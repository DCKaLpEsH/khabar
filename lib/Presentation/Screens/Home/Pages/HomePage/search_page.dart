// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:khabar/Presentation/Theme/app_navigator.dart';
import 'package:khabar/Presentation/Theme/size_extension.dart';
import 'package:khabar/Presentation/Widgets/app_list_tile.dart';
import 'package:khabar/khabar_app.dart';

import '../../../../Theme/app_colors.dart';
import '../../../Auth/Widgets/auth_text_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  late TextEditingController _searchController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        shadowColor: AppColors.lightBackground,
        backgroundColor: AppColors.lightBackground,
        leading: IconButton(
          onPressed: () {
            pop(context);
          },
          icon: Icon(
            Icons.adaptive.arrow_back,
            color: AppColors.bodyText,
          ),
        ),
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          child: AuthenticationTextField(
            controller: _searchController,
            validator: (s) {
              return null;
            },
            label: "Search",
            suffix: const SizedBox.shrink(),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 16,
          left: 16.w,
          right: 16.w,
        ),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: 300,
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  controller: _tabController,
                  labelColor: Colors.black,
                  indicatorColor: AppColors.primary,
                  unselectedLabelColor: AppColors.bodyText,
                  tabs: [
                    Text(
                      " News ",
                      style: TextStyle(
                        color: AppColors.bodyText,
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      " About ",
                      style: TextStyle(
                        color: AppColors.bodyText,
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      " Author ",
                      style: TextStyle(
                        color: AppColors.bodyText,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const AppListTile(
                        imagePath: "assets/png/Topic Images.png",
                        title: "Europe",
                        subtitle:
                            "Ukraine's President Zelensky to BBC: Blood money being paid",
                        newsProvider: "BBC News",
                        newsProviderImagePath: "assets/png/bbc news.png",
                        ago: "14m",
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return TopicListTile(
                        imagePath: "assets/png/News Images.png",
                        isSaved: index % (Random.secure().nextInt(10) + 1) == 1,
                        title: "Health",
                        subtitle:
                            "View the latest health news and explore articles on",
                      );
                    },
                  ),
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const CircleAvatar(
                          backgroundImage: AssetImage(
                            "assets/png/bbc news.png",
                          ),
                          radius: 35,
                        ),
                        minLeadingWidth: 70,
                        title: Text(
                          "BBC News",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        subtitle: Text(
                          "1.2M Followers",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: AppColors.bodyText,
                                  ),
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: index % 3 == 0
                                ? AppColors.primary
                                : AppColors.lightBackground,
                            side: const BorderSide(
                              color: AppColors.primary,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (index % 3 == 0) ...[
                                const Icon(
                                  Icons.add,
                                ),
                              ],
                              Text(
                                index % 3 == 0 ? "Follow" : "Following",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: index % 3 == 0
                                          ? Colors.white
                                          : AppColors.primary,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }
}

class TopicListTile extends StatelessWidget {
  const TopicListTile({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.isSaved,
  }) : super(key: key);

  final String imagePath;
  final String title;
  final String subtitle;
  final bool isSaved;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 14,
      ),
      height: 100,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              imagePath,
              fit: BoxFit.fill,
              height: 70,
              width: 70,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.bodyText,
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          ElevatedButton(
            child: Text(
              isSaved ? "Saved" : "Save",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: isSaved ? Colors.white : AppColors.primary,
                  ),
            ),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: isSaved
                  ? AppColors.primary
                  : theme == ThemeMode.light
                      ? AppColors.lightBackground
                      : AppColors.darkBackground,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: const BorderSide(
                  color: AppColors.primary,
                  width: 0.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
