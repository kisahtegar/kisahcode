import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:kisahcode/data/models/timeline_model.dart';

class NetworkRemoteDataSource {
  /// baseUrl API for emulator we can use "http://10.0.2.2:3000". `NetworkService()`.
  final baseUrl =
      "https://kisahcode-default-rtdb.asia-southeast1.firebasedatabase.app/";

  /// This function will fetching/get Timelines then return json decode as `List`
  Future<List<TimelineModel>> fetchTimelines() async {
    try {
      final response = await get(Uri.parse("$baseUrl/timelines.json"));
      debugPrint(response.body); // For Testing.
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse
            .map((data) => TimelineModel.fromJson(data))
            .toList();
      } else {
        throw Exception('Unexpected error occured!');
      }
    } catch (e) {
      debugPrint("fetchTimelines: $e");
      return [];
    }
  }
}
