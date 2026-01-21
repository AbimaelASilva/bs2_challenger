import 'package:get_storage/get_storage.dart';
import 'package:result_dart/result_dart.dart';

class StorageService {
  StorageService({required this.box});

  final GetStorage box;

  Result<String> fetchString(String key) {
    try {
      final tokenKey = box.read<String>(key);
      if (tokenKey == null || tokenKey.isEmpty) {
        return Failure(Exception('Token not found'));
      }
      return Success(tokenKey);
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  Result<Map<String, dynamic>> fetchMap(String key) {
    try {
      final map = box.read<Map<String, dynamic>>(key);

      if (map == null) {
        return Failure(Exception('Map not found'));
      }

      return Success(map);
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  Future<Result<void>> saveString(String key, String value) async {
    try {
      await box.write(key, value);

      return Success(value);
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  Future<Result<void>> saveMap(String key, Map<String, dynamic> value) async {
    try {
      await box.write(key, value);
      return Success(value);
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  Future<Result<void>> clearKey(String key) async {
    try {
      await box.remove(key);
      return const Success(true);
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  Future<Result<void>> clearAll() async {
    try {
      await box.erase();
      return const Success(true);
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}
