import 'package:result_dart/result_dart.dart';

import '../../core/http/http.dart';
import '../models/user_model.dart';

class UserService {
  UserService({required this.client});

  final RestClient client;

  Future<UserModel> getUser(String id) async {
    try {
      final response = await client.get('/users/$id');
      return UserModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<UserModel>> getAllUsers() async {
    try {
      final response = await client.get('/users');
      final List<dynamic> data = response.data as List<dynamic>;
      return data
          .map((json) => UserModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
