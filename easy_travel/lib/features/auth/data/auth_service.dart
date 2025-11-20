import 'dart:convert';
import 'dart:io';

import 'package:easy_travel/core/constants/api_constants.dart';
import 'package:easy_travel/core/storage/secure_storage.dart';
import 'package:easy_travel/features/auth/domain/user.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<User> sigin(String email, String password) async {
    try {
      final Uri uri = Uri.parse(
        ApiConstants.baseUrl,
      ).replace(path: ApiConstants.signinEndpoint);

      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );
      if (response.statusCode == HttpStatus.ok) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        final String token = json['token'];
        await SecureStorage().save(token);

        return User.fromJson(json);
      }

      return Future.error('${response.statusCode}');
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
