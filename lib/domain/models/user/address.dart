import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String street;
  final String number;
  final String neighborhood;
  final String city;
  final String state;
  final String postalCode;
  const Address({
    required this.street,
    required this.number,
    required this.neighborhood,
    required this.city,
    required this.state,
    required this.postalCode,
  });

  Address copyWith({
    String? street,
    String? number,
    String? neighborhood,
    String? city,
    String? state,
    String? postalCode,
  }) {
    return Address(
      street: street ?? this.street,
      number: number ?? this.number,
      neighborhood: neighborhood ?? this.neighborhood,
      city: city ?? this.city,
      state: state ?? this.state,
      postalCode: postalCode ?? this.postalCode,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'street': street});
    result.addAll({'number': number});
    result.addAll({'neighborhood': neighborhood});
    result.addAll({'city': city});
    result.addAll({'state': state});
    result.addAll({'postalCode': postalCode});

    return result;
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      street: map['street'] as String? ?? '',
      number: map['number'] as String? ?? '',
      neighborhood: map['neighborhood'] as String? ?? '',
      city: map['city'] as String? ?? '',
      state: map['state'] as String? ?? '',
      postalCode: map['postalCode'] as String? ?? '',
    );
  }

  factory Address.empty() {
    return const Address(
      street: '',
      number: '',
      neighborhood: '',
      city: '',
      state: '',
      postalCode: '',
    );
  }

  @override
  String toString() {
    return 'Address(street: $street, number: $number, neighborhood: $neighborhood, city: $city, state: $state, postalCode: $postalCode)';
  }

  @override
  List<Object?> get props => [street, number, neighborhood, city, state, postalCode];
}
