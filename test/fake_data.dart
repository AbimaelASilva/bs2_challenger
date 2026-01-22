import 'package:bus2/domain/domain.dart';

UserEntity createFakeUser({String? uuid, String? first, String? last}) {
  return UserEntity(
    gender: 'male',
    name: NameEntity(title: 'Mr', first: first ?? 'John', last: last ?? 'Doe'),
    location: const LocationEntity(
      street: StreetEntity(number: 123, name: 'Main St'),
      city: 'New York',
      state: 'NY',
      country: 'USA',
      postcode: '10001',
      coordinates: CoordinatesEntity(latitude: '0', longitude: '0'),
      timezone: TimezoneEntity(offset: '0', description: 'UTC'),
    ),
    email: 'john.doe@example.com',
    login: LoginEntity(
      uuid: uuid ?? '12345',
      username: 'johndoe',
      password: 'password',
      salt: 'salt',
      md5: 'md5',
      sha1: 'sha1',
      sha256: 'sha256',
    ),
    dob: DobEntity(date: DateTime.now(), age: 30),
    registered: RegisteredEntity(date: DateTime.now(), age: 1),
    phone: '123-456-7890',
    cell: '098-765-4321',
    id: const IdEntity(name: 'SSN', value: '000-00-0000'),
    picture: const PictureEntity(
      large: 'https://example.com/large.jpg',
      medium: 'https://example.com/medium.jpg',
      thumbnail: 'https://example.com/thumbnail.jpg',
    ),
    nat: 'US',
  );
}
