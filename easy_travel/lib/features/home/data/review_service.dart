import 'dart:convert';
import 'dart:io';

import 'package:easy_travel/core/constants/api_constants.dart';
import 'package:easy_travel/features/home/domain/review.dart';
import 'package:http/http.dart' as http;

class ReviewService {
  Future<List<Review>> getReviewsByDestinationId(int id) async {
    final Uri uri = Uri.parse(
      ApiConstants.baseUrl,
    ).replace(path: "${ApiConstants.reviewsEndpoint}/$id");

    try {
      final response = await http.get(uri);
      if (response.statusCode == HttpStatus.ok) {
        List jsons = jsonDecode(response.body);
        return jsons.map((json) => Review.fromJson(json)).toList();
      }
      return Future.error('${response.statusCode}');
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
