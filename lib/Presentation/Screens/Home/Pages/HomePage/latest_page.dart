import 'package:flutter/material.dart';
import 'package:khabar/Presentation/Theme/size_extension.dart';

import '../../../../Theme/app_colors.dart';
import '../../../../Widgets/app_list_tile.dart';
import '../../../Selection/select_category.dart';

class LatestPage extends StatefulWidget {
  const LatestPage({Key? key}) : super(key: key);

  @override
  State<LatestPage> createState() => _LatestPageState();
}

class _LatestPageState extends State<LatestPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: categories.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Latest",
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
            TabBar(
              padding: EdgeInsets.zero,
              controller: _tabController,
              isScrollable: true,
              indicatorPadding: EdgeInsets.zero,
              indicatorSize: TabBarIndicatorSize.label,
              physics: const BouncingScrollPhysics(),
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
            ListView.builder(
              itemCount: 10,
              physics: const NeverScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                return const AppListTile(
                  imagePath: "assets/png/Topic Images.png",
                  title: "Europe",
                  subtitle:
                      "Ukraine's President Zelensky to BBC: Blood money being paid",
                  newsProvider: "BBC News",
                  newsProviderImagePath: "assets/png/bbc news.png",
                  ago: "14m",
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
