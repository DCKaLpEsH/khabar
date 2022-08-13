import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../Models/countries.dart';
part 'countries_state.dart';

class CountriesCubit extends Cubit<CountriesState> {
  CountriesCubit() : super(CountriesInitial());

  Future<void> fetchCountries() async {
    final response = await http.get(
      Uri.parse(
        "https://restcountries.com/v2/all?fields=name,flags",
      ),
    );
    if (response.statusCode == 200) {
      final countries = countryFromJson(response.body);
      emit(
        CountriesFetched(countries: countries),
      );
      return;
    }
    emit(
      CountriesFetchFailed(),
    );
  }

  Future<void> searchCountry(String countryName) async {
    emit(Searching());
    final response = await http.get(
      Uri.parse(
        "https://restcountries.com/v2/name/$countryName?fields=name,flags",
      ),
    );
    if (response.statusCode == 200) {
      final countries = countryFromJson(response.body);
      print("HERE");
      emit(
        CountriesFetched(countries: countries),
      );
      return;
    }
    emit(
      CountriesFetchFailed(),
    );
  }
}
