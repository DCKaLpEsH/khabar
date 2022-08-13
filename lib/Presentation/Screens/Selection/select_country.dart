// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:khabar/BLoC/countries/countries_cubit.dart';
import 'package:khabar/Presentation/Screens/Auth/Widgets/auth_text_field.dart';
import 'package:khabar/Presentation/Screens/Selection/select_category.dart';
import 'package:khabar/Presentation/Theme/app_colors.dart';
import 'package:khabar/Presentation/Theme/size_extension.dart';

class SelectCountryScreen extends StatelessWidget {
  const SelectCountryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountriesCubit(),
      child: const SelectCountry(),
    );
  }
}

class SelectCountry extends StatefulWidget {
  const SelectCountry({Key? key}) : super(key: key);

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    context.read<CountriesCubit>().fetchCountries();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select a country",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 8.h,
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
                onPressed: () {
                  if (_searchController.text.isEmpty) {
                    context.read<CountriesCubit>().fetchCountries();
                    return;
                  }
                  context
                      .read<CountriesCubit>()
                      .searchCountry(_searchController.text);
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
              onSubmit: (s) {
                if (s.isEmpty) {
                  context.read<CountriesCubit>().fetchCountries();
                  return;
                }
                context.read<CountriesCubit>().searchCountry(s);
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: BlocBuilder(
                bloc: context.read<CountriesCubit>(),
                builder: (context, state) {
                  if (state is CountriesFetched) {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.countries.length,
                      itemBuilder: ((context, index) {
                        final country = state.countries.elementAt(index);
                        return ListTile(
                          onTap: () {},
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              country.flags.png,
                              fit: BoxFit.cover,
                              height: 30.w,
                              width: 50.w,
                            ),
                          ),
                          minLeadingWidth: 50.w,
                          title: Text(
                            country.name,
                          ),
                        );
                      }),
                    );
                  } else if (state is Searching) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarButton(
        label: "Next",
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const SelectCategory(),
            ),
          );
        },
      ),
    );
  }
}

class BottomNavBarButton extends StatelessWidget {
  const BottomNavBarButton({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      height: 50,
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
