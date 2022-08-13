import 'dart:convert';

List<Country> countryFromJson(String str) =>
    List<Country>.from(json.decode(str).map((x) => Country.fromJson(x)));

class Country {
  Country({
    required this.name,
    required this.flags,
    required this.independent,
  });

  final String name;
  final Flags flags;
  final bool independent;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
        flags: Flags.fromJson(json["flags"]),
        independent: json["independent"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "flags": flags.toJson(),
        "independent": independent,
      };
}

class Flags {
  Flags({
    required this.svg,
    required this.png,
  });

  final String svg;
  final String png;

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        svg: json["svg"],
        png: json["png"],
      );

  Map<String, dynamic> toJson() => {
        "svg": svg,
        "png": png,
      };
}
