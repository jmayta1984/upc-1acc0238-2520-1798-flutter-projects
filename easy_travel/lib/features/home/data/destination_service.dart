import 'dart:convert';
import 'dart:io';

import 'package:easy_travel/features/home/domain/destination.dart';
import 'package:http/http.dart' as http;

class DestinationService {
  final String baseUrl =
      'https://destinationapp-h4e8dvace3fqffbb.eastus-01.azurewebsites.net/api/destinations';

  Future<List<Destination>> getDestinations({String category = ''}) async {
    final String query = category == 'All' ? '' : category;
    try {
      final response = await http.get(Uri.parse('$baseUrl?type=$query'));
      if (response.statusCode == HttpStatus.ok) {
        List maps = jsonDecode(response.body)['results'];
        return maps.map((json) => Destination.fromJson(json)).toList();
      }
      return Future.error('${response.statusCode}');
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
