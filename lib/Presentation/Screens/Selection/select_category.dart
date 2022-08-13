import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khabar/Presentation/Screens/Selection/select_country.dart';
import 'package:khabar/Presentation/Screens/Selection/select_source.dart';
import 'package:khabar/Presentation/Theme/size_extension.dart';

import '../../Theme/app_colors.dart';
import '../Auth/Widgets/auth_text_field.dart';

List<String> categories = [
  "All",
  "Business",
  "Entertainment",
  "General",
  "Health",
  "Science",
  "Sports",
  "Technology",
  "Music",
  "Politics",
];

class SelectCategory extends StatefulWidget {
  const SelectCategory({Key? key}) : super(key: key);

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  Map<String, bool> category = {
    "Business": false,
    "Entertainment": false,
    "General": false,
    "Health": false,
    "Science": false,
    "Sports": false,
    "Technology": false,
    "Music": false,
    "Politics": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Choose Your Topics",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
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
              height: 17,
            ),
            Wrap(
              children: List.generate(
                categories.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: FilterChip(
                    selected: category[categories.elementAt(index)]!,
                    onSelected: (s) {
                      category[categories.elementAt(index)] = s;
                      setState(() {});
                    },
                    showCheckmark: false,
                    label: Text(
                      categories.elementAt(index),
                      style: TextStyle(
                        color: category[categories.elementAt(index)]!
                            ? Colors.white
                            : AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarButton(
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const SelectSource(),
            ),
          );
        },
        label: "Next",
      ),
    );
  }
}
