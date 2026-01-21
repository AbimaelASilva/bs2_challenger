import 'dart:convert';

import 'package:equatable/equatable.dart';

class SelectComponentModel extends Equatable {
  final String id;
  final String value;

  const SelectComponentModel({
    required this.id,
    required this.value,
  });

  SelectComponentModel copyWith({
    String? id,
    String? value,
  }) {
    return SelectComponentModel(
      id: id ?? this.id,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'value': value});

    return result;
  }

  factory SelectComponentModel.fromMap(Map<String, dynamic> map) {
    return SelectComponentModel(
      id: map['id'] as String? ?? '',
      value: map['value'] as String? ?? '',
    );
  }
  factory SelectComponentModel.empty() {
    return const SelectComponentModel(
      id: '',
      value: '',
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'SelectComponentModel(id: $id, value: $value)';

  @override
  List<Object?> get props => [id, value];
}
