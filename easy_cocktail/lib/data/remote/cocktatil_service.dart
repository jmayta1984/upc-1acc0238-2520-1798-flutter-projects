import 'dart:convert';
import 'dart:io';

import 'package:easy_cocktail/core/constants/api_constants.dart';
import 'package:easy_cocktail/data/remote/cocktail_dto.dart';
import 'package:http/http.dart' as http;

class CocktatilService {
  Future<List<CocktailDto>> searchCocktails(String query) async {
    final Uri uri = Uri.parse(ApiConstants.baseUrl).replace(
      path: ApiConstants.searchCocktailEndpoint,
      queryParameters: {'s': query},
    );

    try {
      final response = await http.get(uri);
      if (response.statusCode == HttpStatus.ok) {
        final map = jsonDecode(response.body);
        final List jsons = map['drinks'];
        return jsons.map((json) => CocktailDto.fromJson(json)).toList();
      }
      return Future.error('Failed to get cocktails: ${response.statusCode}');
    } catch (e) {
      return Future.error('Failed to get cocktails: $e');
    }
  }
}
