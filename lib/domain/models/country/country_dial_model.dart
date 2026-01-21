// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

class CountryDialModel {
  String numCode;
  String enShortName;
  String dialCode;
  String masked;

  CountryDialModel({
    required this.numCode,
    required this.enShortName,
    required this.dialCode,
    required this.masked,
  });

  Map<String, dynamic> toMap() {
    return {
      'num_code': numCode,
      'en_short_name': enShortName,
      'dial_code': dialCode,
      'masked': masked,
    };
  }

  factory CountryDialModel.fromMap(Map<String, dynamic> map) {
    return CountryDialModel(
      numCode: map['num_code'] as String? ?? '',
      enShortName: map['en_short_name'] as String? ?? '',
      dialCode: map['dial_code'] as String? ?? '',
      masked: map['masked'] as String? ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryDialModel.fromJson(String source) => CountryDialModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  factory CountryDialModel.empty() => CountryDialModel(
        numCode: '',
        enShortName: '',
        dialCode: '+55',
        masked: '',
      );
}
