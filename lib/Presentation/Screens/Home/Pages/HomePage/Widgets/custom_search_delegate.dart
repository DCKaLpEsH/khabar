import 'package:flutter/material.dart';
import 'package:khabar/Presentation/Theme/app_colors.dart';

import '../../../../../Theme/app_navigator.dart';
import '../../../../Auth/Widgets/auth_text_field.dart';

class CustomSearchDelegate extends SearchDelegate {
  final TextEditingController _searchController = TextEditingController();

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      backgroundColor: AppColors.lightBackground,
      appBarTheme: const AppBarTheme(
        toolbarHeight: 0,
        elevation: 0,
      ),
    );
  }

  @override
  PreferredSizeWidget? buildBottom(BuildContext context) {
    return AppBar(
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
          vertical: 10,
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
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const SizedBox.shrink();
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox.shrink();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox.shrink();
  }
}
