// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:khabar/Presentation/Screens/Selection/select_category.dart';
import 'package:khabar/Presentation/Theme/app_colors.dart';
import 'package:khabar/Presentation/Widgets/app_list_tile.dart';

import 'section_widget.dart';

class LatestSection extends StatefulWidget {
  const LatestSection({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final VoidCallback onPressed;
  @override
  State<LatestSection> createState() => _LatestSectionState();
}

class _LatestSectionState extends State<LatestSection>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 10,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionWidget(
          title: "Latest",
          onPressed: widget.onPressed,
          trailing: "See All",
        ),
        TabBar(
          padding: EdgeInsets.zero,
          controller: _tabController,
          isScrollable: true,
          indicatorPadding: EdgeInsets.zero,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: List.generate(
            categories.length,
            (index) => Text(
              categories.elementAt(index),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.bodyText,
                  ),
            ),
          ),
        ),
        const AppListTile(
          imagePath: "assets/png/Topic Images.png",
          title: "Europe",
          subtitle:
              "Ukraine's President Zelensky to BBC: Blood money being paid",
          newsProvider: "BBC News",
          newsProviderImagePath: "assets/png/bbc news.png",
          ago: "14m",
        ),
        const AppListTile(
          imagePath: "assets/png/Topic Images.png",
          title: "Europe",
          subtitle:
              "Ukraine's President Zelensky to BBC: Blood money being paid",
          newsProvider: "BBC News",
          newsProviderImagePath: "assets/png/bbc news.png",
          ago: "14m",
        ),
      ],
    );
  }
}
