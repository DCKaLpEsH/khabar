// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khabar/Presentation/Screens/Profile/profile_screen.dart';
import 'package:khabar/Presentation/Screens/Selection/select_country.dart';

import 'package:khabar/Presentation/Theme/app_colors.dart';
import 'package:khabar/Presentation/Theme/size_extension.dart';

import '../Auth/Widgets/auth_text_field.dart';

class SelectSource extends StatefulWidget {
  const SelectSource({Key? key}) : super(key: key);

  @override
  State<SelectSource> createState() => _SelectSourceState();
}

class _SelectSourceState extends State<SelectSource> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  Map<String, bool> newsSources = {
    "CNBC": false,
    "VICE": false,
    "Vox": false,
    "BBC News": false,
    "SCMP": false,
    "CNN": false,
    "MSN": false,
    "CNET": false,
    "USA Today": false,
    "TIME": false,
    "Buzzfeed": false,
    "Daily Mail": false,
  };

  List<String> newsSourcesList = [
    "CNBC",
    "VICE",
    "Vox",
    "BBC News",
    "SCMP",
    "CNN",
    "MSN",
    "CNET",
    "USA Today",
    "TIME",
    "Buzzfeed",
    "Daily Mail",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Choose Your News Sources",
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            AuthenticationTextField(
              controller: _searchController,
              validator: (s) {
                return null;
              },
              label: "Search",
              suffix: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                ),
              ),
              onSubmit: (s) {},
            ),
            const SizedBox(
              height: 16,
            ),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 180,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              itemCount: newsSourcesList.length,
              itemBuilder: (context, index) {
                return NewsSourceCard(
                  title: newsSourcesList.elementAt(index),
                  isFollowing: false,
                  onTap: () {},
                  imagePath:
                      "assets/png/${newsSourcesList.elementAt(index).toLowerCase()}.png",
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarButton(
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const ProfileScreen(),
            ),
          );
        },
        label: "Next",
      ),
    );
  }
}

class NewsSourceCard extends StatelessWidget {
  const NewsSourceCard({
    Key? key,
    required this.title,
    required this.isFollowing,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final bool isFollowing;
  final String imagePath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFAFAFA),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFEEF1F4),
                borderRadius: BorderRadius.circular(6),
              ),
              padding: const EdgeInsets.all(8),
              child: CircleAvatar(
                backgroundImage: AssetImage(imagePath),
                radius: 40,
              ),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            FilterChip(
              selected: isFollowing,
              onSelected: (b) {},
              showCheckmark: false,
              label: Text(
                "Follow",
                style: TextStyle(
                  color: isFollowing ? Colors.white : AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
