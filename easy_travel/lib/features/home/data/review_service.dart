import 'dart:convert';
import 'dart:io';

import 'package:easy_travel/core/constants/api_constants.dart';
import 'package:easy_travel/core/storage/secure_storage.dart';
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

  Future<void> submitReview(
    int destinationId,
    String comment,
    int rating,
  ) async {
    final Uri uri = Uri.parse(
      ApiConstants.baseUrl,
    ).replace(path: ApiConstants.reviewsEndpoint);

    final token = await SecureStorage().read();
    try {
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'destinationId': destinationId,
          'comment': comment,
          'rating': rating,
        }),
      );
      if (response.statusCode != HttpStatus.created) {
        return Future.error('${response.statusCode}');
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
