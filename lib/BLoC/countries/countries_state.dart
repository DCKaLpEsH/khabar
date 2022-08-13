// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'countries_cubit.dart';

abstract class CountriesState extends Equatable {
  const CountriesState();

  @override
  List<Object> get props => [];
}

class CountriesInitial extends CountriesState {}

class FetchCountries extends CountriesState {}

class CountriesFetched extends CountriesState {
  final List<Country> countries;
  const CountriesFetched({
    required this.countries,
  });
  @override
  List<Object> get props => [countries];
}

class Searching extends CountriesState {}

class CountriesFetchFailed extends CountriesState {}
