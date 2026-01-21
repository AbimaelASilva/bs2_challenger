// ignore_for_file: public_member_api_docs

import 'dart:convert';

/// Return country
class CountryModel {
  /// [CountryModel] constructor

  CountryModel({
    required this.id,
    required this.country,
    required this.ddi,
    required this.coin,
    required this.coinName,
    required this.masked,
  });

  factory CountryModel.empty() => CountryModel(
        id: 0,
        country: '',
        ddi: '+55',
        coin: '',
        coinName: '',
        masked: '',
      );

  factory CountryModel.fromMap(Map<String, dynamic> json) => CountryModel(
        id: json['id'] as int? ?? 0,
        country: json['country'] as String? ?? '',
        ddi: json['ddi'] as String? ?? '',
        coin: json['coin'] as String? ?? '',
        coinName: json['coinName'] as String? ?? '',
        masked: json['masked'] as String? ?? '',
      );

  factory CountryModel.fromJson(String source) => CountryModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  int id;
  String country;
  String ddi;
  String coin;
  String coinName;
  String masked;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'country': country,
      'ddi': ddi,
      "coin": coin,
      "coinName": coinName,
      "masked": masked,
    };
  }

  String toJson() => json.encode(toMap());
}
