import 'dart:developer';

import 'package:get_storage/get_storage.dart';

import '../../core/config/app_endpoints.dart';

import '../../core/http/http.dart';
import '../models/user_model.dart';

class UserService {
  UserService({
    required this.client,
    required this.storage,
  });

  final RestClient client;
  final GetStorage storage;

  Future<UserModel> getRandonUser() async {
    try {
      final response = await client.get(AppEndpoints.randomuserApi);
      log(response.data.toString());
      return UserModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<UserModel> getUser(String id) async {
    try {
      final response = await client.get(AppEndpoints.randomuserApi);
      log(response.data.toString());
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
